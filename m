Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8BC64051E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C0899A3;
	Fri,  2 Dec 2022 10:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1680 seconds by postgrey-1.36 at gabe;
 Thu, 01 Dec 2022 09:59:53 UTC
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1516.securemx.jp
 [210.130.202.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909F10E5A3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:59:53 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 2B19VrHW026238;
 Thu, 1 Dec 2022 18:31:53 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 2B19UkNn010595;
 Thu, 1 Dec 2022 18:30:47 +0900
X-Iguazu-Qid: 34trdMalR5woI9jNY9
X-Iguazu-QSIG: v=2; s=0; t=1669887046; q=34trdMalR5woI9jNY9;
 m=IH49dAfohmLsej7fIdUfLYQd2tFeM3cHrkm0KJPe+v8=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1513) id 2B19Ucnj006296
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 1 Dec 2022 18:30:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUPaXHCZscXICOvBDbVpULe07VPosoPcdd4WywKlDblx1SUFtFrDhk2+1gyX5DC/7r4ReT/NzPbdsgliPxg5OY1QwVf1GFX1qQ7o5hGYvwKqv3tyXqp3FiZpqykfa/FNOLg6nAbleV9J2YL+LRSE4WL118XuplF1FBtxmAJG9doAviwnq6NAyk0paJBc3ezOy0N2WF23h78YaOv8GVDMrB8HMbZgjac7FqFVS6qb0v4rvDc8PFVNAOn4jmRdoXmjkfqtt7drGmBpZ+ww+FKJHipIO7Wko1GZYIWviEyHYl7EtKCZpAZTnjyE/yP50QfLATCRjqxdNyFavv3ExQrT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmwbSwjo1NT7Ntma4i2grKjtLg0W5Bkhy9WfnyKauPg=;
 b=UwsDPaleOvx7TLcAIDnnNRvWCV5GjQFFK2+sdrj7O3DnqxtGmouQW+1P7wzvObtHTnQTef+J/fMZgLmAfiKVznShRfqhTTeY0rm5dWAjiSFXqC+RG4xCvlnyrmVeVMQMwmKu92Gjtrn/nkSZsLWo/ja5KGyWZLgCJpzSYsdvGUg00gaddOlfBGClikfYwM9xflospvad8kgPb+9Wq+Cs23wT3VzGoiBubLB2+zsLO0bLu7gfMNPhnt63lui6cAg5DB0rTFCJUmvTi/l0QHAVnuCM4tZlAoM5le0jOpfDUMjm51YnJgsVZGOvAKypGZ39Lc2ktTX3UiZtZ6eJvScguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
To: <u.kleine-koenig@pengutronix.de>, <thierry.reding@gmail.com>
Subject: RE: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
Thread-Topic: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
Thread-Index: AQHZBM+gW1eqojZEm0m1ANqQO1/s465YxKbQ
Date: Thu, 1 Dec 2022 09:30:27 +0000
X-TSB-HOP2: ON
Message-ID: <TYWPR01MB94202D75C7B2B4E5DB39B77E92149@TYWPR01MB9420.jpnprd01.prod.outlook.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9420:EE_|OS3PR01MB9639:EE_
x-ms-office365-filtering-correlation-id: ea925daa-9eb2-43fc-c729-08dad37eaeb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4o/dT4unWfO9ulolRnLuIuKmSiLagW9ZQUKwd6CR3iFdCtwSnf63NVxMJ4eq3KGKsLQ54xRGO3WDtKU18pXyx2PQUe/XuVR5L9SSc2mizaFfqrUOdHAOvl/gGVMCosCLMQr2WKXaHoi8idoHG1p8G0TBHO/+GX0I4FEOspN+CT/+zdqRXK4Vn2m3AlY4SgZEUcceAHDi3Q3KD868H85HGmIrtBhGB6Y5GNHpjqqkxNI+yhAPW9aqQNTZsEf25Nc0jTKqI4M/azYiiS7Kc4ja/sIEhTbh2x2SbtxeBffmWsRHSBmVdR/jX76WWfCrEfdXIBcsUDvh5lHao6H8TuhxNyamHMlHoJjnmshyoWFIj76Btt6DJG2vLONQXA2QJ3E+PJsPbcyyz8F2aWZ/TiXXPhOCr6+O6QMZLNFrAEUQpLChNlGdM9z8KlTC2BNH5/8mqqoXEt1lwrX3PHf4okYfx5IwAISUTsTKv8Nu0tUrLzW88OVRDc+0fvNFqZw7Sl+njmzJE3vJdM4aoObqGWEyy26OsDLGJKRiRLA5TfRKzqoAYTH6vzkUa17HOdGnDiblU4Fzslm3dZpiUhoYQgLZD193RIhZvbd4Fw//riaVYPwF1rHW4yTo1m5POGGn23CQYhD3BwvtCwlB02wHBloOe0JJLoDOK2Da0T83c3IewnhbjeQttDmu/rBf9PfdEXuA3xESmxxLiTSd3aPZXhE7wvxiv3R9s21tYwCwVmFFD/c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB9420.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(71200400001)(478600001)(6506007)(7696005)(53546011)(9686003)(26005)(64756008)(66574015)(83380400001)(33656002)(54906003)(2906002)(66946007)(66446008)(66476007)(8676002)(66556008)(76116006)(4326008)(7416002)(38070700005)(186003)(7366002)(7406005)(52536014)(8936002)(110136005)(316002)(55016003)(86362001)(5660300002)(122000001)(38100700002)(41300700001)(142923001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zjlaeng4cnAxMnVTU2Y4STlLVTBCSHVPK1RjbTdWaWlSaTdobkdqRmFEblpq?=
 =?utf-8?B?aFoya0NRK0wvcFNiZkE3OFVLRUc3VldROXNvOUJQRFJWYWFCRHFqaWFueXJL?=
 =?utf-8?B?NkphbXA1U2FWeTY2TlZhcTM3eUJjN1lpd3JFM0hodnB0VVZGZ2NrUUZZZFhh?=
 =?utf-8?B?TnBJbURXQ05tTXRURmx3UnZucUdIQjc3STlablhtdUdkakFrMkp3dTEyRnVo?=
 =?utf-8?B?V092Q0RaakZQcy9YTkl4NFVvMmZCTVcvQU9NcFUvYW5kRnZQODlDanZNQUhS?=
 =?utf-8?B?QTYrakEzK01OZUxJcjU3anVzMDJLR1Y1ZUJRUUwyNzFJbDBzR2x6bERPWU01?=
 =?utf-8?B?MXl5dG9IazdXUjJaeGpnY1BRTzk5OGJOVU5veHVYck95emFYRlBUL0NJQ1Fl?=
 =?utf-8?B?L2M5NUtZdEZRdXdYZDY0NUtpeEdaMTMydVNJejBEczljbmhNOFJ0L2ROS2VG?=
 =?utf-8?B?Vk5WOGlLTzVtekQ4bHdLWHJTWmlIc0Z5N251UzZIM3RSbWoyS2V1Vlo0N2oy?=
 =?utf-8?B?TS8vMGJOaExuckZhejJOM3hJNWFnTUNOQlIyQWVVQzAzbWZFaG9wZkdMYzJ3?=
 =?utf-8?B?VDdzb0lsVGFTMG16QWphZGFiOVV1SFNpbVVON0xEdFNmVVowNmtIdFR0d2NF?=
 =?utf-8?B?QWRUaHdaRGRVa2hpUkhLb0w2L3d1aVdEM1N0M0huellvaHlEbTVSZFJkTW1L?=
 =?utf-8?B?OW1kTUFiMURWSi8wbVU3ZDkwT0M2MEY4UXFYRkZQVjl6OTArUFdXRUduZHlS?=
 =?utf-8?B?WmRyNk5uV21rMG5uVWszV0dqRFVjSG1uMXg1eXhZbWJVT1NicmN4dG0wb01D?=
 =?utf-8?B?QnJXV3RFSUR2UUJzZzQwUEVDN2tBdDVQU3QyVWNGay9YZTZPZTdsVDZGbmdi?=
 =?utf-8?B?elN0L0dnb0lFdURsb2RBTnVsTnZRS0ZiKzdMQWs5M2pyTGM1cjYvbU5IZDBE?=
 =?utf-8?B?bDRyNWdLRGc0YUdOVjBBK25WRlU1TTZqZjVUc3dZZHlWL215dm9OODQwdlJk?=
 =?utf-8?B?VGpEUC9iTFdCbGc2ajNKSS9QVkIwTkxjRXdQbTFmRE5RcVV3MlhsVzRnT0xw?=
 =?utf-8?B?QkFramUxNkFkOU4rL0tGQ3I1Vm81SVJSSEVTV2lGZSt3QnNjU2tGK0U0QU9j?=
 =?utf-8?B?WjN0K3NQOEhZYS9zTlZvRk1lYVptRExLQTUrQnE2cnVFWUZQRTRxbmR5Smxk?=
 =?utf-8?B?cHlVK0tUdFpxYlV2aURWN1llaHZCZ2habDZCSXUvMzYreXFlbU81eS82Wmhi?=
 =?utf-8?B?c1ZNRXVkaGVwS3hXUWJ4R1NSalpYd2o5UHpIWTlaY1UzMi95UGtFUlNEVklo?=
 =?utf-8?B?MlZ2a0JXVC91ZDFnSnVjVVBsWStKcGUvckhPNzlRaklEWjQ2T1ZQZENjUFNQ?=
 =?utf-8?B?aHRNWnFkMkowcDllNXJTd3dCZVdjUzZEenN0UzQ3RHBKMyt2ajZFMG5mQjlZ?=
 =?utf-8?B?RFZ1THpZcGRKN1N6WjhwcHlLNEtLV3pzMGFHMWhReUlrYU10MHlkTnpCZjdk?=
 =?utf-8?B?YzdVY3VkV0c5SDVuUVNxZHpRT0p6eHhuclJmTmpNUk9CVCs5bEhkMmxsRUkx?=
 =?utf-8?B?LzQxYjZncUZrTzB4TUpzZjMyckN3OXI5SklFemtRbks0VFFWRGdyUHFOVVJk?=
 =?utf-8?B?SzU0S1c4T1hCL3hORkVFaEFvSmlyMkNtd1dKZlU1a1JBZ2FIaFNSdDMrVG5P?=
 =?utf-8?B?aEplUTVUY0JlSTNzWkRWUnczRW9wTVRMRFBza3YwTUdvVkJ5bXBYMTlMZWkz?=
 =?utf-8?B?VUE1ZXFualgvT2x1TlJVaVdUMzV3NWtRNktBYnBtYnRtZ1Fmb3E4Y2FsK2gv?=
 =?utf-8?B?Z1NKYkZvd3hTZ2t6amNhRU1XbjlTblpIRk1tUDh0QWRuejdGQWlrZEp5VXlF?=
 =?utf-8?B?ajRDc3RKZllONEU2VHMySlNzOGY0UHlOaktXWC9qZnpZdkRzTGhkbFd3ZlRk?=
 =?utf-8?B?SGNrbzk5U1RBTDZCNDlnbklHRGt1OFBaS1lEbFJPOHZ2UnhsajlqMFVIRHdV?=
 =?utf-8?B?OFViUytXb2RaVmpwVlMwZWZ5QWJYa1NvSU5Gc1JTS1VGWUczTXhqKzl3ek92?=
 =?utf-8?B?NlBUdFVKTEVjTk4rNncvcWFaaHlpUXJzZEh6U1NXRlhZa09hcmNCWURHUVUv?=
 =?utf-8?B?MDZHTHpkUS9mdFFOYjV4ampHM3Z1ZVZBMndHSHE5Wk01N2ZaZVljVk1walRQ?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9420.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea925daa-9eb2-43fc-c729-08dad37eaeb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:30:27.6809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2hm/AD6tA55/ShWizCfpgWsRowEMFEN3PdNxEexVrYU026WSDK/xh+VKaNKzX99bPpnnAtmE+zP1MIjeEwvttFNmGa3iyfzA7C1xfD97hAepIdyRJMyJji6bGG8zw1v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9639
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 conor.dooley@microchip.com, quic_c_skakit@quicinc.com, pavel@ucw.cz,
 groeck@chromium.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 jbrunet@baylibre.com, chrome-platform@lists.linux.dev, f.fainelli@gmail.com,
 samuel@sholland.org, sean.anderson@seco.com, khilman@baylibre.com,
 brgl@bgdev.pl, michal.simek@xilinx.com, hammerh0314@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, mka@chromium.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 mcoquelin.stm32@gmail.com, martin.blumenstingl@googlemail.com,
 rjui@broadcom.com, s.hauer@pengutronix.de, swboyd@chromium.org,
 linux-gpio@vger.kernel.org, fabrice.gasnier@foss.st.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 baolin.wang@linux.alibaba.com, paul.walmsley@sifive.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 andersson@kernel.org, dianders@chromium.org, michael@walle.cc,
 palmer@dabbelt.com, kernel@pengutronix.de, zhang.lyra@gmail.com,
 shawnguo@kernel.org, claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1i
ZXIgMSwgMjAyMiAxMjoyMiBBTQ0KPiBUbzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5n
QGdtYWlsLmNvbT4NCj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+OyBMaW51cyBXYWxsZWlqDQo+IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPjsgRG91Z2xhcw0KPiBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPjsgUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Ow0KPiBDbGF1ZGl1
IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT47IE5pY29sYXMgRmVycmUNCj4g
PG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IFJheSBKdWkgPHJqdWlAYnJvYWRjb20uY29tPjsg
U2NvdHQNCj4gQnJhbmRlbiA8c2JyYW5kZW5AYnJvYWRjb20uY29tPjsgQnJvYWRjb20gaW50ZXJu
YWwga2VybmVsIHJldmlldyBsaXN0DQo+IDxiY20ta2VybmVsLWZlZWRiYWNrLWxpc3RAYnJvYWRj
b20uY29tPjsgQmVuc29uIExldW5nDQo+IDxibGV1bmdAY2hyb21pdW0ub3JnPjsgR3VlbnRlciBS
b2VjayA8Z3JvZWNrQGNocm9taXVtLm9yZz47IFNoYXduDQo+IEd1byA8c2hhd25ndW9Aa2VybmVs
Lm9yZz47IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47DQo+IFBlbmd1dHJv
bml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtDQo+
IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+
OyBLZXZpbg0KPiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPjsgSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+Ow0KPiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPjsgTWF0dGhpYXMNCj4gQnJ1Z2dlciA8bWF0dGhpYXMu
YmdnQGdtYWlsLmNvbT47IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPjsN
Cj4gSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT47IFBhbG1lciBEYWJiZWx0DQo+IDxw
YWxtZXJAZGFiYmVsdC5jb20+OyBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5j
b20+Ow0KPiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPjsgT3Jzb24gWmhhaSA8b3Jz
b256aGFpQGdtYWlsLmNvbT47DQo+IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGli
YWJhLmNvbT47IENodW55YW4gWmhhbmcNCj4gPHpoYW5nLmx5cmFAZ21haWwuY29tPjsgRmFicmlj
ZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Ow0KPiBNYXhpbWUgQ29xdWVs
aW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+OyBBbGV4YW5kcmUgVG9yZ3VlDQo+IDxhbGV4
YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPjsgQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPjsg
U2FtdWVsDQo+IEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+OyBIYW1tZXIgSHNpZWgNCj4g
PGhhbW1lcmgwMzE0QGdtYWlsLmNvbT47IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg
4pah77yz77y377yj4pev77yh77yjDQo+IO+8tCkgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJh
LmNvLmpwPjsgU2VhbiBBbmRlcnNvbg0KPiA8c2Vhbi5hbmRlcnNvbkBzZWNvLmNvbT47IE1pY2hh
bCBTaW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+Ow0KPiBCam9ybiBBbmRlcnNzb24gPGFu
ZGVyc3NvbkBrZXJuZWwub3JnPjsgU3RlcGhlbiBCb3lkDQo+IDxzd2JveWRAY2hyb21pdW0ub3Jn
PjsgTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+OyBTYXR5YQ0KPiBQcml5YSA8
cXVpY19jX3NrYWtpdEBxdWljaW5jLmNvbT47IGxpbnV4LXB3bUB2Z2VyLmtlcm5lbC5vcmc7DQo+
IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOw0KPiBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOw0KPiBjaHJvbWUtcGxhdGZvcm1AbGlzdHMubGludXguZGV2OyBsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LXJwaS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGlu
dXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsgbGlu
dXgtc3VueGlAbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwMS8xMV0gcHdt
OiBNYWtlIC5nZXRfc3RhdGUoKSBjYWxsYmFjayByZXR1cm4gYW4gZXJyb3INCj4gY29kZQ0KPiAN
Cj4gLmdldF9zdGF0ZSgpIG1pZ2h0IGZhaWwgaW4gc29tZSBjYXNlcy4gVG8gbWFrZSBpdCBwb3Nz
aWJsZSB0aGF0IGEgZHJpdmVyIHNpZ25hbHMNCj4gc3VjaCBhIGZhaWx1cmUgY2hhbmdlIHRoZSBw
cm90b3R5cGUgb2YgLmdldF9zdGF0ZSgpIHRvIHJldHVybiBhbiBlcnJvciBjb2RlLg0KPiANCj4g
VGhpcyBwYXRjaCB3YXMgY3JlYXRlZCB1c2luZyBjb2NjaW5lbGxlIGFuZCB0aGUgZm9sbG93aW5n
IHNlbWFudGljIHBhdGNoOg0KPiANCj4gQHAxQA0KPiBpZGVudGlmaWVyIGdldHN0YXRlZnVuYzsN
Cj4gaWRlbnRpZmllciBkcml2ZXI7DQo+IEBADQo+ICBzdHJ1Y3QgcHdtX29wcyBkcml2ZXIgPSB7
DQo+ICAgICAgICAgLi4uLA0KPiAgICAgICAgIC5nZXRfc3RhdGUgPSBnZXRzdGF0ZWZ1bmMNCj4g
ICAgICAgICAsLi4uDQo+ICB9Ow0KPiANCj4gQHAyQA0KPiBpZGVudGlmaWVyIHAxLmdldHN0YXRl
ZnVuYzsNCj4gaWRlbnRpZmllciBjaGlwLCBwd20sIHN0YXRlOw0KPiBAQA0KPiAtdm9pZA0KPiAr
aW50DQo+ICBnZXRzdGF0ZWZ1bmMoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rl
dmljZSAqcHdtLCBzdHJ1Y3QNCj4gcHdtX3N0YXRlICpzdGF0ZSkgIHsNCj4gICAgLi4uDQo+IC0g
IHJldHVybjsNCj4gKyAgcmV0dXJuIDA7DQo+ICAgIC4uLg0KPiAgfQ0KPiANCj4gcGx1cyB0aGUg
YWN0dWFsIGNoYW5nZSBvZiB0aGUgcHJvdG90eXBlIGluIGluY2x1ZGUvbGludXgvcHdtLmggKHBs
dXMgc29tZQ0KPiBtYW51YWwgZml4aW5nIG9mIGluZGVudGlvbnMgYW5kIGVtcHR5IGxpbmVzKS4N
Cj4gDQo+IFNvIGZvciBub3cgYWxsIGRyaXZlcnMgcmV0dXJuIHN1Y2Nlc3MgdW5jb25kaXRpb25h
bGx5LiBUaGV5IGFyZSBhZGFwdGVkIGluIHRoZQ0KPiBmb2xsb3dpbmcgcGF0Y2hlcyB0byBtYWtl
IHRoZSBjaGFuZ2VzIGVhc2llciByZXZpZXdhYmxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KPHNuaXA+
DQoNCj4gYS9kcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyBiL2RyaXZlcnMvcHdtL3B3bS12aXNj
b250aS5jIGluZGV4DQo+IDkyN2M0Y2JiMWRhZi4uZTNmYjc5YjNlMmE3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYw0KPiArKysgYi9kcml2ZXJzL3B3bS9wd20tdmlz
Y29udGkuYw0KPiBAQCAtMTAzLDggKzEwMyw4IEBAIHN0YXRpYyBpbnQgdmlzY29udGlfcHdtX2Fw
cGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwNCj4gc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwNCj4g
IAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCB2aXNjb250aV9wd21fZ2V0X3N0
YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0DQo+IHB3bV9kZXZpY2UgKnB3bSwNCj4g
LQkJCQkgICBzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSkNCj4gK3N0YXRpYyBpbnQgdmlzY29udGlf
cHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdA0KPiBwd21fZGV2aWNl
ICpwd20sDQo+ICsJCQkJICBzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSkNCj4gIHsNCj4gIAlzdHJ1
Y3QgdmlzY29udGlfcHdtX2NoaXAgKnByaXYgPSB2aXNjb250aV9wd21fZnJvbV9jaGlwKGNoaXAp
Ow0KPiAgCXUzMiBwZXJpb2QsIGR1dHksIHB3bWMwLCBwd21jMF9jbGs7DQo+IEBAIC0xMjIsNiAr
MTIyLDggQEAgc3RhdGljIHZvaWQgdmlzY29udGlfcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2No
aXANCj4gKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20NCj4gIAkJc3RhdGUtPnBvbGFyaXR5
ID0gUFdNX1BPTEFSSVRZX05PUk1BTDsNCj4gDQo+ICAJc3RhdGUtPmVuYWJsZWQgPSB0cnVlOw0K
PiArDQo+ICsJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwd21f
b3BzIHZpc2NvbnRpX3B3bV9vcHMgPSB7IGRpZmYgLS1naXQNCg0KPHNuaXA+DQoNCmZvciB0aGUg
VmlzY29udGkgcHdkOg0KUmV2aWV3ZWQtYnk6IE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1aGlybzEu
aXdhbWF0c3VAdG9zaGliYS5jby5qcD4NCg0K

