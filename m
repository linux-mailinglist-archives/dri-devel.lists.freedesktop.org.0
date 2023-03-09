Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D36B24F1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 14:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB5710E19A;
	Thu,  9 Mar 2023 13:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF26E10E193;
 Thu,  9 Mar 2023 13:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xte+voxQRI2PZqLZG17ypLM1X6cuXUDx/QHTSIXvq/26JOvxEDzVKcRLJrBveWJ7Za6wQhV65frsT8R5hfBIXg8NSYXjEmlb0fpIrpOKN6ox0eKo2b8pmJ9hDPomi6BWe9PD0saqbcBDi7eMf6xxBmjT/iCCtETvmEjCDODB8FG/AdueB8z2ABuWPf/P8U8BJmRxT45ximHOwIjaqIVWSRnyp/ZyRdsCL5bojbGjTSobWLOCPNG8ZEcDnPNJzQtuCgG1H2QXjkfQN3Y4M0NhhwfKRUTozytg8UKCasyeDIJ4ppbnaHKQkWaFPEEaJlxMAiPwNrohGJ+/BIDaRk0WbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v9oSzaq1KISJCVamf/b24KGm6z0P8urLivRplwPzc8=;
 b=UD9LNrmAHaCASg/h9UL264HcQK3BZcC8ldGWHWcCmLKxTHYEnmtExElEEHGsVkCtH8QSTyNkRVc3Lc6W/NAbiNagL2xevv2nkYgEkIEL01hIF2gEPJh/Hi0M3wT5RhyukhxfsIvmlRqIoQjkeyQebfSKI4aiQvywUpTykmhgqLMMxz+tImtPldJu45JIgiR1NKQIuwkxmg7umlZefeyxIx1WG0R2cJPvIeJJH17q/u7kRlzEpWt2U9kGUISziRf/VSuvpcDcgPygrP4j+Bk+8r6CpdfiXpcILyA99PSFsO/JeOqUSYNGs1WtCu7l5hmq/iuWrNIo/cvoinOPtIIcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v9oSzaq1KISJCVamf/b24KGm6z0P8urLivRplwPzc8=;
 b=zarYfjo4MndSGh+wsm7bZS+0RELMDUPZW/g7pzjPgpbI2E7fdmKynA84jtWePS6tEFuVvpRC/9wIPfMlN0dk2SdtwPRRGzvZURUDobS7a2eHRrEKdEeijOfNCDc9LiMIYDkUeOT1g1jZ76qsS5iFsDlXFMhJnJ3RRddlshmiXYc=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Thu, 9 Mar 2023 13:08:24 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::5ca6:3a18:d6ee:c103]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::5ca6:3a18:d6ee:c103%7]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 13:08:24 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "spasswolf@web.de" <spasswolf@web.de>,
 "mike@fireburn.co.uk" <mike@fireburn.co.uk>
Subject: RE: [PATCH 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
Thread-Topic: [PATCH 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
Thread-Index: AQHZUkrW7S/6g5YgGE2ESYQquCWL0K7yI2YAgABICTA=
Date: Thu, 9 Mar 2023 13:08:24 +0000
Message-ID: <DM5PR12MB24697A79C29109E2B3CCB757F1B59@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230309054839.2709424-1-guchun.chen@amd.com>
 <55b40f8f-b1d8-71ba-0af5-91e08e69160f@linaro.org>
In-Reply-To: <55b40f8f-b1d8-71ba-0af5-91e08e69160f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|DS0PR12MB7897:EE_
x-ms-office365-filtering-correlation-id: 13268c18-220e-4bf3-227f-08db209f5d9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ArBoZYXi3NrsM/0X/5NKWFbto0w6P+8Yd9Q7lAPWHr6tVm+m1GBDpI2VOAxstgzrCkex3XQfYbdvXKvfF5ITvNjyniuTklaAITjaQ1S1Z5/PODcwi9eEIzTFRrs7UIFdePxmX1+KFO80GAQ5isu+aBpDniPRkCEdmiVjT7PU5gLJr/2Z2hMDzMH6xviYngio1DPHlB2J4tMb9mIWwZQNbwx3naMO7QoFCjVQFCaRN75lysYNzp1BbD9lZDK6jMel1CS/c+mFsPf4VdGDj3o9uRFUTB9YZ+OjXBqnU3fdw27u3GOoadiFa4oCiW2RqMQ1iBIDxptccHYtc4eG57+cYQGsaHAAX/tCJlinp02jo8/hGXb99AmPBYJJMZjYM4GF2GOuddxzZuHMP2hbjix6+05NA6hD6I+C57EIXVVJmHsmICurhx2DmfcVex0W8yoVrcxL1ScGH7KNd12AccaBwpckUYE2BwRxSrtVvyVYjJVM5HLHSO9EE13AOMKEK8XxY0CzF2BqS0GzibNAFH+wzAfBvPv0BQkJpnadlCNb0T01lMrh3GpTAmB1i76z3qJjLGarRY7sRDtATNBOd/ri5VqL+jnC81HDGprzpbgvF9Q2fUMHaQ4BofN5/pcN32sLanJ7FJnn8Ihcb6bA14xGfp4vWl9/wiSM1oZ9vDHtSWtQ8S8h5vDBqIFGH6lEesr2Zqsi12+Mo56VUgflJjIMfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199018)(2906002)(186003)(9686003)(64756008)(8676002)(66556008)(66946007)(66446008)(76116006)(38100700002)(66476007)(122000001)(38070700005)(53546011)(26005)(41300700001)(6506007)(86362001)(33656002)(52536014)(316002)(110136005)(478600001)(83380400001)(966005)(55016003)(7696005)(8936002)(5660300002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUlGUU00M2V3cFhqWFl0MEV3OTl4VTFPWDVoUG5GVGhRSzF4dlBaYXFvOTJH?=
 =?utf-8?B?SkV6RTV6SzRRUGlGaU0vbGIvSUUrMHozZFREY1RRbXlJRU82ZVo4bzY1UFQ5?=
 =?utf-8?B?MFhQb2s1UVJPcU1HanR6ZERJcEZuRFpTbXRqTDluWHRJbnhNdTVFMjR6MlJa?=
 =?utf-8?B?bTNhSHhJbExBcTU3YVJScTdlbHBrZ2Zkc2ZjSlZTVWVReFoxd1htUHVwVGJG?=
 =?utf-8?B?WTdSNVQrS05hNVprZ3c0YVVpV01kQnRTZkkvcFVXQXFjVWpXMWx2U0VYYk1u?=
 =?utf-8?B?YzRFYUpCODhYNVcxRjBjMXgzQUJKeFNzVlBHKzBpeEtYQ3pkTEE2RFg0MDNx?=
 =?utf-8?B?dDVCMnBpSWFaYy94ZUtla0dXZ1N6aFhjT3hKaFFWcnZnQTBSaTJZUEJyWmZL?=
 =?utf-8?B?WU51eXVJcGxaRnlqL0N3V0pVd3FXeVdic2FhSXFKSjhIcTg5TVJFekxlLzJZ?=
 =?utf-8?B?ckFrcUJTTXRyNm13SE1lTXd2MnBWdmt3Ukc4ZUF6TVROTjV4R2lITE03VzVS?=
 =?utf-8?B?cElxYnduYUMxbHA3WUdRRzIwNWwxVkdBY3N4Rk9JTk9Jek8wMG5WNmtuWS82?=
 =?utf-8?B?Q3BIeDE3QjUxc1c3QlY0RHF4QUxUbDlpQWZRNUc3bEthMFhoV1NFemZxdXor?=
 =?utf-8?B?dEFRaWxIc0lxbkR6aUY2TEJlOU1VYzJlY0lWY2JBY0h0SWVBTXlmTitYNmFY?=
 =?utf-8?B?ci9rSVVIRUVtR2h3aGwzMGRtc3R2UzVDcDhMOTltSVRWWXRuUTU0aUx0b3ZY?=
 =?utf-8?B?c2NVZHZoVjBsc0MyZENKdzlpd2xKTGMxSEI2NVNQa1hGaThvTTRVakNBNnUy?=
 =?utf-8?B?U2ZRZXMwRkJabm1iNWtnSTg3NU4yMytML3ZxZ2p6WlZBZDlMVXNBTWs3a2l4?=
 =?utf-8?B?WVV3SHJsQkQwR1ZibTZ3NVhiUG1scGNkQmh2QzUrTGk1MWVrbVV4Rk9KZ0Uz?=
 =?utf-8?B?b0lENDBMc0hWVTBhaWNJb0N6eTBJRWxadzlKeklMRmM3dGZBbSs2d2FxS1RH?=
 =?utf-8?B?dytyYXppL0ZCVyt5UWNITytqQVREc3ozNnZZQjJrM3FTL29EbkY5aC9GWEZK?=
 =?utf-8?B?WTRRMzlVcTJqREtzK3dnTzhtSkRadHRkMFV0YzFxVkhwbWduMmREL2YzVlo4?=
 =?utf-8?B?RlNtajJ3SlIrNVJDQnp0RVZna2ZXOUFxbjRyZHh5eHc2WVROVXc4WGFTeHMz?=
 =?utf-8?B?aDFqcHAwR1dreXduYzJjR2E5UTRKbk5GaEdkcVo3dlc5Z3lhZ0hVYWxsRUNi?=
 =?utf-8?B?SE9Penk4UXNFSlhWejBEdnlIZkYzcGtNaFl3ZDFXMXVGQk0rOFdIM1pDS2M3?=
 =?utf-8?B?TnFBSjlmbU9VMUlOVUJ4bFJadVphNUxGRDVWbEdwbWl6UlU1Q2p3eW1jMFdK?=
 =?utf-8?B?L2NYL0lGL1VHbEhFd2ZIU3pycWZvMjQrTXlqQW9uZkpyZFRVR2JjTG1mVGw2?=
 =?utf-8?B?aHBiRDA5eWZrdWhwOTN6MTVIdXJueUROWkZlZUFlTjg5UlU0ZW1kT3RHSyt0?=
 =?utf-8?B?LzF3T2RoSVBnRFhLWXovYVhkQktOSmxKQVFTWDE4STdLS1Y2SVBQLzdUQk14?=
 =?utf-8?B?SGJBd2ZiTlZjdlZET0hRc1NVRDJTQzJvaS9qUk0xQkhMbmpWSFNaZm5Gazkw?=
 =?utf-8?B?RXlkQjhRNnFVdzkrOE9ZOTRJemk3eHJPb04vekJnaG1ocGRSTlJBWFhjSFhP?=
 =?utf-8?B?S2g2bFRJb1RrVmdoc1FMT2hPVEkwT2JyV2ZsbFROQUdaWVJPSUpCcmkrS1BK?=
 =?utf-8?B?UVZrNkxjNmJEUE92a1lkRGRIU2I3WGw0Um1Lem1HS2U3NE0wRGhyQVRhRHlE?=
 =?utf-8?B?ZTc5aXJMd1ZaQWszOHY1c0JaU0xWZGRLeGNGNGN0em9pSzVXT0NSeGxCSGpo?=
 =?utf-8?B?UnM3WVN1cmU0dEtWUlFncTEzNksvNEhzNWF6cWMyUlVDRWlUbkFsNmI0UGFR?=
 =?utf-8?B?TkpkUEFZenF2djNRcnRLNWtjS1JNK3V0ZUdhYU56TVd6d0tkcE5iN29pcURW?=
 =?utf-8?B?TXZ3MmFYd3pGWklNNXJuRnRpZEZ6RnNNVGlXWFN0MThFb0pKa3JRR2dCeWx0?=
 =?utf-8?B?ZEVvTEVBTXhoRDFlbC9BNlVrQnE1K29ReENaWnFzaTlnSzdvTUMrWkhkK1ho?=
 =?utf-8?Q?EDbB6KhvrzadU2M7TyAM/5jhv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13268c18-220e-4bf3-227f-08db209f5d9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 13:08:24.5147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uQOJhUTZkcDGauNOmO9vl1pHjXo222rxI+e+ZFlwG66M8jhIi+1Vl+HVq8kD0I49Pz+rucvfk/omYJyWHEvcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2gg
OSwgMjAyMyA0OjQ5IFBNDQo+IFRvOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+
OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IERldWNoZXIsDQo+IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBzcGFzc3dv
bGZAd2ViLmRlOyBtaWtlQGZpcmVidXJuLmNvLnVrDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8y
XSBkcm0vcHJvYmVfaGVscGVyOiB3YXJuaW5nIG9uIHBvbGxfZW5hYmxlZCBmb3INCj4gaXNzdWUg
Y2F0Y2hpbmcNCj4gDQo+IE9uIDA5LzAzLzIwMjMgMDc6NDgsIEd1Y2h1biBDaGVuIHdyb3RlOg0K
PiA+IEluIG9yZGVyIHRvIGNhdGNoIGlzc3VlcyBpbiBvdGhlciBkcml2ZXJzIHRvIGVuc3VyZSBw
cm9wZXIgY2FsbA0KPiA+IHNlcXVlbmNlIG9mIHBvbGxpbmcgZnVuY3Rpb24uDQo+ID4NCj4gPiBC
dWc6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzI0MTEN
Cj4gPiBGaXhlczogYTRlNzcxNzI5YTUxKCJkcm0vcHJvYmVfaGVscGVyOiBzb3J0IG91dCBwb2xs
X3J1bm5pbmcgdnMNCj4gPiBwb2xsX2VuYWJsZWQiKQ0KPiANCj4gUHJldmlvdXNseSBpdCB3YXMg
c3VnZ2VzdGVkIHRoYXQgdGhpcyBpcyBub3QgYSBmaXgsIHNvIHRoZSBGaXhlcyBoZWFkZXIgaXMN
Cj4gaW5jb3JyZWN0Lg0KPiANCj4gQWxzbyBwbGVhc2UgdXNlIC12TiB3aGVuIHByZXBhcmluZy9z
ZW5kaW5nIHBhdGNoc2V0cy4gVGhpcyBpcyB2Mi4NCg0KV2lsbCBmaXggdGhlc2UgaW4gVjMuDQog
DQpSZWdhcmRzLA0KR3VjaHVuDQoNCj4gPiBSZXBvcnRlZC1ieTogQmVydCBLYXJ3YXR6a2kgPHNw
YXNzd29sZkB3ZWIuZGU+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0
cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4g
PGd1Y2h1bi5jaGVuQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3Byb2JlX2hlbHBlci5jIHwgMiArKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVs
cGVyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMNCj4gPiBpbmRl
eCA4MTI3YmUxMzRjMzkuLjg1ZTBlODBkNGE1MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9w
cm9iZV9oZWxwZXIuYw0KPiA+IEBAIC04NTIsNiArODUyLDggQEANCj4gRVhQT1JUX1NZTUJPTChk
cm1fa21zX2hlbHBlcl9pc19wb2xsX3dvcmtlcik7DQo+ID4gICAgKi8NCj4gPiAgIHZvaWQgZHJt
X2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ID4gICB7
DQo+ID4gKwlXQVJOX09OKCFkZXYtPm1vZGVfY29uZmlnLnBvbGxfZW5hYmxlZCk7DQo+ID4gKw0K
PiA+ICAgCWlmIChkZXYtPm1vZGVfY29uZmlnLnBvbGxfcnVubmluZykNCj4gPiAgIAkJZHJtX2tt
c19oZWxwZXJfZGlzYWJsZV9ocGQoZGV2KTsNCj4gPg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdp
c2hlcw0KPiBEbWl0cnkNCg0K
