Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8154ED388
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 07:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58A610F977;
	Thu, 31 Mar 2022 05:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152E710F975;
 Thu, 31 Mar 2022 05:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648706000; x=1649310800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+MMiK8w6s5twuxwfEprTMqRWxsWRwznDMK25Onlj8qw=;
 b=R8DJUa6Uj3HInupKFR33MqSBIyeePewKePMsXseeW8nJHiXIQGhJ9SGC
 KNt4ThbDHbz7FwoPtYOwbjz+Gxj/iDlxewUDhM6NEbK4btAmnv9PVT8DC
 CvBdmT+7Mnx3++RkNfbncyPXipM5V5J0klWTY/IqAUXnh5FoRKuisUBQj E=;
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 05:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpTArIO2CpTEjn+fRp1xxWCxExrZ5fzQgswDq5ihu+hudD1MwREyMHeRn1hmWFd4gpqtJwdA4FOEQ3O128hcEEXiOqTGowQe8i9FtXA9NCy10CPULtaSsAIDG9L/fFBHRTQ0YRCpmhYkju+kVZ3os65dZxXF2SMPa+JRLt0IsCeMUW2aOxMvOzNZpmHPVQ0HTn3zFisOko1qQVUqe4IsK38lq9nxfJXA6Wc5LvpqqBXBV5CxWhzk1KyML2Q5YnjmtPR87vC2fOXPTr5Q9f+5qz/bdyHzcQdn7tWvgVtkRjzewlPnet1CGtaWQ9UG3cgDi8Zpmk4o5mIOjOLAPYhlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MMiK8w6s5twuxwfEprTMqRWxsWRwznDMK25Onlj8qw=;
 b=jky12gYRrpjf4PXF630nCLjGcfE0UAsQMZFhmSYbrHO+qyU5KmW1ty5Q3/AoBS8maiceSPF3QcVVD75AnBbObc12BDf/ymTY38y/d0+izWbTc9HFheh04NGCkV3h/r+hC4hd1WwptqVbEVI2GASn/Q/C8RTMcMO1YkrbL301EtJmY6fX0AMAD9EhFoU15nvp6tS2/8lH/G/0Ujy46E8fjtcWiuKgqu6KgqPbUxy4DpR0I8zKHLDK+DjzABtKDlL0LjWlOY93HqlxPEdgf53WuEv4JEn7Lf2FfyYtJ86rcvJjgUxTCjQgRCin4mAiXX6NtQ2kjvT7WxzSI5HdB9ybZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BL0PR02MB5649.namprd02.prod.outlook.com (2603:10b6:208:8a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 05:53:14 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 05:53:14 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
Thread-Topic: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
Thread-Index: AQHYRE/EvdWk4OgVD0y7uP1mIx6Fl6zYfvSAgAB/n3A=
Date: Thu, 31 Mar 2022 05:53:14 +0000
Message-ID: <MW4PR02MB7186669BA1B19FA4F184B558E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-5-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprMvik_6xmGt2oZGpDG9FoMtC_ojuw+oTjPLTck4Hu3WA@mail.gmail.com>
In-Reply-To: <CAA8EJprMvik_6xmGt2oZGpDG9FoMtC_ojuw+oTjPLTck4Hu3WA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 752e2b86-07d4-491c-d8a9-08da12dabf26
x-ms-traffictypediagnostic: BL0PR02MB5649:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR02MB5649B87407149EF2300734C39DE19@BL0PR02MB5649.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hEULcSnV+uKk7igBmCXFxPFFnJvdeVtxzhF88zxk5cEBGhWkoZmcTj7Kn5UKdK21LwMCknSW53mL6VxdCEOwyArqE5XEm1thme0RxIIjRtZ5Y8/AO1zo8KnRTUpn2MXQ0dc8W19d/eelFyQS4tdc6TCCHL3fheRDsHWYPKpZkhUhODWiJtnFIe6h/MX2Cm8SY1/DpFUckBAcSdZiwJ0+QZqH2LlKiJezAd0jIav7LkgQzYTeqpqTROlhYdTVptD7eeu3/ZZi1nbpmMhkPfo6bspO79WINOKrGdvjATxlVvIpoTG0PWgaz5Xb2P095tKg3Dc4w3S1Cn9YTE107XaKqi5sR05B311QAOr9AMvJUNdDQKLg8Qo+GgWxlRNXYf2k1u6JJ9GQf55N+OJlEiTmwakG2bHr54riTnQDEYo7g0Nz3S3G0PG8tiiPEyDqK09lSz+8RjEs7Uwc718nAD6XbwO0JsGHLURZvMOqq5Z98rXUVXgoD9xcnTMS5063ojYkH0l5Koh83XLuk7IXmpUVLzkL4yZ5C+8dqKcMT1ZeL4o2xTyOCAWMa4AHJzfB81qXFuKPXWRNsVExlFICGdWpCPa9+COkC/2eajOi948pA79U/q3MBsPt/BBoE7OEPTX7KKVx+lKFYPvzpWFD9EheL7KqRIDivLbHNSEdunQxTFBvA2xItr6Qo/7pn2BqHIWY6ZNBuRESGIDInAVcuMsGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(86362001)(6506007)(8936002)(7416002)(122000001)(9686003)(52536014)(110136005)(54906003)(55016003)(38070700005)(66946007)(8676002)(76116006)(4326008)(66446008)(64756008)(5660300002)(38100700002)(71200400001)(66476007)(508600001)(66556008)(316002)(33656002)(83380400001)(26005)(107886003)(2906002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1FhQmU4U0NoWEFsYzFsbUNvdDVHbWF1dkZyczRzclkxeFhkM2xIRjcxb0hV?=
 =?utf-8?B?bjRKV0RPZlZsMGZObmpZQ0o4YnFUOGs1cEo1ZGF2aWE5N2d4cDEzUWtGdjhM?=
 =?utf-8?B?TklaMHR0N0tMYW9nSFRIZjExLzIxUk92UXM2QmF5SUFxQ1ZwLzlWZDg0VnZI?=
 =?utf-8?B?ZGxvK2NVMHVRekRsa0dwK1hFQ0V5VWlNRXNVYmE2ZVQ4RTA2Rk9ZdTk0cUZi?=
 =?utf-8?B?SFYvcllhdXRSQTVSbis0RmgyZ2s0TDJuaFVQdFgxZ3BUTHpkN3pITEpoLzNi?=
 =?utf-8?B?VFdvK2ptczlNTnd6VVh6OW5BVW1IQ0N4YzdyWm9xZW0yNE1KSTZBUHA5KzBz?=
 =?utf-8?B?RzdJZTNRZTVtTEtKTXRIRTU4ZFlPaC9jRzc4U2l3OXUvRE1neHRUNU9BaEdF?=
 =?utf-8?B?eitxNllhR0o5ajRwYzBUZ2RmMTNQS0REZG9SV2ROaWVoRDFsdFRLMmF0d2w5?=
 =?utf-8?B?eHNvUERwclRKZlE0akZwbXBpTmRWTzdTRTB0bU1TSXlJL3duWE9aMjh4anhR?=
 =?utf-8?B?QjgwZDc2d3NWVUViRWNteHRiS3EvWEQwU1JjbFE5WVc1dG03VHRSWHhqbDB0?=
 =?utf-8?B?OSt4WUFrNmJyTFl1dHZ3VE9ic2I5TEFlVzN0OTNaSGdNM0V6SlBjRFYwQmdk?=
 =?utf-8?B?ZEpURk1oVlRKSXE4cWdzbFhSQU9xNjNVeUVjdHg4WXRBRW5SdmxiNVkrOUhx?=
 =?utf-8?B?SXBKZ0FObWZiMlZZdE5iRms5Tkg0cW11Zm9pUlRSZnd0cUQzOStsUEhwNEJu?=
 =?utf-8?B?SXR3bDJYSHROclZnckRJSTJYLzNPTlFPN2Z5ajltUkpwWkpCL0EyTUJBZ0pu?=
 =?utf-8?B?c0xhNEdPWGcvQzAvUGw5Yk1BK2kvRWc3eGNxNWw5eHZnT29qVkVBQmc4a0VX?=
 =?utf-8?B?UUptMEIveWJZMTRoditNVUg2RjZxd3lBZitEUlV1T2hlK01pOXRuSS81cU44?=
 =?utf-8?B?bVdDOFBFMWdiSFJqTXdFQi9ZYkU0Nnc4aFdRT2Fqd0ZxdDBoWVlmeTNiL21N?=
 =?utf-8?B?SXBGc0FPUTdZQ2VYNW9SSVNEY1ZKQVE5SzFVN0lXbUxvWW9sNzJPRll6SVFu?=
 =?utf-8?B?UjVoQ0RFMFR0SzJpSVhnY2Vma1ZTWVBPYWNIQW1zT1RVRkl1MkpGQURVTGph?=
 =?utf-8?B?ek10VXQ3eDhudzFDSEZZcTVHUFc0NDcxbEFIa0t2L09YTVpKeUM0S3VmQksv?=
 =?utf-8?B?aHFySGNtRE9sdXA2T001QlhrdTRqUzRIOS9UUjFnMzAvNG1Qd3RoT2xFWERo?=
 =?utf-8?B?Uk4zdENETXhLci8vdFpySFE2UWV2bmJiSGlTZXp3M2dBSTh2NTVXMnEzMGFi?=
 =?utf-8?B?MUYvNEFWem52T3gvQWo2dkVNWjcxYjlCVlA0bG92bllOcDFLdU9sNHFXUVZW?=
 =?utf-8?B?aFpVSXFWZE44bENjKzNaSVFSNXhMZjJUSGlqVGE1c0hjaWZMS2EyWGN0QkhW?=
 =?utf-8?B?a0ppbTY3eTdEdXNmellCY2g0d28zZHFKdUtYMU52UU0wNGY3dTV1V2lBU29G?=
 =?utf-8?B?WTdIUG4zcXFzOUtPb0dmSHcvbTVhODRUOE0rcEF4K0RoeFc3eC9DM1RiMXRz?=
 =?utf-8?B?NEFVRGtCdUZGdFo1WVRNWG4yNmtRMVVOWkVRVUJBOTdrRUZHOGRaTWFQOWsv?=
 =?utf-8?B?RFdPNVArM001VGNqOTRQQm5FcENONzVodXRPeDBFc1ZHZnlEVEhwb3Z2b3dL?=
 =?utf-8?B?ano1SHFCWS9KSFFVZzRTNjdYMU5JNkRCRXB2VjdpMFpMUy9nd2FuUnZ4TGNW?=
 =?utf-8?B?ODRhOHd2cGcwWFBzWm1zSm4rWERKdmZYZitDMERGOXF3UTBjWjRpbktRbE5y?=
 =?utf-8?B?MmtveDFucmVySEhDQXBENWtaVUJCWS9RRmNPelg2T3VFMDIxWUdtenZrOFpG?=
 =?utf-8?B?VTJRd3k5NlRZZlhFbXMwQzAya1lPTUhGNTkrd3IxVVUzK3RzUDNBVVY3NllD?=
 =?utf-8?B?QVR1dHhKanhaR1JSNFZmV3JDZDlremgwMVh3c01HRk1KVUxtOHp6NHpyMVB6?=
 =?utf-8?B?OTV5cUdxMnBKZmU1a2lMeGVxdStNUHZHN0hQY2ZNZS80YnpPaHQzek02THdD?=
 =?utf-8?B?eDRVMWtQL1dnejdkbS92NWh0cHNkZU5ZRDBuZ01YU1Vnc2ZHRk00SFNZL2Za?=
 =?utf-8?B?dUpKVlVyODdDaUdaVUFvK2FQWkxiV2t0RUlFOWg5YUZxR2NuWE9rR3UrcktQ?=
 =?utf-8?B?RDBYSEM4TmJZbHl3V08rc0ozVTMydzZ1bktyUG9HUktwSHRIQW94b1BMVG82?=
 =?utf-8?B?dEhjNWVQS2JhL2JGQkJlNUxuREgyM1pYZ1ZXN3dTUzNHQVYzS0xZcEtaQTNW?=
 =?utf-8?B?MklWNXRvbWlpaTJnaU94cnVDNDNGVUd5Y2lyT0pZL0tvYW51b0hVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752e2b86-07d4-491c-d8a9-08da12dabf26
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 05:53:14.4417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riFp2alAabvBK2GJDTm1MfP+VggsGvjbjGHJpHiZIpb2FTBcEnVLjLGZfv2suiVxb5GB8HSowR3slMJ8wIO7uq6KhsVeYYr/qFaUo+We2lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5649
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+IE9uIFdlZCwgMzAgTWFyIDIwMjIgYXQgMTk6MDMsIFNhbmtlZXJ0aCBC
aWxsYWthbnRpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IFRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIgd2lsbCBzdGlsbCByZWZsZWN0IHRoZSBjb25uZWN0IGFu
ZCBkaXNjb25uZWN0DQo+ID4gaW50ZXJydXB0IHN0YXR1cyB3aXRob3V0IGdlbmVyYXRpbmcgYW4g
YWN0dWFsIEhXIGludGVycnVwdC4NCj4gPiBUaGUgY29udHJvbGxlciBkcml2ZXIgc2hvdWxkIG5v
dCBoYW5kbGUgdGhvc2UgbWFza2VkIGludGVycnVwdHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTYW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jYXRhbG9nLmMgfCA1ICsrKy0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jYXRhbG9nLmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5jDQo+ID4gaW5kZXggM2MxNmY5
NS4uMTgwOWNlMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Nh
dGFsb2cuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5jDQo+
ID4gQEAgLTYwOCwxMyArNjA4LDE0IEBAIHUzMiBkcF9jYXRhbG9nX2hwZF9nZXRfaW50cl9zdGF0
dXMoc3RydWN0DQo+ID4gZHBfY2F0YWxvZyAqZHBfY2F0YWxvZykgIHsNCj4gPiAgICAgICAgIHN0
cnVjdCBkcF9jYXRhbG9nX3ByaXZhdGUgKmNhdGFsb2cgPSBjb250YWluZXJfb2YoZHBfY2F0YWxv
ZywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcF9jYXRhbG9n
X3ByaXZhdGUsIGRwX2NhdGFsb2cpOw0KPiA+IC0gICAgICAgaW50IGlzciA9IDA7DQo+ID4gKyAg
ICAgICBpbnQgaXNyLCBtYXNrOw0KPiA+DQo+ID4gICAgICAgICBpc3IgPSBkcF9yZWFkX2F1eChj
YXRhbG9nLCBSRUdfRFBfRFBfSFBEX0lOVF9TVEFUVVMpOw0KPiA+ICAgICAgICAgZHBfd3JpdGVf
YXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfSU5UX0FDSywNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoaXNyICYgRFBfRFBfSFBEX0lOVF9NQVNLKSk7DQo+ID4gKyAgICAg
ICBtYXNrID0gZHBfcmVhZF9hdXgoY2F0YWxvZywgUkVHX0RQX0RQX0hQRF9JTlRfTUFTSyk7DQo+
ID4NCj4gPiAtICAgICAgIHJldHVybiBpc3I7DQo+ID4gKyAgICAgICByZXR1cm4gaXNyICYgKERQ
X0RQX0hQRF9TVEFURV9TVEFUVVNfTUFTSyB8IG1hc2spOw0KPiANCj4gSSBzdXNwZWN0IHRoYXQg
dGhlIGxvZ2ljIGlzIGludmVydGVkIGhlcmUuIFNob3VsZG4ndCBpdCBiZToNCj4gDQo+IHJldHVy
biBpc3IgJiBEUF9EUF9IUERfU1RBVEVfU1RBVFVTX01BU0sgJiBtYXNrOw0KPiANCj4gPw0KPiAN
CiANClRoZSB2YWx1ZSBvZiBEUF9EUF9IUERfU1RBVEVfU1RBVFVTX01BU0sgaXMgMHhFMDAwMDAw
MCBhbmQgdGhlIHZhbHVlIG9mIHRoZSByZWFkDQppbnRlcnJ1cHQgbWFzayB2YXJpYWJsZSBjb3Vs
ZCBiZSBpcyAweEYuDQoNClRoZSBtYXNrIHZhbHVlIGlzIGluZGljYXRlZCB2aWEgdGhlIHJlZ2lz
dGVyLCBSRUdfRFBfRFBfSFBEX0lOVF9NQVNLLCBiaXRzIDM6MC4NClRoZSBIUEQgc3RhdHVzIGlz
IGluZGljYXRlZCB2aWEgYSBkaWZmZXJlbnQgcmVhZC1vbmx5IHJlZ2lzdGVyIFJFR19EUF9EUF9I
UERfSU5UX1NUQVRVUywgYml0cyAzMToyOS4gDQoNCmlzciAmIERQX0RQX0hQRF9TVEFURV9TVEFU
VVNfTUFTSyAmIG1hc2ssIHdpbGwgcmV0dXJuIDAgYWx3YXlzLg0KDQo+ID4gIH0NCj4gPg0KPiA+
ICBpbnQgZHBfY2F0YWxvZ19jdHJsX2dldF9pbnRlcnJ1cHQoc3RydWN0IGRwX2NhdGFsb2cgKmRw
X2NhdGFsb2cpDQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+IA0KPiANCj4gLS0NCj4gV2l0aCBi
ZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0KVGhhbmsgeW91LA0KU2Fua2VlcnRoDQo=
