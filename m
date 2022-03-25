Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0AC4E7446
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C67C10EC31;
	Fri, 25 Mar 2022 13:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6D210EC2E;
 Fri, 25 Mar 2022 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648215284; x=1648820084;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XgeodunKBVzo807U06t0qmI9iePpnYMdSr/7xR8P5hE=;
 b=B7iQTPrtFG15IXmvi90mvXY9w3ljpRzwFjplcJ4mPaqSfP4mZiJyftSS
 pxoXg8BdFmmVV7vBdUvRo2sDDMZJTA3RMMncMP225KhdkDGnGA3r9w2U+
 5AppMWA6Lir2ot148iJJlP4YY+0cLWbJUopHDz85FG8sDhCmOxD+KfLFk g=;
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAhIoH1wylLUWcr5UnONA77dysVXiVsGeWSAkgrMR2E7ms/IwB3hYBumkTfD2nn29TCMpSS5WhtrI1u3xbk/LpyEsfJGSE48v5CLf+74MLawXxgWNiZU2V0TRx2AHWm0+FhBSzrtEYxpfZXFmaKuCixAeKafdeNzwhuwyDilJeVAGnARovrb8m8xWFg8mqI56MoyBQEBcnEolJRp/gCduuI/ZcY867vojkhSn0JMoFdaBJ+9x0pxSube+eOVza0cfgBnyfTDk2JdmuCUQorkwKDGEQcmfxnFdUJatQ+Mh3Trxomqfx8AO5YUOkdDHro4NYuSq/oGpG2KI/KvsF+mEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgeodunKBVzo807U06t0qmI9iePpnYMdSr/7xR8P5hE=;
 b=EkYhsWnpK7bXqHFho5t9xC0jm9eM+7cFK5/aJuAfaGHESJsEFIrEVANjX0mcY0KQJ7cs3/kZEDSyepx/0PDCXbCJK9vB3mYCT593NJzg28B6nvgPWzMuQ3GL+mwTYTOOkDK9DLZk4hopaXzXPcPQiNNTU1m/YL56lSs1vJd7dQQowwBRNnfbIvpoUOMn8FkZoaiJkDVS+lJ2zlSb9X1VQMyE0JunWYmAfuAssjfGbotRItTbvyWYXf1CV3hk7sDHq0nX0QyOaFRFLCEfzD9uv3QrKO6pJD8ct8piSkqBd9u3dNwfF8rpVnRKjpXQD4JhVN1nkSurOOFp2UPYXTMFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SA1PR02MB8431.namprd02.prod.outlook.com (2603:10b6:806:1f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 13:34:40 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 13:34:40 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 3/9] arm64: dts: qcom: sc7280: Enable backlight for eDP
 panel
Thread-Topic: [PATCH v5 3/9] arm64: dts: qcom: sc7280: Enable backlight for
 eDP panel
Thread-Index: AQHYOVxuIZ19OwLuSUu1QGc2ot2ioazEGSWAgAwOR9A=
Date: Fri, 25 Mar 2022 13:34:40 +0000
Message-ID: <MW4PR02MB71864E9A6E13A9E7F2C1686BE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-4-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n51SCm2HJ4O-DPJy3zKLrbgn9EFQbYPkzJDyqNncnC=4mA@mail.gmail.com>
In-Reply-To: <CAE-0n51SCm2HJ4O-DPJy3zKLrbgn9EFQbYPkzJDyqNncnC=4mA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7f7f838-01a4-409f-b52b-08da0e6436cd
x-ms-traffictypediagnostic: SA1PR02MB8431:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SA1PR02MB8431369837259F7A470A9AAD9D1A9@SA1PR02MB8431.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IBII5NCrSu8w/A7z5Kxsibyfwewn8JXlw/mTGFYUYtlVcKgRv3aTHFwXVUiYyw6ynicCHURzejA1AuufIw27bQzbx11vscD0TUIiLMxeVRbwdH9NPg80zacBrQZTUsVhnvAGUqN2kCllmpAgmIiT1t2qPWTByNDIaxgnySGH8+aUDOOojRe2bJKVWPHKzNwqCA3qt0DvkytGeGXPuLjtAvHzliO7nvfG+cqzKBTve+tcXkYsHzu1WmP2uS3C5jnphD944jdgVuT+PCCliOrGo6/9ZcfFpYnbvtgXC0LFlPf1q6xVk9VkzTYExF/0xCcvAxiJHOP5ToCQXQj16n2LLtqUc+tEPPnNzVnUhOroSp/2H7GL+lCPREhQxQqBecNVfU82cYYNRRy91ggeZL1uRwKYuOYan0LTgfFjsze1+6QHdeBxbYJiF+m2q0UFxEpGkphjxg8uNc9qISTT5rKokHSqPQjg93yZKlePFvBJlgJ8UHGElkM29XLkLaA668RFAnkcYMAVZp3/G3hGhfIbsEY8bcLxyuDnJCNQYZBJKf+gvFuzm6uWEjbUVpmQDskSXp6vZ4g81lOF65BAjY9SU9rWHjy4xO4/r7BDUzN/D/v8xeFkvRNiS09TZ7zY4R1uPNJnZSl0erSmv3pFNfNyiVwxabivbjLFyBddYL9xjhh7BLBSY1ZiXhSP55ZKoaYvasTPMYcPLoMvI9JnvNJaVYyLkHNwzyynMqMxXRCDNXb47Q9lkxZaKb/AMSmpOFTIYFAq2linQ4dkDCdw7pamSq7kYf0eNLCnqNWARqgS2g4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(2906002)(53546011)(5660300002)(83380400001)(7696005)(66946007)(66446008)(6506007)(66476007)(66556008)(316002)(186003)(38100700002)(26005)(508600001)(38070700005)(8936002)(107886003)(4326008)(33656002)(966005)(52536014)(8676002)(54906003)(86362001)(55016003)(110136005)(9686003)(71200400001)(76116006)(64756008)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1JlaUZlRlFqRVJPam9qY01YeE5kRGVhMmlpU0FUcktMNXlnWTJ2azNhd2NW?=
 =?utf-8?B?MmIxSUdsazRQVUN0YTZGTmFSYVVWQk54bmpua1J6bXMzbW1DR1VlVHBEeHFs?=
 =?utf-8?B?d3d1STYxYWJ4bUNURkM4d3hqejJuSjh5dFordFZtWWFVWUYzc0dBVEFhcmtp?=
 =?utf-8?B?QkxHcnMyR3J5QVlKVzF3SW5qbDgxN092Z08zRHl1MldaSnlmL2NqMllseHhV?=
 =?utf-8?B?OWxZRmovaXk2V3grTDJQUVVpN0luUDdaN1MyMlZqOTVmVzNNUlY4Sy91TXQ0?=
 =?utf-8?B?bWZCZ0lHLzhzd0QwcXN3QzA5TDdWbXdjblAxbjNDcEZURGNxYUlVMkVYdCtF?=
 =?utf-8?B?ME5Qc0tmVHVpbWxlaHJqN0VMR0NWSy83S3dlbG1jbUxVSzdSTDZiQnBJbnBw?=
 =?utf-8?B?NlBTNnc3NUVlTHRaSHNucVVFazVIRFVhZXU0UFlXUUN2dmZlRzFxUjJxL1dG?=
 =?utf-8?B?N2RkbFUxaVprWktBbHROazUvd0luODFpdDRENHcyT1YyTGhTdDVqZjd2VlpH?=
 =?utf-8?B?bmdEQ0ZHNE5HcjNhQ3JIY1RVTjR1cDNzNVI0UERlQ0dXQjRubHViYk9LaXNG?=
 =?utf-8?B?R2VhSEJHcTJVb0s3VTlWeGd4S3l6Tzl2QmFhWXBYSDlrNGRnb1V3Uno3VDVl?=
 =?utf-8?B?clcvV0hsR0Y4bGJuSGMzL3VpZXNBbEtMQU41NkhIRDk5MGRQS3RPUkhuUHli?=
 =?utf-8?B?VFlnVkRkSWtSdW9nakRYS1A1OW1jVDZBd1hHdW1KaTlra2NPVWdaMkhpYm9N?=
 =?utf-8?B?VnVpM0Y5eWVuclNvdm5ZTHhBaSt1OGw1RncxamJ5TnhKZ3QyZTlhOHQ0WlEx?=
 =?utf-8?B?a2FtV2hrb0R1RGp5ZWxiSkd2MUNodHFOdUlxTWtZc2JDSE1aTDNnZWM0YU5E?=
 =?utf-8?B?SEgveVhKUmlRbkVSckxrMm9ReW5BWnQ2bHRqaEd3ZGZXL3JLVXRwN01vQ0FJ?=
 =?utf-8?B?WFRTMkFRTTVBS3AwNXY5VW1nVTZHdnZ1emQzdFNqeHRDb3MwcW9KaVBjYmpi?=
 =?utf-8?B?REJwbGxQZ2hjaG1mQit5ZitBYTZDVnZRb2NFbUtoZVYyWUtMd3VNRWNYZis4?=
 =?utf-8?B?cldja2V2TUV5cEo3TkhpSmFaY09LWnh5ODU2aUFJQUNqY05ZemZTVmpiSTZr?=
 =?utf-8?B?aDhrM0NMRlNUN1B2OEJQa0UwWkM1K09XL2lFZHNKNnR0WmJWM0xBbDhuYVhE?=
 =?utf-8?B?bEkrSHUrRTZHd0h3WnhMT2JlSFQ3b3dBbWhVTjNzREFOSlZBQ3B3Q3lYVHh6?=
 =?utf-8?B?SjRLcHluYTF1ZWFJZ2xWRlhkMThZSVpkazFEUlF2dVNaeTdsTURvem4yZjh0?=
 =?utf-8?B?SVpmTTJWMjB4bGh1QUdYWnBDYjZ1eFB4RjN1Wkh0ZXFKTTYvT0JMSy90NFcz?=
 =?utf-8?B?RU1yVFJiRFBwSjlibGZtVDVERExMWVNZT1dGdHA3NVgvY1ZYOVBZd0dMSktT?=
 =?utf-8?B?NGpoblJNeUk0UEpGaDB3dHE1NE84ZFZHOUtXSFhBR0lsU0lIODEvVndWR09s?=
 =?utf-8?B?VTZWa2dERG0zOHQwaThiYmp3Tm1XdXhFWEYwMTE4cXJVRGxVdk94bzVMVnFJ?=
 =?utf-8?B?cUZDL3plR3BUeVhXeU9RdVBJbUZSUlVnWEVyaEJqYnR3WjdFMU95SjFvN0JL?=
 =?utf-8?B?R2JyM3J6SGF1UjhkTmxOUkNEQVlrYjQ2WmN2Y1pmZ2VlZW5kb1JQWlZqU1ZL?=
 =?utf-8?B?cDdZUnZuem9GSUZkakJUWkp5SHNKVXlXck9EanduL1E2SFkreFZsOWtkUDk4?=
 =?utf-8?B?YkNwVThYZGloMnFlZzlkelZ5dG1LeWY0RmN3REJqZ1JQYSs5MGRpQndubmxu?=
 =?utf-8?B?ckxJaWpYMTdORk1NSWNPcWQ1NHpYN1U4TFd6OUxpZ0FydnEySk9HbFptNklk?=
 =?utf-8?B?bDY0MXREdWhDSXBiRFZiRHZ5TEJuaFViemx1YUtBOUdraW85NFBoVng3dk9G?=
 =?utf-8?B?V1NwWld0Z2U5UmdSKzFsRG1RVnRoek8vU05hVUZ0bGlqVFVGZHBWT0RzeHM5?=
 =?utf-8?B?bVlIakR6TC9lTGo4aHg4N0E2bEF1WFJaUzRLTkE1cTN0YWsrdElJNHJHVmF6?=
 =?utf-8?B?Y2J4QmwwcmtVbDdrWEd4ayt5bnZneVo3Z2l6dDFaaVhpNS8zMTRWZjRVVVlV?=
 =?utf-8?B?WE5VYTNyc3JBLyt2SFJkVm83RlVFRTRINXl2Q0hEWXVCY3o3UjZ5dXdhaytj?=
 =?utf-8?B?cjVNdk00TlRxUFE4QWgwblNuVDlRUTRyanlGWDJDY29sQzNvZUp0SXBoWlhT?=
 =?utf-8?B?Y1psYnVQbUxIRjl5anQ2enRacFlhM1cyRVdtR3ZMd2tUU1hCS254UnRCMUZk?=
 =?utf-8?B?SVBIS1grWVZVTG9RbmxUa2pLazZCaTZxeUpUQU1qUXNtdkR0eFZDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f7f838-01a4-409f-b52b-08da0e6436cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 13:34:40.3597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xl62bvtAaNA0KWZVm3NDH70wP26MKikZTb9qE9gVPKiokxtmMrwghMIJEwe6RIt8x+U0xFrIAIrju9x2A1iQqNQZPSH7++zrWpFlJfAmwpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8431
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE4LCAyMDIyIDI6NTgg
QU0NCj4gVG86IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKSA8cXVpY19zYmlsbGFrYUBxdWlj
aW5jLmNvbT47DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOw0KPiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51
eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCj4gQ2M6IHJvYmRjbGFya0BnbWFpbC5jb207IHNlYW5wYXVsQGNocm9taXVtLm9yZzsgcXVp
Y19rYWx5YW50DQo+IDxxdWljX2thbHlhbnRAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChR
VUlDKQ0KPiA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IGRpYW5kZXJzQGNocm9taXVtLm9y
ZzsgS3VvZ2VlIEhzaWVoDQo+IChRVUlDKSA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+OyBhZ3Jv
c3NAa2VybmVsLm9yZzsNCj4gYmpvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc7IHJvYmgrZHRAa2Vy
bmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBzZWFuQHBvb3JseS5ydW47IGFpcmxpZWRA
bGludXguaWU7IGRhbmllbEBmZndsbC5jaDsNCj4gdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tOyBz
YW1AcmF2bmJvcmcub3JnOw0KPiBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc7IHF1aWNfdnBy
b2RkdXQgPHF1aWNfdnByb2RkdXRAcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMy85XSBhcm02NDogZHRzOiBxY29tOiBzYzcyODA6IEVuYWJsZSBiYWNrbGlnaHQgZm9yDQo+
IGVEUCBwYW5lbA0KPiANCj4gUXVvdGluZyBTYW5rZWVydGggQmlsbGFrYW50aSAoMjAyMi0wMy0x
NiAxMDozNTo0OCkNCj4gPiBFbmFibGUgYmFja2xpZ2h0IHN1cHBvcnQgZm9yIGVEUCBwYW5lbCBv
biBDUkQgcGxhdGZvcm0gZm9yIHNjNzI4MC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmtl
ZXJ0aCBCaWxsYWthbnRpIDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+
DQo+ID4gQ2hhbmdlcyBpbiB2NToNCj4gPiAgIC0gU2VwYXJhdGUgb3V0IGJhY2tsaWdodCBub2Rl
cw0KPiA+DQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAtY3JkLmR0cyB8IDE4
ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAt
Y3JkLmR0cw0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC1jcmQuZHRzDQo+
ID4gaW5kZXggMmRmNjU0ZS4uMTZkMWE1YiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vc2M3MjgwLWNyZC5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3Fjb20vc2M3MjgwLWNyZC5kdHMNCj4gPiBAQCAtMzcsNiArMzcsMTUgQEANCj4gPiAgICAgICAg
ICAgICAgICAgcGluY3RybC0wID0gPCZlZHBfcGFuZWxfcG93ZXI+Ow0KPiA+ICAgICAgICAgfTsN
Cj4gPg0KPiA+ICsgICAgICAgZWRwX2JhY2tsaWdodDogZWRwLWJhY2tsaWdodCB7DQo+IA0KPiBE
b2VzIHRoaXMgYWxzbyBtb3ZlIHRvIHFjYXJkLmR0c2k/IFdoeSBjYW4ndCB0aGlzIGJlIGNvbWJp
bmVkIHdpdGggdGhlDQo+IHByZXZpb3VzIHBhdGNoPw0KPiANClRoZSBub2RlcyByZWxhdGVkIHRv
IHB3bSBhcmUgZGVwZW5kZW50IG9uDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtYXJtLW1zbS9saXN0Lz9zZXJpZXM9NjIwMTI3JnN0YXRlPSoNCg0KV2UgbW92ZWQg
dGhlbSB0byBkaWZmZXJlbnQgcGF0Y2ggc28gdGhhdCB0aGUgb3RoZXIgcGF0Y2ggY2FuIGJlIG1l
cmdlZCB3aXRob3V0IGRlcGVuZGluZyBvbiBhYm92ZSBzZXJpZXMuIEkgd2lsbCByZWFycmFuZ2Ug
dG8gZ2V0IGJhY2tsaWdodCBkZWZpbml0aW9ucyBhbHNvIGhlcmUuDQoNCj4gPiArICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIHBvd2VyLXN1cHBseSA9IDwmdnJlZ19lZHBfYnA+Ow0KPiA+ICsgICAgICAgICAgICAg
ICBwd21zID0gPCZwbTgzNTBjX3B3bSAzIDY1NTM1PjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICAgIGVuYWJsZS1ncGlvcyA9IDwmcG04MzUwY19ncGlvcyA3IEdQSU9fQUNUSVZFX0hJR0g+Ow0K
PiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4gICAgICAgICB2cmVnX2VkcF9icDogdnJlZy1lZHAt
YnAtcmVndWxhdG9yIHsNCj4gPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0
b3ItZml4ZWQiOw0KPiA+ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2cmVnX2Vk
cF9icCI7IEBAIC0xMjMsNyArMTMyLDkgQEANCj4gPiBhcF90c19wZW5fMXY4OiAmaTJjMTMgew0K
PiA+ICAgICAgICAgICAgICAgICBlZHBfcGFuZWw6IGVkcC1wYW5lbCB7DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJlZHAtcGFuZWwiOw0KPiA+DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYmFja2xpZ2h0ID0gPCZlZHBfYmFja2xpZ2h0PjsNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBwb3dlci1zdXBwbHkgPSA8JmVkcF8zdjNfcmVndWxhdG9yPjsN
Cj4gPiArDQo+IA0KPiBOaXRwaWNrOiBSZW1vdmUgdGhpcyBuZXdsaW5lIGZyb20gdGhpcyBodW5r
IGFuZCBwdXQgaXQgaW4gd2hlbiBwb3dlci1zdXBwbHkNCj4gaXMgaW50cm9kdWNlZC4NCj4gDQoN
Ck9rYXksIHdpbGwgbWFrZSB0aGF0IGNoYW5nZS4NCg0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHBvcnRzIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47IEBAIC0xNzIsNiArMTgzLDEzDQo+ID4gQEAgYXBfdHNfcGVuXzF2ODogJmky
YzEzIHsNCj4gPiAgICAgICAgIH07DQo+ID4gIH07DQo+ID4NCj4gPiArJnBtODM1MGNfcHdtIHsN
Cj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZlZHBfYmxfcHdt
PjsNCj4gDQo+IEkgc2VlIHRoZSBwaW5jdHJsIGlzIHVzZWQgbm93IGJ1dCBpdCB3b3VsZCBiZSBl
YXNpZXIgdG8gcmV2aWV3IHRoaXMgcGF0Y2ggaWYgdGhlDQo+IHBpbmN0cmwgd2FzIGluIHRoaXMg
cGF0Y2guDQoNCk9rYXkuIEkgd2lsbCByZWFycmFuZ2UgdGhlIGh1bmtzIGZyb20gdGhpcyBhbmQg
dGhlIHByZXZpb3VzIHBhdGNoLg0K
