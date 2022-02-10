Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8A4B0CDD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA68B10E82C;
	Thu, 10 Feb 2022 11:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6C10E82A;
 Thu, 10 Feb 2022 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644494259; x=1645099059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o7+3h0ke2OHF8DOUz2ithwW0NNqa5D4D6uPJQJ3tYW8=;
 b=0KJC/toHrLuBgRVPsTNTtrR6smBEk/zd3GKd23TDMMMYI/Paa6aucoHd
 fPFs5Lpj0N6MuTfQb+lzDSjb8fMbCOQIh6NMZMt1RCD9pDDUFYAfBo4En
 0zessKpnwHWiQZXDZGhaoktd30ag8Ikxv6zkKgCdWWoQUT4OzoRTdjS4d k=;
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 11:57:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfRfuMweeD3f+8WdiMDWus0uGp2eBhi1zJIcn8iGOTGDPA3eVjXcnL1d0K2JS5Bvl0RLJWPsJjhJSNqN7IACAVbz7S0mrqhZ4G7A3kKT4jYVKTZNazZeFtZigpJ1tMy5dZhHGC6SLTO80H9SWUIyjIhsFCa6uzBzva5j7CVn4DlYhzCEV26gkOKarK+OWVCy7j0cbdF5P1Qi3fc+OEN7xctCn+uttU/vSS+Icodc7vmBzk0fpgyaMjbB8B5rf4QhhZrwOzpwTb3T3x894jBtJjDMk71j7LXIAhl3jIE4hzaOM2z4jkz490f0pQpWo2RuTgAk0Mv+gk2LCHus1OgcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7+3h0ke2OHF8DOUz2ithwW0NNqa5D4D6uPJQJ3tYW8=;
 b=UyzGxZXLu0/Qx6JEjBffQ9AfAx2UshXX0o9ullUWybsRns8UoNjY/NSNVD4x6TNEU9ylSIL4bPJGTUgAZ7Rmg+WedMMrHAzictTCDAIzYSCqtrvCdFlLPX4iZm/51zORGRO08M17KJmiGCT49mtAw8nEnGkhkPHBnO1Iq13YjLASbGMVhaMULJQbj5BizsZSzgfmNx/U1r5TD0w4vwSp0K8fg1oKmL1H6WUolOkGUz5Iwh87h3oVKVv+LUtuIKnTowzcLKv2svcejkiDb1j7JCQS232tJ8OAACDRKmzAQwY0lw9iwVhNHh4T7ZojwkA+3qh0uQv1Am8dT98CkEzeag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN6PR02MB5277.namprd02.prod.outlook.com (2603:10b6:805:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 11:57:34 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006%3]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 11:57:34 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "agross@kernel.org" <agross@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "bjorn.andersson@linaro.org"
 <bjorn.andersson@linaro.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>
Subject: RE: [PATCH v3 4/4] drm/msm/dp: Add driver support to utilize drm panel
Thread-Topic: [PATCH v3 4/4] drm/msm/dp: Add driver support to utilize drm
 panel
Thread-Index: AQHYHZLt6FVd5Wkz9kiVE9iyD9vmIayL/i6AgACxbwA=
Date: Thu, 10 Feb 2022 11:57:34 +0000
Message-ID: <MW4PR02MB7186BB7DE94099078930E282E12F9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-5-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n53vzv+NFWfkFktAJFEpo0Ss1=OpNn1saXXx5A5xAJZ3xA@mail.gmail.com>
In-Reply-To: <CAE-0n53vzv+NFWfkFktAJFEpo0Ss1=OpNn1saXXx5A5xAJZ3xA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a327fba-27fe-41a7-600e-08d9ec8c8648
x-ms-traffictypediagnostic: SN6PR02MB5277:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB5277F72B47AE325747205DE69D2F9@SN6PR02MB5277.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P2pySMfZhR/70lZZgUjakoctE6aEaNpmCeP3whXaqVcbN1/a2LP4LYwwJy+UwdVSF8NmaxDAIBpICCkmRSMruVLq5vlws9CW5DEm0lqi7ui91b9FEWEc8BOCr+PanIIB1bFwKQrecmhrcJTo6I6bNUSi9c3yJFZq+rycQ8URv6KOXoXtkncqNmv3Rdq99Y0cJR1kigU8RYDj6Atmu/j6692gRsdoFpuNLernYGtv6izYENelC00oUAW6RFdbdNXnZoQt+h63KVNQArfRzOa7K/IHd1vqREEShgeusLw1r1Ol2E4V7jkKkvHol9CB+ajgeogXH20hI/TLPZQyAyo0EgQ/xLbLeqGFIw16vile5pSrWNJVo8y/8opoTxlmFlVhiGKGpCabjtSpn+The/224bLWXcvQJy49W1N8IaMWOMTSrTaK0IRq1U4BbIbGHffBMwGHubnuJVfN/pdUtwY7KlBotIjMSoABQxRjQCB0rbxeRKdrGKT051azOlMKi41URxsoncSX3A3XYJWO1wIOFAONDDqUWg8Od4jqBhen1roluJEfoIug4O9/b3hsndJLZpaIRnNYwzld08Qy/nCD6M/PYo/5i92FT/jxhb1DP/8FyAkGZtfQsKmBedv6SFrZKSoFGz5lcD0Cgrrxll452DvF2wZyAmynJ2bFoLCUbXgytQZy5f5+gdHG2wUGylM/8ip6poiffegHXl8WtnESfUTICTbZfEDCcgfZlYI48JM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(5660300002)(9686003)(2906002)(83380400001)(921005)(52536014)(26005)(122000001)(186003)(7416002)(38070700005)(86362001)(54906003)(71200400001)(8676002)(64756008)(6506007)(110136005)(55016003)(33656002)(66476007)(66556008)(66946007)(66446008)(76116006)(316002)(53546011)(8936002)(7696005)(4326008)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0lvMUt1S3pzRGpob2o0aEQ3dUphNHBUcGYyZ2c0dUpOSTd6OVppRzZIWDlV?=
 =?utf-8?B?WDJIaHZ6NlBNVlpaMFpJL0hwREY5SGVtNVB1THlTdEF3cE1tRE9HRnd3WnFQ?=
 =?utf-8?B?ckhXa1NMb29WKy9PeWE0YXR1WHcrL0RFUlRFaVYySjlUWWQ4aEZkcnR1U2cr?=
 =?utf-8?B?aVUzR3Z0NGhPVkg3eU56YmxJdVJCUjYwSUNmZjQ4TVpMbzBvZThnS2h1cVFZ?=
 =?utf-8?B?WlRGNFFaQ0RyUStSTnhNWHBscE8zdGdpRUNYdWE2QTRENWdVOHNhRG51c0da?=
 =?utf-8?B?Uko5eW1BRDdHaWhJOWdlOHlkUVBZQ2ZVZlIxOUhIMnpwQk9FVUpLNjFLdGZr?=
 =?utf-8?B?V1krR0xHRU02Yk8rSG9pajBVNjZaUDd4eitzaFAxWUJ1UEZVYjNEUkZQRFRw?=
 =?utf-8?B?bU5GQ2dGSDNFY2M0Zlcyd3lOdW1HbFcyNzBZZExmNmhYdWZSdG1idEZzaDhE?=
 =?utf-8?B?RzVwSW1lUk9BNkFGbkFhRThTYjFybEVzOTlKdFFPSVJVL3ZpZnp3WDkyZnRj?=
 =?utf-8?B?L1dSbVI3em9Jb00vcU9lRDhKbEt1WkNsQWlVUWRrYjJpYTNtaUtDSU1UaXpV?=
 =?utf-8?B?ajFNVjM0Zkl3N2JwRU5MNlFBa3F6bVZlNDZlUFZnUnpwNkhyUGJuV0FiRVlS?=
 =?utf-8?B?eE8vNWhCR1dYYnpoS2hPS2I1OENRaDBFZ0J5b1lhNFlmN0VGY0lNbllaWVpl?=
 =?utf-8?B?UnU2Y3VKbFlmb1Y2Q0s0SURKVExvaWl3cUNSbG5ybG5oNEIrNkN6YUc4LzFp?=
 =?utf-8?B?NmtxQWJmc2ZpUXJEYnRDL1lIQ0dUVG5SOGJIVnZGdE44a1ZBM3NXbllTZXgv?=
 =?utf-8?B?V0NyT3czYmRJVFBUcWxuZFhyTENFQnVvQjkydUNWWGtsT1JqK21ncEtYNXI0?=
 =?utf-8?B?OHhDcFlwdmpIa0dFS0N3NExBRHJScGVIMnpZOFFqOGxQVmk5NC9NUWd3RkVS?=
 =?utf-8?B?ZDdaK2xDTnJHT3lhUTU2K0dwSklkRmlUMEZPblFibXpBczBkeDJnNytVSUVL?=
 =?utf-8?B?Q1pNUndTWHVLVHRHS2JOR1M0QXVhWUJFY0oxVmFVYnV1R1cwRlFIbjlhaWRS?=
 =?utf-8?B?K0JCNEpCSDNJOVNRRVB0ZlROclJPQmFkMGJwQTVWeFlSd0pFWUtKNkNMcGFH?=
 =?utf-8?B?eTJJTHpCL3dtWEcxOEl5QllrVWI2aFZsZ0twcjB1cmdGQzZRa0hOM3BtZk9t?=
 =?utf-8?B?Z2ZhbWhvYjlyS2VjeCtiZHdzV1NzT1VtdUsxSExidk05SWFEeEQzbm9MTk90?=
 =?utf-8?B?OGZvVCt4aDV3cHVidUtEUk0xcXF5bmo5aWVvQXZIdWQwTmk1T09ocXhPRWZp?=
 =?utf-8?B?eFpGMjY4cGw5SXNOaGxYMFlOdDEydEpGUSt5ZkVJSnlyeEFaMVdvbDBCMFV4?=
 =?utf-8?B?VTZPVlUrRXRMaU4razJxWHRURG82Yk5PNUxlMDRDSVVrSzRCT21vYkFad09m?=
 =?utf-8?B?QUJhclRiSjFLQUtMMUlqakpHaG51UGNObWUwczVHMlluM0tHUDFraVdEdk4x?=
 =?utf-8?B?NXlUd016SzFqQWxpZmZFV0NUK0RRQm41cXBLZXhhOGR3QjUrVzRtRTJSL1kx?=
 =?utf-8?B?NzFUSVlNSUxVR0E2a3hodjk1djNiTjJJa0piTmQxZmF5RGptMFBXclpyWFZv?=
 =?utf-8?B?aUxsNlZpZlV5T1NyMkhSQ1NJWnBPdGNJekx4OXRtRC90NndIZEw3VGR3Ym1z?=
 =?utf-8?B?UU42Z1QwNnlYZ2NxeW9jMnNKclBMM0g0L2tpNXlUaVRDemRzdTRmV2VrMk5l?=
 =?utf-8?B?djRUMHZ5K1BlRktNMGg1dWZXZStWdnlZSzFrMEVDMXpSaW5nTWh2bGtVUTZ5?=
 =?utf-8?B?eDQ2S0YxQWV4ZWJSaFNMUDlBZXd3UGtLVUFUbHBtanhVYy82S212ZUhKbFpa?=
 =?utf-8?B?OWF3V3pQdmU1YUN6WHJ0K0V4aEk2akpGV2orOWtmZ3AwNUNJQnJBaytEOGZX?=
 =?utf-8?B?bjE5Vm1KV0dTN2lrWm1ScWwzL2w2dXkwRy9HSm8vV1JqaUJ6d0p2MkhSWW5z?=
 =?utf-8?B?dHFITjd5TDlqSkVFemNackhJVURRQ0lTYkVYeXFtYzlLc2MraEN0b2N5UHpU?=
 =?utf-8?B?YXRwYTQvM0Eyc08vN01QbzR4YVllaE5aNitkcHJxYUlMSUUrWmN0SWl1SjZh?=
 =?utf-8?B?VFFzVGNMODdVdDJ1ZHV0enRxcFhCQzA0OHpBeFNONUtUT1BtS0gyY3d3c2xD?=
 =?utf-8?Q?JmjD1szAk+lIuXZOdgyyoSez7QQX2nM/w/tCphkNe2ag?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a327fba-27fe-41a7-600e-08d9ec8c8648
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 11:57:34.0686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GghYaM/Sh9mOG/0O8KRms3uaUV6Nn+b1XNRPBDfxVYZGBZ6y0PJ8sb97EmzSX97dAHLmw+0dI7gb4aL8hYrHyPokSB5FlncpN9drf/6UJrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5277
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
 quic_vproddut <quic_vproddut@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 quic_mkrishn <quic_mkrishn@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbiwNCldpbGwgbWFrZSB0aGUgY2hhbmdlcy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4gDQpTZW50
OiBUaHVyc2RheSwgRmVicnVhcnkgMTAsIDIwMjIgNjo1MiBBTQ0KVG86IFNhbmtlZXJ0aCBCaWxs
YWthbnRpIChRVUlDKSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT47IGFncm9zc0BrZXJuZWwu
b3JnOyBhaXJsaWVkQGxpbnV4LmllOyBiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZzsgZGFuaWVs
QGZmd2xsLmNoOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZGlhbmRlcnNAY2hyb21pdW0u
b3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBmcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb207IGxpbnV4LWFy
bS1tc21Admdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2Jk
Y2xhcmtAZ21haWwuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IHNhbUByYXZuYm9yZy5vcmc7IHNl
YW5wYXVsQGNocm9taXVtLm9yZzsgdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tDQpDYzogcXVpY19r
YWx5YW50IDxxdWljX2thbHlhbnRAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKSA8
cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IEt1b2dlZSBIc2llaCAoUVVJQykgPHF1aWNfa2hz
aWVoQHF1aWNpbmMuY29tPjsgcXVpY19ta3Jpc2huIDxxdWljX21rcmlzaG5AcXVpY2luYy5jb20+
OyBxdWljX3Zwcm9kZHV0IDxxdWljX3Zwcm9kZHV0QHF1aWNpbmMuY29tPjsgZG1pdHJ5LmJhcnlz
aGtvdkBsaW5hcm8ub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIHYzIDQvNF0gZHJtL21zbS9kcDog
QWRkIGRyaXZlciBzdXBwb3J0IHRvIHV0aWxpemUgZHJtIHBhbmVsDQoNClF1b3RpbmcgU2Fua2Vl
cnRoIEJpbGxha2FudGkgKDIwMjItMDItMDkgMDA6NTU6MzIpDQo+IEFkZCBzdXBwb3J0IGluIHRo
ZSBEUCBkcml2ZXIgdG8gdXRpbGl6ZSB0aGUgY3VzdG9tIGVEUCBwYW5lbHMgZnJvbSANCj4gZHJt
L3BhbmVscy4NCj4NCj4gQW4gZURQIHBhbmVsIGlzIGFsd2F5cyBjb25uZWN0ZWQgdG8gdGhlIHBs
YXRmb3JtLiBTbywgdGhlIGVEUCANCj4gY29ubmVjdG9yIGNhbiBiZSByZXBvcnRlZCBhcyBhbHdh
eXMgY29ubmVjdGVkLiBUaGUgZGlzcGxheSBtb2RlIHdpbGwgDQo+IGJlIHNvdXJjZWQgZnJvbSB0
aGUgcGFuZWwuIFRoZSBwYW5lbCBtb2RlIHdpbGwgYmUgc2V0IGFmdGVyIHRoZSBsaW5rIA0KPiB0
cmFpbmluZyBpcyBjb21wbGV0ZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFNhbmtlZXJ0aCBCaWxs
YWthbnRpIDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPg0KPiAtLS0NCj4NCj4gQ2hhbmdlcyBp
biB2MzoNCj4gICBOb25lDQo+DQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXku
YyB8ICA4ICsrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kcm0uYyAgICAgfCA1
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2RwL2RwX3BhcnNlci5oICB8ICAzICsrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2MCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9k
cF9kaXNwbGF5LmMNCj4gaW5kZXggN2NjNGQyMS4uNDEwZmRhNCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9kaXNwbGF5LmMNCj4gQEAgLTE1MTMsNiArMTUxMywxMCBAQCBpbnQgbXNtX2Rw
X2Rpc3BsYXlfZW5hYmxlKHN0cnVjdCBtc21fZHAgKmRwLCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICAgICAgICB9DQo+
DQo+ICsgICAgICAgLyogaGFuZGxlIGVEUCBvbiAqLw0KDQpUaGlzIGNvbW1lbnQgaXMgb2J2aW91
cy4gUGxlYXNlIHJlbW92ZS4NCg0KPiArICAgICAgIGlmIChkcC0+Y29ubmVjdG9yX3R5cGUgPT0g
RFJNX01PREVfQ09OTkVDVE9SX2VEUCkNCj4gKyAgICAgICAgICAgICAgIGRwX2hwZF9wbHVnX2hh
bmRsZShkcF9kaXNwbGF5LCAwKTsNCj4gKw0KPiAgICAgICAgIG11dGV4X2xvY2soJmRwX2Rpc3Bs
YXktPmV2ZW50X211dGV4KTsNCj4NCj4gICAgICAgICAvKiBzdG9wIHNlbnRpbmVsIGNoZWNraW5n
ICovDQo+IEBAIC0xNTc3LDYgKzE1ODEsMTAgQEAgaW50IG1zbV9kcF9kaXNwbGF5X2Rpc2FibGUo
c3RydWN0IG1zbV9kcCAqZHAsIA0KPiBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpDQo+DQo+
ICAgICAgICAgZHBfZGlzcGxheSA9IGNvbnRhaW5lcl9vZihkcCwgc3RydWN0IGRwX2Rpc3BsYXlf
cHJpdmF0ZSwgDQo+IGRwX2Rpc3BsYXkpOw0KPg0KPiArICAgICAgIC8qIGhhbmRsZSBlZHAgb2Zm
ICovDQoNClRoaXMgY29tbWVudCBpcyBvYnZpb3VzLiBQbGVhc2UgcmVtb3ZlLg0KDQo+ICsgICAg
ICAgaWYgKGRwLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiAr
ICAgICAgICAgICAgICAgZHBfaHBkX3VucGx1Z19oYW5kbGUoZHBfZGlzcGxheSwgMCk7DQo+ICsN
Cj4gICAgICAgICBtdXRleF9sb2NrKCZkcF9kaXNwbGF5LT5ldmVudF9tdXRleCk7DQo+DQo+ICAg
ICAgICAgLyogc3RvcCBzZW50aW5lbCBjaGVja2luZyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kcm0uYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2Rw
X2RybS5jIGluZGV4IGQ0ZDM2MGQuLjEyZmE4YzEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHAvZHBfZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9k
cm0uYw0KPiBAQCAtMzksNiArMzksMTAgQEAgc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0
dXMgDQo+IGRwX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4sDQo+
DQo+ICAgICAgICAgZHAgPSB0b19kcF9jb25uZWN0b3IoY29ubiktPmRwX2Rpc3BsYXk7DQo+DQo+
ICsgICAgICAgLyogZURQIGlzIGFsd2F5cyAgY29ubmVjdGVkICovDQo+ICsgICAgICAgaWYgKGRw
LT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiArICAgICAgICAg
ICAgICAgcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOw0KDQpXaHkgbm90IGltcGxl
bWVudCBkaWZmZXJlbnQgY29ubmVjdG9yIG9wcyBmb3IgZURQIGFuZCB0aGVuIG5vdCBpbXBsZW1l
bnQgdGhpcyBmdW5jdGlvbiBhdCBhbGwgaW4gdGhhdCBjYXNlPw0KDQo+ICsNCj4gICAgICAgICBE
Uk1fREVCVUdfRFAoImlzX2Nvbm5lY3RlZCA9ICVzXG4iLA0KPiAgICAgICAgICAgICAgICAgKGRw
LT5pc19jb25uZWN0ZWQpID8gInRydWUiIDogImZhbHNlIik7DQo+DQo+IEBAIC0xMjMsNiArMTI3
LDM1IEBAIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBkcF9jb25uZWN0b3JfbW9kZV92YWxp
ZCgNCj4gICAgICAgICByZXR1cm4gZHBfZGlzcGxheV92YWxpZGF0ZV9tb2RlKGRwX2Rpc3AsIG1v
ZGUtPmNsb2NrKTsgIH0NCj4NCj4gK3N0YXRpYyBpbnQgZWRwX2Nvbm5lY3Rvcl9nZXRfbW9kZXMo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvcikgew0KPiArICAgICAgIHN0cnVjdCBtc21f
ZHAgKmRwOw0KPiArDQo+ICsgICAgICAgaWYgKCFjb25uZWN0b3IpDQoNCklzIHRoaXMgY2hlY2sg
cmVhbGx5IG5lY2Vzc2FyeT8gV2h5IGRvZXNuJ3QgZHJtIGRvIGl0IGluIGhpZ2hlciBsYXllcnM/
DQoNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiArDQo+ICsgICAgICAgZHAgPSB0b19k
cF9jb25uZWN0b3IoY29ubmVjdG9yKS0+ZHBfZGlzcGxheTsNCj4gKw0KPiArICAgICAgIHJldHVy
biBkcm1fYnJpZGdlX2dldF9tb2RlcyhkcC0+cGFuZWxfYnJpZGdlLCBjb25uZWN0b3IpOyB9DQo+
ICsNCj4gK3N0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBlZHBfY29ubmVjdG9yX21vZGVfdmFs
aWQoDQo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0K
PiArICAgICAgICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpIHsNCj4gKyAg
ICAgICBzdHJ1Y3QgbXNtX2RwICpkcDsNCj4gKw0KPiArICAgICAgIGlmICghY29ubmVjdG9yKQ0K
DQpJcyB0aGlzIGNoZWNrIHJlYWxseSBuZWNlc3Nhcnk/IFdoeSBkb2Vzbid0IGRybSBkbyBpdCBp
biBoaWdoZXIgbGF5ZXJzPw0KDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiAr
ICAgICAgIGRwID0gdG9fZHBfY29ubmVjdG9yKGNvbm5lY3RvciktPmRwX2Rpc3BsYXk7DQo+ICsN
Cj4gKyAgICAgICBpZiAobW9kZS0+Y2xvY2sgPiBFRFBfTUFYX1BJWEVMX0NMS19LSFopDQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gTU9ERV9CQUQ7DQoNCldoeSBub3QgcmV0dXJuIE1PREVfQ0xP
Q0tfSElHSD8NCg0KPiArDQo+ICsgICAgICAgcmV0dXJuIE1PREVfT0s7DQo+ICt9DQo+ICsNCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBkcF9jb25uZWN0b3JfZnVu
Y3MgPSB7DQo+ICAgICAgICAgLmRldGVjdCA9IGRwX2Nvbm5lY3Rvcl9kZXRlY3QsDQo+ICAgICAg
ICAgLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMs
DQo+IEBAIC0xMzcsNiArMTcwLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfZnVuY3MgZHBfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsNCj4gICAgICAgICAu
bW9kZV92YWxpZCA9IGRwX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkLCAgfTsNCj4NCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgZWRwX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MgPSB7DQo+ICsgICAgICAgLmdldF9tb2RlcyA9IGVkcF9jb25uZWN0b3JfZ2V0X21v
ZGVzLA0KPiArICAgICAgIC5tb2RlX3ZhbGlkID0gZWRwX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkLA0K
PiArDQoNCldoeSB0aGUgZXh0cmEgbmV3bGluZT8NCg0KPiArfTsNCj4gKw0KPiAgLyogY29ubmVj
dG9yIGluaXRpYWxpemF0aW9uICovDQo+ICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqZHBfZHJtX2Nv
bm5lY3Rvcl9pbml0KHN0cnVjdCBtc21fZHAgDQo+ICpkcF9kaXNwbGF5KSAgeyBAQCAtMTYwLDEy
ICsxOTksMTcgQEAgc3RydWN0IGRybV9jb25uZWN0b3IgDQo+ICpkcF9kcm1fY29ubmVjdG9yX2lu
aXQoc3RydWN0IG1zbV9kcCAqZHBfZGlzcGxheSkNCj4gICAgICAgICBpZiAocmV0KQ0KPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4NCj4gLSAgICAgICBkcm1fY29ubmVj
dG9yX2hlbHBlcl9hZGQoY29ubmVjdG9yLCAmZHBfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+
ICsgICAgICAgaWYgKGRwX2Rpc3BsYXktPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5F
Q1RPUl9lRFApIHsNCj4gKyAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZChj
b25uZWN0b3IsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVkcF9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzKTsNCj4gKyAgICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgICAg
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgDQo+ICsgJmRwX2Nvbm5lY3Rvcl9o
ZWxwZXJfZnVuY3MpOw0KPg0KPiAtICAgICAgIC8qDQo+IC0gICAgICAgICogRW5hYmxlIEhQRCB0
byBsZXQgaHBkIGV2ZW50IGlzIGhhbmRsZWQgd2hlbiBjYWJsZSBpcyBjb25uZWN0ZWQuDQo+IC0g
ICAgICAgICovDQo+IC0gICAgICAgY29ubmVjdG9yLT5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BP
TExfSFBEOw0KPiArICAgICAgICAgICAgICAgLyoNCj4gKyAgICAgICAgICAgICAgICAqIEVuYWJs
ZSBIUEQgdG8gbGV0IGhwZCBldmVudCBpcyBoYW5kbGVkIHdoZW4gY2FibGUgaXMgY29ubmVjdGVk
Lg0KPiArICAgICAgICAgICAgICAgICovDQo+ICsgICAgICAgICAgICAgICBjb25uZWN0b3ItPnBv
bGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7DQo+ICsgICAgICAgfQ0KPg0KPiAgICAgICAg
IGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBkcF9kaXNwbGF5LT5lbmNv
ZGVyKTsNCj4NCg==
