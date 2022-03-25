Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D84E7926
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 17:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FB010E22C;
	Fri, 25 Mar 2022 16:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C40610E22C;
 Fri, 25 Mar 2022 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1648226690; x=1648831490;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2jeIWew5id7fq0zl8DWnS8zStbrYhvy+Fg6AWbQ8bHI=;
 b=Br5yN5QAxf7Mel9ZmEXLKEIlVreUhLuwPHShljbVrKwI7Jbin842qOSQ
 9gYsWQYgfWy9qqciRbeYPd1epGHIwVyArtXMynaLaJefPYZXkaUE0sXQ3
 HLx8xflVZfmI1pzhjwe2AYuXH9JXm/nvfJ+zVTIqgZfcBMySMVj3/Y/ZD w=;
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 16:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK+4Fyyil55++tny8PdLoisu5ynTuu/iHTUfJAhOZxw4jMl1/E0/GrHBBhpkctbWo8baKPJhM5V0amtM6eWRyoCadBqd46PI1a18cOE5U/1eab8Bx/Dw/MrLfryHaKXa+R6BOTwX2wXDtot7GiQW+bYdZbNEP/8QKnSYEQTfPbcny+TRV3lU/it8JFgV0L6pdlnyWQi15homJXsbPuxdQyL4RmeThArUOyO+tzOzi69DPC/fi0+0WXhdq9/Q+5rRqyeGGdL3EeXtj6bVHwBejGSBYSuoMaknFX53EUUBRv6LRKhiaoFRcoAb5Db9Eo6YRfXA0aiAk8JjuIXo+UetEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jeIWew5id7fq0zl8DWnS8zStbrYhvy+Fg6AWbQ8bHI=;
 b=RMtrAFR1ZX6phSfsKhLtXb2BeBJNFFfpgGXycyZnYjblIk00+jGnvLAdNymyzujzWmSvRRqX0iake+Qsn5aR1TbdAitc+HIP1hyHW5HC7H8r2VgVkIQtGF02HhJ8J/XhCL7m4RidzqtME616YoF3wit/Wqjl6dIbRxsfWB4/G9ELBZeZC6VX1d4xacrk9CSVFWOiZqqCuOvcEs62eEuyvLahfU6/WQybuheTEX4HZB33yFau4thxfWmvFW8KfAtYOrj8iBHPbHOWveh6BAp/P1Z/z4FMKbBBQbgeBBP7SRRryovjBmMU3O4RKF0AlNlEBQVm4JKwcyyAEnGLqrfadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BN0PR02MB8175.namprd02.prod.outlook.com (2603:10b6:408:163::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 16:44:45 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 16:44:45 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
Thread-Topic: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
Thread-Index: AQHYOVx+t0EmYfmqg0GDDNP8bx6Q7qzEWZ+AgAD84oCAAEEEgIAAHHuAgAAYzgCAAAgHAIAKeYQwgAADU4CAAApkIA==
Date: Fri, 25 Mar 2022 16:44:45 +0000
Message-ID: <MW4PR02MB718609FAD35F1B6DCCE7FDF7E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
 <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
 <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
 <CAE-0n52v2m4U0wK6NYf4KBwXmp+TEVhjnGpW4rQHuZSf7TYfgA@mail.gmail.com>
 <CAD=FV=WFkXdXVdqhBcfa48JKcUcbUe2M0bW6-V8zjP8jgvjvHA@mail.gmail.com>
 <MW4PR02MB7186835E0D762E51EB9F9515E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=UDXScN6vt9PTe0YnoDGQmY-cja3wVyV9D1zJxyPwCMRQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UDXScN6vt9PTe0YnoDGQmY-cja3wVyV9D1zJxyPwCMRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e92b567d-7972-43da-8f56-08da0e7ec4af
x-ms-traffictypediagnostic: BN0PR02MB8175:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN0PR02MB817539AE4C965DA6D4BA54DDE11A9@BN0PR02MB8175.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ozBDTAVXwOniH5NN7dkMhvcp1ImAtobsUAE1R1DJ1DlYOuTWPmw3lm4f3+trN0EsQYLKXBkC4g0Z899aP/bKKfZhI8NnfoeWOyWd97KfR5PwBo3DlcNiFrPWOigzGt8YAvFVfcrFhl8gGDf8+nCod6Otb0454ODfmOcZ9krJH4YVfeuZL9j9yfa/lX0A628//KYyoT0w8UXGPFhnfk46TcBZKGYM6SFhUiYjpdzKC+8L2buA0QkKaw2j3uJgn1EHwnmDOtvAuopeCQcCg+ddWNZaRwHQWLEOjDdm0qJxkyX8aTHRZ+4yxi1qezufmf6NtZHDDJSMe4D2JW9T35dw38zsH2B607wd2WkyuDSxiVbQTm4ZP/EbGdf9DckBq4M+1bugQ605NMNGd1qBAToDlrhXWTVygC2bnFCpr+kbVWOaPkFLGLS2f4R6XFJ1gN0wNabV0DN6KTjs/KKfb5DdlWYvlcHN+Je7t83o4G1vp4tO/mllUk8zuxtuGQZ6p82kJVc5forL3szednpeXAMuCF7iLibUsVm1MIjcMdkf5yK4aJUTOFmShA9DVY8PWnoCSqmNdaIp+6eX1uOmRxrLaqybonwjTavpJreFKxB06pro/H7it7stO2Qgi2OTgeKnz6w0Q8lJeQ692PpRMzp725T0+E1A5AkMzyzo7q193h5y3x5nhEJmtCmYMYZ662JV4CPQBpdoQI7tfxBWh4ArOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(7416002)(83380400001)(52536014)(122000001)(6506007)(316002)(54906003)(186003)(110136005)(26005)(508600001)(9686003)(71200400001)(38100700002)(38070700005)(4326008)(8676002)(7696005)(53546011)(66946007)(64756008)(66446008)(66556008)(76116006)(66476007)(86362001)(33656002)(55016003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFI0ZlhnMmpBWTgxRENpZGM0aWF2Nm52dkp2cjdUUWIyWm5tdFdVcDVlWWwx?=
 =?utf-8?B?TzJyUVVSVHpscG5UaDNsZ3BSQmpjdER6MGpOeC9WUlpEbEFQVlRDeVR1ZHFK?=
 =?utf-8?B?bzg5a1lUYno3L0lCOVdjQTZoOHZ5ZUxxMjA2Kzc5clMvd2xvVzZ1aVRCcHMy?=
 =?utf-8?B?eHBxRUNFRVY4YWo5Y0tvRWlYbm9yU1FjL3RUaGg4aGRoNlNoaVlKK3FQV1dv?=
 =?utf-8?B?ajF4bUpxYXJubldZWDRSa0xIU3k1a1RHdUgyRjNlaG1hQldZY0ZvYTlXSkpu?=
 =?utf-8?B?MHN1a0M0Vmh1OFB5TVZ6TXIrWFVkOVNhNFZYTEc1OHllZExPb0dkMkk3MFRT?=
 =?utf-8?B?bUtTM2Q0WGJlSHNmZEhHZzJ2dHFzZXNRZkhPcjAzK0hhWFhPclM0VUd2MTNv?=
 =?utf-8?B?VTQwN2RrTGxxZlVoM0E2c0RaOFlwRy81b3pGZ0xTUjd6Nm5XUytiZnlaWlVZ?=
 =?utf-8?B?d29qeGdHbUp0QllnZWdmQW4xWWtoOC9DT3ZJQm9Qa0RVRnhkdnpFNEZJTTUr?=
 =?utf-8?B?RGpUaE9KZmhEVlRrWUYxQTk5OXQybmZlS2Z5bUZxbWg2YjJEdHkzbWtEUFIz?=
 =?utf-8?B?dWxrOUJONFRZL1JzV0R3S1lmRzF0b0FpZFZkU01KVXdpK2xPMzdrcGEwNHFj?=
 =?utf-8?B?Z3g0VnUxM3p6T05Gck9zeEdrWkYrSGlITUpCWGw4L3NUeTBlNzJYZWlIRkhx?=
 =?utf-8?B?NXc2TTN5SmRoTXZSTjRIcU1XR2VkMXJWT0hvdk9LQ3JFaVBud2dyNjFHdXox?=
 =?utf-8?B?RUdwR1AwcWFMSktRdmZDOXRGRFQ2emtQNkJrTjR6U3BYN3QvSVFyci9XNEZQ?=
 =?utf-8?B?dUdTVnIvdUNkRW5vTUEyMC9BSEthejJ6L3lLaHNTVi9YTUpkdjRKeVBTQzFN?=
 =?utf-8?B?VTFTS2UvbFUrL2Nsc3UrZ1ZGSGpzWEFwazNzQjRoaEtXMGZKTEpxZzZPM1Rn?=
 =?utf-8?B?M1RCQXNUU0N4ajE1d09HNXAvNk1lOVNNM25BMnpIY1VmVE9RZ0FWMy9UT3Q3?=
 =?utf-8?B?dHZYbjFORk9pZXkyS21FamtrWHpSbmdtWGhZbU1xQklFYmdwUjBmVVdVVlJF?=
 =?utf-8?B?SW5aajUvQ2R3Ynp3QncvNjh5dzBHdkExNWZPZ1ViVDQyZ09kODQ3azVsb1Bv?=
 =?utf-8?B?QVNsVjNkdGY1Q085ZDRKVFBZS2tSWjFGT080alpocVJPUC9XYmpaSjFIMjRz?=
 =?utf-8?B?emlNRmNXZVA2b3dMSDR6RERHMmprS2ptOXlKNUR3NjJxdTBSTWMxMjNUUlhq?=
 =?utf-8?B?QkU4VlA5YW9mRlpxNTEyUGhsSlpBQ2hjK1FVUTNOR283OGNYWmF1UUZMS2xW?=
 =?utf-8?B?RWxjeHV3dzJ5ajhBc3k0UjZrRmNCbE9WLytIaXJTU0FOUWt6NFM4R0h6MzZM?=
 =?utf-8?B?NjZubTltaEVEZFBMa0MwK0xMcGNaYnhLb3grZGFiOFA0ZW90bVBJV09BNXBS?=
 =?utf-8?B?UHJTQmNMVHRiL0k1clBQT1pCRm5iWHB1QW9DSU43U085akdWbWd3dU52eENk?=
 =?utf-8?B?a3VsdlFJRFpacHRJVmpjSml1YzR5Q2d6U3FBSkcya0toS25TdmFJS2ZTTG1o?=
 =?utf-8?B?ZVUyKzNHczN2RjMyRHdSbnVLdmZyc3dPUUF1QytNWitrN01LQ3dlVklQRFhi?=
 =?utf-8?B?aXYrM0FjT2UxamIxZHNjUmpLb3ZGSXkvcjE2ZXNydlJWalIvaUxnSkdUQksw?=
 =?utf-8?B?WWt4YUlaQU5EVjNTeERUVFR3UFZ5QTQ3ZVZxS09UT01FQTVMUDUwN3V4VTZS?=
 =?utf-8?B?NUpZNHlmbnhNU1BFSTl4b2NvM0pFU0tMdnJQUFhlbCsxeTJHSTJNNExZaEZF?=
 =?utf-8?B?RGorcE56cjFpZHR3YVJPRStLRC9valVaUWZreW5Jd280a2Qya2MrdkF6Vi9Z?=
 =?utf-8?B?UHl0OEhISmVoeTYwa0wrVU1RMEZTQ1ZzN0xxZXY3UEM1Tlk2ZlRWWlp4ekxo?=
 =?utf-8?B?dUJmOHNYYWltMmN2eDJPTCtLb0ZNRmkzSWdteEVtaEN2ZU9BcVFjYXlldWk2?=
 =?utf-8?B?NWwvUVNWbkVYa3NRbnVncFJ0Wmsvc0Ewd3JGeHVrejhuYzRUTGFrL2VlS05G?=
 =?utf-8?B?OGxXeEplYXFkdktLODRhZHhTRVJndW9leXRHUUkvemVpQVltZkZlR1lGVlZm?=
 =?utf-8?B?QUFWZHAzVDZ2dFBtbjFkMnA3SHZ2TUpSQ28xZ0RET3BtZ3RCQ2VEVUcxaC9F?=
 =?utf-8?B?czlOWkNGUTZaUVdEclFPSElRQ0JocHliK0pXbU9qYW9OMFQrUzlsdkdRTGhG?=
 =?utf-8?B?QlZHWXVWZlh1Ujg2TVBicHhNRkpqQ0EyTGx4TlA4WFR5RTJGY1REcm90VFQ4?=
 =?utf-8?B?YWU0TWN0cWxjTzJTVTFzSFVLSlpTa3pseE9pRWVTTnlySUgvUWd5Rmdjd3cy?=
 =?utf-8?Q?58MjCY2hMN4pIuzw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92b567d-7972-43da-8f56-08da0e7ec4af
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 16:44:45.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5kkcGUgpkjbVAkdbvW/7uN3f/GSWm6B1hhOwbG7bwM2nJ1txbXHNCIOYT881cVu7lB5HvTQ2nW18Q2yzndV848hfrDkDAihilwUaxvzUeyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8175
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
Cc: Sean Paul <sean@poorly.run>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 quic_kalyant <quic_kalyant@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDI1LCAyMDIyIDk6
MzYgUE0NCj4gVG86IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKSA8cXVpY19zYmlsbGFrYUBx
dWljaW5jLmNvbT4NCj4gQ2M6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz47IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47DQo+IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz47IGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnOw0KPiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPjsgU2FtIFJhdm5ib3JnDQo+IDxz
YW1AcmF2bmJvcmcub3JnPjsgS3VvZ2VlIEhzaWVoIChRVUlDKSA8cXVpY19raHNpZWhAcXVpY2lu
Yy5jb20+Ow0KPiBBbmR5IEdyb3NzIDxhZ3Jvc3NAa2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVO
IEZJUk1XQVJFIEFORA0KPiBGTEFUVEVORUQgREVWSUNFIFRSRUUgQklORElOR1MgPGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnPjsNCj4gcXVpY192cHJvZGR1dCA8cXVpY192cHJvZGR1dEBxdWlj
aW5jLmNvbT47IGxpbnV4LWFybS1tc20gPGxpbnV4LWFybS0NCj4gbXNtQHZnZXIua2VybmVsLm9y
Zz47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+IDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPjsg
Um9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IFNlYW4NCj4gUGF1bCA8c2VhbnBhdWxA
Y2hyb21pdW0ub3JnPjsgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Ow0KPiBxdWljX2thbHlh
bnQgPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT47IExLTUwgPGxpbnV4LQ0KPiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnPjsgZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnOw0KPiBrcnprK2R0QGtl
cm5lbC5vcmc7IGZyZWVkcmVubyA8ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NSA2LzldIGRybS9tc20vZHA6IHdhaXQgZm9yIGhwZCBoaWdo
IGJlZm9yZSBhbnkgc2luaw0KPiBpbnRlcmFjdGlvbg0KPiANCj4gV0FSTklORzogVGhpcyBlbWFp
bCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4g
b2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+
IA0KPiBIaSwNCj4gDQo+IE9uIEZyaSwgTWFyIDI1LCAyMDIyIGF0IDg6NTQgQU0gU2Fua2VlcnRo
IEJpbGxha2FudGkgKFFVSUMpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPiB3cm90ZToN
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IERvdWcg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4NCj4gPiA+IFNlbnQ6IFNhdHVyZGF5LCBN
YXJjaCAxOSwgMjAyMiA1OjI2IEFNDQo+ID4gPiBUbzogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hy
b21pdW0ub3JnPg0KPiA+ID4gQ2M6IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKSA8cXVpY19z
YmlsbGFrYUBxdWljaW5jLmNvbT47IG9wZW4NCj4gPiA+IGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQg
RkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTDQo+ID4gPiA8ZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc+OyBkcmktZGV2ZWwNCj4gPiA+IDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPjsNCj4gPiA+IGZyZWVkcmVubyA8ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47
IGxpbnV4LWFybS1tc20NCj4gPiA+IDxsaW51eC1hcm0tIG1zbUB2Z2VyLmtlcm5lbC5vcmc+OyBM
S01MDQo+ID4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IFJvYiBDbGFyayA8cm9i
ZGNsYXJrQGdtYWlsLmNvbT47DQo+ID4gPiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9y
Zz47IHF1aWNfa2FseWFudA0KPiA+ID4gPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT47IEFiaGlu
YXYgS3VtYXIgKFFVSUMpDQo+ID4gPiA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IEt1b2dl
ZSBIc2llaCAoUVVJQykNCj4gPiA+IDxxdWljX2toc2llaEBxdWljaW5jLmNvbT47IEFuZHkgR3Jv
c3MgPGFncm9zc0BrZXJuZWwub3JnPjsNCj4gPiA+IGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3Jn
OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gPiA+IGtyemsrZHRAa2VybmVs
Lm9yZzsgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+OyBEYXZpZCBBaXJsaWUNCj4gPiA+IDxh
aXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgVGhpZXJy
eSBSZWRpbmcNCj4gPiA+IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+OyBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Ow0KPiA+ID4gZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnOyBx
dWljX3Zwcm9kZHV0DQo+ID4gPiA8cXVpY192cHJvZGR1dEBxdWljaW5jLmNvbT4NCj4gPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNi85XSBkcm0vbXNtL2RwOiB3YWl0IGZvciBocGQgaGlnaCBi
ZWZvcmUgYW55DQo+ID4gPiBzaW5rIGludGVyYWN0aW9uDQo+ID4gPg0KPiA+ID4gSGksDQo+ID4g
Pg0KPiA+ID4gT24gRnJpLCBNYXIgMTgsIDIwMjIgYXQgNDoyNyBQTSBTdGVwaGVuIEJveWQgPHN3
Ym95ZEBjaHJvbWl1bS5vcmc+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gPiA+IFB1
c2hpbmcgaHBkIHN0YXRlIGNoZWNraW5nIGludG8gYXV4IHRyYW5zYWN0aW9ucyBsb29rcyBsaWtl
DQo+ID4gPiA+ID4gPiB0aGUgd3JvbmcgZGlyZWN0aW9uLiBBbHNvLCBhcyBJIHNhaWQgdXAgYWJv
dmUgSSBhbSBjb25jZXJuZWQNCj4gPiA+ID4gPiA+IHRoYXQgZXZlbiBjaGVja2luZyB0aGUgR1BJ
TyB3b24ndCB3b3JrIGFuZCB3ZSBuZWVkIHNvbWUgd2F5IHRvDQo+ID4gPiA+ID4gPiBhc2sgdGhl
IGJyaWRnZSBpZiBIUEQgaXMgYXNzZXJ0ZWQgb3Igbm90IGFuZCB0aGVuIGZhbGxiYWNrIHRvDQo+
ID4gPiA+ID4gPiB0aGUgR1BJTyBtZXRob2QgaWYgdGhlIGRpc3BsYXkgcGh5L2NvbnRyb2xsZXIg
ZG9lc24ndCBoYXZlDQo+ID4gPiA+ID4gPiBzdXBwb3J0IHRvIGNoZWNrIEhQRCBpbnRlcm5hbGx5
LiBTb21ldGhpbmcgb24gdG9wIG9mDQo+IERSTV9CUklER0VfT1BfSFBEPw0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gSWYgd2UgY291bGQgc29tZWhvdyBnZXQgdGhlIEhQRCBzdGF0dXMgZnJvbSB0aGUg
YnJpZGdlIGluIHRoZQ0KPiA+ID4gPiA+IHBhbmVsIGRyaXZlciBpdCBkZWZpbml0ZWx5IHdvdWxk
IGJlIGNvbnZlbmllbnQuIEl0IGRvZXMgZmVlbA0KPiA+ID4gPiA+IGxpa2UgdGhhdCdzIGFuIGlt
cHJvdmVtZW50IHRoYXQgY291bGQgYmUgZG9uZSBsYXRlciwgdGhvdWdoLg0KPiA+ID4gPiA+IFdl
J3ZlIGFscmVhZHkgbGFuZGVkIGEgZmV3IGluc3RhbmNlcyBvZiBkb2luZyB3aGF0J3MgZG9uZSBo
ZXJlLA0KPiA+ID4gPiA+IGxpa2UgZm9yDQo+ID4gPiA+ID4gcGFyYWRlLXBzODY0MCBhbmQgYW5h
bG9naXhfZHAuIEkgc3VzcGVjdCBkZXNpZ25pbmcgYSBuZXcNCj4gPiA+ID4gPiBtZWNoYW5pc20g
bWlnaHQgbm90IGJlIHRoZSBtb3N0IHRyaXZpYWwuDQo+ID4gPiA+DQo+ID4gPiA+IFdoYXQgaXMg
ZG9uZSBpbiB0aGUgYnJpZGdlIGRyaXZlcnMgaXMgdG8gd2FpdCBmb3IgYSBmaXhlZCB0aW1lb3V0
DQo+ID4gPiA+IGFuZCBhc3N1bWUgYXV4IGlzIHJlYWR5PyBPciBpcyBpdCBzb21ldGhpbmcgZWxz
ZT8gSWYgdGhlcmUncyBqdXN0DQo+ID4gPiA+IGEgZml4ZWQgdGltZW91dCBmb3IgdGhlIGVEUCBj
YXNlIGl0IHNvdW5kcyBPSyB0byBkbyB0aGF0IGZvciBub3cNCj4gPiA+ID4gYW5kIHdlIGNhbiBm
aW5lIHR1bmUgaXQgbGF0ZXIgdG8gYWN0dWFsbHkgY2hlY2sgSFBEIHN0YXR1cw0KPiA+ID4gPiBy
ZWdpc3RlciBiZWZvcmUgdGhlIHBhbmVsIHRyaWVzIHRvIHJlYWQgRURJRC4NCj4gPiA+DQo+ID4g
PiBSaWdodC4gRm9yIHRoZSBwYXJhZGUgY2hpcCAod2hpY2ggaXMgb25seSB1c2VkIGZvciBlRFAg
YXMgZmFyIGFzIEkNCj4gPiA+IGtub3ctLW5ldmVyDQo+ID4gPiBEUCkgd2FpdHMgZm9yIHVwIHRv
IDIwMCBtcy4gU2VlIHBzODY0MF9lbnN1cmVfaHBkKCkuDQo+ID4gPg0KPiA+ID4gU28gSSBndWVz
cyB0bDtkciB0byBTYW5rZWVydGggdGhhdCBpdCdzIE9LIGZvciBoaXMgcGF0Y2ggdG8gaGF2ZSB0
aGUNCj4gPiA+IHdhaXQgaW4gdGhlIGF1eCB0cmFuc2ZlciBmdW5jdGlvbiwgYnV0IG9ubHkgZm9y
IGVEUC4gT3RoZXINCj4gPiA+IGRpc2N1c3Npb25zIGhlcmUgYXJlIGFib3V0IGhvdyB3ZSBjb3Vs
ZCBtYWtlIGl0IGJldHRlciBpbiBmdXR1cmUNCj4gcGF0Y2hlcy4NCj4gPiA+DQo+ID4gPg0KPiA+
DQo+ID4gVGhlIGF1eCB0cmFuc2FjdGlvbnMgZm9yIGV4dGVybmFsIERQIGFyZSBpbml0aWF0ZWQg
YnkgdGhlIGRwX2Rpc3BsYXkNCj4gPiBkcml2ZXIgb25seSBhZnRlciB0aGUgZGlzcGxheSBpcyBo
b3QgcGx1Z2dlZCB0byB0aGUgY29ubmVjdG9yLiBUaGUNCj4gPiBwaHlfaW5pdCBpcyBuZWNlc3Nh
cnkgZm9yIHRoZSBhdXggdHJhbnNhY3Rpb25zIHRvIHRha2UgcGxhY2UuIFNvLCBmb3INCj4gPiB0
aGUgRFAgY2FzZSwgbGlrZSBEb3VnIG1lbnRpb25lZCBiZWxvdywgdGhpcyBwYXRjaCBpcyBpbnRy
b2R1Y2luZyBhbg0KPiBvdmVyaGVhZCBvZiB0aHJlZSByZWdpc3RlciByZWFkcyB0byBkZXRlY3Qg
aHBkX2hpZ2ggYmVmb3JlIHBlcmZvcm1pbmcgYXV4DQo+IHRyYW5zYWN0aW9ucy4NCj4gPiBTbywg
d2UgZmVsdCB0aGlzIHdhcyBva2F5IHRvIGRvIGZvciBEUC4NCj4gDQo+IFBlcnNvbmFsbHkgSSdt
IG5vdCB0aGF0IHVwc2V0IGFib3V0IHRoZSAzIHJlZ2lzdGVyIHJlYWRzLiBUaGUgcHJvYmxlbQ0K
PiBTdGVwaGVuIHBvaW50ZWQgb3V0IGlzIGJpZ2dlci4gSXQncyBwb3NzaWJsZSB0aGF0IGEgRFAg
Y2FibGUgaXMgdW5wbHVnZ2VkDQo+IF9qdXN0XyBhcyB3ZSBzdGFydGVkIGFuIEFVWCB0cmFuc2Fj
dGlvbi4gSW4gdGhhdCBjYXNlIHdlJ2xsIGhhdmUgYSBiaWcgZGVsYXkNCj4gaGVyZSB3aGVuIHdl
IGRvbid0IGFjdHVhbGx5IG5lZWQgb25lLg0KPiANCj4gDQpPa2F5LiBHb3QgaXQNCg0KPiA+IE9u
IHRoZSBvdGhlciBoYW5kLCBmb3IgZURQLCBpdCBpcyBuZWNlc3NhcnkgdG8gd2FpdCBmb3IgcGFu
ZWwgcmVhZHkgdGhyb3VnaA0KPiB0aGlzIGhwZCBjb25uZWN0IHN0YXR1cy4NCj4gPiBDdXJyZW50
bHkgdGhlcmUgaXMgbm8gd2F5IHRvIGtub3cgd2hpY2ggdHlwZSBvZiBjb25uZWN0b3IgaXQgaXMg
aW4gdGhlDQo+IGRwX2F1eCBzdWItbW9kdWxlLg0KPiA+DQo+ID4gSG93ZXZlciwgYXMgdGhlIGRp
c2N1c3Npb24gc3VnZ2VzdGVkLCB0byBoYXZlIHRoZSB3YWl0IG9ubHkgZm9yIGVEUCwgSQ0KPiA+
IGFtIHRoaW5raW5nIHRvIHBhc3MgdGhlIGNvbm5lY3Rvcl90eXBlIGluZm9ybWF0aW9uIHRvIGF1
eCBzdWItbW9kdWxlDQo+ID4gYW5kIHJlZ2lzdGVyIGRpZmZlcmVudCBhdXhfdHJhbnNmZXIgZnVu
Y3Rpb25zIGZvciBlRFAgYW5kIERQLiBUaGUgZURQDQo+ID4gdHJhbnNmZXIgZnVuY3Rpb24gd2ls
bCB3YWl0IGZvciBocGRfaGlnaCBhbmQgdGhlIERQIHRyYW5zZmVyIGZ1bmN0aW9uIHdpbGwgYmUN
Cj4gc2FtZSBhcyB0aGUgb25lIGJlZm9yZSB0aGlzIHBhdGNoLg0KPiANCj4gUGVyc29uYWxseSBJ
IHdvdWxkbid0IHJlZ2lzdGVyIHR3byBzZXBhcmF0ZSBmdW5jdGlvbnMuIFlvdSBjb3VsZCBqdXN0
IHN0b3JlIGENCj4gYm9vbGVhbiBpbiB5b3VyIHN0cnVjdHVyZSBhbmQgb25seSB3YWl0IGZvciBI
UEQgaWYgdGhpcyBpcyBlRFAuIE9uZSBleHRyYSAiaWYiDQo+IHRlc3QgZG9lc24ndCBzZWVtIGxp
a2UgaXQganVzdGlmaWVzIHNwbGl0dGluZyBvZmYgaW50byB0d28gZnVuY3Rpb25zLi4uDQo+IA0K
PiAtRG91Zw0KT2theS4gSSB3aWxsIG1ha2UgdGhhdCBjaGFuZ2UuIFRoYW5rIHlvdS4NCg==
