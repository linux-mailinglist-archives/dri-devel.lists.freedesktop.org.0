Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6D4F8146
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 16:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C30E10E28D;
	Thu,  7 Apr 2022 14:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289910E077;
 Thu,  7 Apr 2022 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649340342; x=1649945142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VvEHrHCsBkj7wJ/Vs+2zdcaCkI7RGH2IpYDiURV9KXY=;
 b=mMhxXE8FwMKXWQXQ5KwsE+elPlb8TnaSfgYKN8FJS1xbsdM4ET9hx5fp
 SCsnz85qwAcGsYFZCelClWHcJrXDIvQKHU52cYyit5h16b52mc/x15g1i
 ylyg2nWjybPOQLzsB0vNqrsZV2TcD/J7WlWVPPOFG7pL8cEKqLqYxm/FT 4=;
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 14:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxe70s+WTpNSrFRSgg593cPnRv3M30LW0H/ioT9vIxg7JHGKOM3UclTw8orsVtxEbOdMiUdEJY2DMpQBqa9nIFP850VD9Y3SuELf8KFg+VpK28z45LPnYCnKqYItJOOFwJJSDZyb/fm7XkyIuR68tx6Hgj7WND2Tc4p15CeOxgguSPqsWBobG2rR60ZTEXL/n4UMDYJt5PxDwdBLdVZRG5l6TfUopyoRcNuzYYoJY8bZivxjT/pcTGTW0bX3fP/1X5boRRYtHikEbPDraxMnnatFocjmBAs9oUB3Uay/FeEKZg06O1w+JmSGt7Md4ebRmDtS07AHaUTur+u6ArlsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvEHrHCsBkj7wJ/Vs+2zdcaCkI7RGH2IpYDiURV9KXY=;
 b=h/vr57Tws5dKX6WgcyW4l5MKG0V4Ha0infDfGYys2S5gZc/at7zifT4AaOQVh7H79FVB0kTeMh81b9URo7z5KtTcQrpqC8yasEHrOx2Dj/8zYb4UYLAoBLNTjzQRkoi2f4QKLcduIb3F5fCxTlLrmji2h37hCeIwb1qKq1iQv+hgg6XS+l/S3Own1gbND9IEcW0XRz5E9dvxYhAwd7IJK7ZG4MJhZ2Qiqp+Lx4xbZeF3V81VrFZpeX+jlgB4EDAdZtMLeAEWiLCKJGFgJvtX13HzHrBGH5H8XJqX0hq67F5N3JpBLMDlPt+cfQZ/8ov/06BM6wjjthlWO8OvqW/6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BN6PR02MB2178.namprd02.prod.outlook.com (2603:10b6:404:31::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 14:05:36 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 14:05:36 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
Thread-Topic: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently
 from dp
Thread-Index: AQHYRE/UsJWR5XLNukW2wMYYKa9U06zYfJ8AgACEi0CAASMMgIAF9JqAgAA0tICABDr0AA==
Date: Thu, 7 Apr 2022 14:05:36 +0000
Message-ID: <MW4PR02MB71868617E96D59D659EFD87EE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
 <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
In-Reply-To: <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11efe1dc-e2ff-47fd-87b6-08da189fb051
x-ms-traffictypediagnostic: BN6PR02MB2178:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR02MB217835375B347A56261F46D19DE69@BN6PR02MB2178.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pLwlXWDWmOpCROiTDhJpXegWPwD79auMSWL5B/yriGZSCIVkvNURiLKC4SYC2VUtNIWgtUcouyanhRAaj/mkb4vTVOvrY4TYNbU7KuPodU5t6YrD5GHbyfCaoFhfvh/3pU/oMV9xhOiYb1lRpFeFK57lIzLCRbypwhTBp2lVrShH5WrBtPX5qPs1/GRshNhZ5mfrEPDFoAn5Uk5Zh0XWbdyRJEdk6YGgK/SnaccJQd/gFagTP88uL3VAgJs3UpSQzjjF5EfCakcDNxWm1P/LiLCyDQd+KVtAQCNz3meHwqotOk7cAEKHheGRogcfoVZS+W8hqOgPitYrJ75oaFgSERY3pWyY4vehvVEaajPevqR+Egn0NAwaDGtFbN8I+0tre+eLC11wNnTCX+45JjOj3PuEkPDyJVaKYPWakLaKtU9PNUJn93tavCay7m4LI9jeYrGY145bF3JSaKuUU44vJgSK4uFJA752xPju4XenyZ6pZirVtSYskYQzr0Z+VUFc8tlw5C5wL2+eh+L7QEp/0fs0aks/ARu7oZxSQtTRrYfizGc3g50Wmlz4rI+CmLOt9rEju2qWhY5sNHe+kAHA5ZRslagqUrWBnfNd+tjhtlGLkXrtKLuxVlR20x/V7usxloEeZwN8lyjRskwm21o/OT5ZpaZP0Cs7QK0BzOfS9UK8W/VTsU+98RvC2ZA9IqoAXRb6ER7zeaosuKTffArY6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(33656002)(64756008)(38100700002)(83380400001)(55016003)(66946007)(7416002)(66556008)(5660300002)(76116006)(52536014)(122000001)(66446008)(66476007)(966005)(8936002)(316002)(110136005)(4326008)(54906003)(107886003)(186003)(26005)(86362001)(6506007)(71200400001)(7696005)(9686003)(2906002)(38070700005)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkI5QnEwR3JQYXB4MWQ5Z1dITkpMaUlWNTFMOHl4aVdJOUxwNWVHeW4yZG5I?=
 =?utf-8?B?RW9TWEgzQUxITC9oL1EveFBDNGpueEtkanFOSGJUUTVFSG1mVVZmU0xHamxL?=
 =?utf-8?B?ZWdPdGNZaHZRVUJQaVdRNHdxS3hXMFpHWnJVelRweVZPRnpqaGg5eHBTM2l5?=
 =?utf-8?B?L0JqdCtlQXM4OUx5cUExaTJ2dEo0VC83dVBNYkVCOXg4bzgwZ3N0eUZ2V0J5?=
 =?utf-8?B?NkgycURLYnZaTWFnUms3dTV4S0FhSy80TndJMnBWOTYrb0VDR21HSGxwM2RJ?=
 =?utf-8?B?VHMyYjBhR1JSZFBaWWVlSWRWdGVkeHFyYmRPQlA0cW1kMVJ6SnlHSmx4cjJj?=
 =?utf-8?B?SlkvY09QZUdrRHVHM3p6UStkR01WYUNTc1F3ZnM1ZHpwTGh0K2NZbzJsbmlx?=
 =?utf-8?B?ZDIxaTZ0WVl1OUdoOGt1b2pNazlxUjQ0Zyt1V24wN3ZuTWhjOUNLS2tLY2ln?=
 =?utf-8?B?eThBSDNPcHRhYXFtdi9hTkpoMTJFeDZVeURkdTNaMTJ1MndxbFc4dDIycUJp?=
 =?utf-8?B?Q2ZUSm5CVHd4U1JWUy8rWGJ2VFpaR21GZExlWllRdFJKdCt3T043QWdEZk5n?=
 =?utf-8?B?RTlBRk9GRmtIVitPWFc4L0U2di9kTTZ4SHk2a3BLUzRqd2gwWGM0OXN6ay9D?=
 =?utf-8?B?RVN3YzAzNk5MY2g3VGxKdlNwb3NhRUxvMmVnV2J3d2dsb2V5U2lGSFdUVlc3?=
 =?utf-8?B?alhpWUZqaG4wUmpJSzRBR2V6cnBJQ1Vnc0RidDNaNlZESldBbEx1aHZWRThP?=
 =?utf-8?B?ZEtMSTlhSnVoVFlGVXphcTlKOFptOHh2T05hWDN0VmN4S0pGYlN5WEdqazNS?=
 =?utf-8?B?RlJIWGNKeC9JczFwYzY4K1E3U2RZS1E4bTlxTE1HY0p2Ti9uYVp4WTE2NnRB?=
 =?utf-8?B?em9nSU9EMkdvcDBMOFI4Q0FYUTVKVUl1dkFmeGRFeDdZaDhXRkZiNzZCYzVy?=
 =?utf-8?B?VTM3UE5memMyVDNVMkVOUHpoT0RkVlpPekJzeWhPU3AydS9zdStqemtsWEhY?=
 =?utf-8?B?N2FsOTFLTVNmQ29sWjVnQXpUcXJPL3lwTFhNTmtSMCsrSmE2SWUrNHdwNzN0?=
 =?utf-8?B?a01yOXc3UjFCTHFYUkxoNzBOaDNUdUlma3lCWlJKdlNKK1lMeTJCRWFuZjJz?=
 =?utf-8?B?d2pBM3d5MlpmbHhrR2o3S3piQU9BZHNFOHJDcHlhWHY4M2dIMyswWWt3dXF6?=
 =?utf-8?B?S0lxV2lDRHp3TUdVQ3h4ZmhyaFl1V3Z6Ykp0QkloNjF4VVF0VjJFUHZHR1lH?=
 =?utf-8?B?V3VQdE1WaTZzM0I1SkkwR0lqVmVvdVRlTjZubU9mOXdyajNweEVOS1ZVRms0?=
 =?utf-8?B?QTRLWHdHWHllYWRIcVJBb0c2VUlJeUFFYkl1NUZoYXpxeU9mRnk1R3J2Zmc1?=
 =?utf-8?B?R2FPa1V4TGFmNyt5Q1M5c2lkc2Qwd3ExWnR2RzRlYkxwVm1CWElxTC9kaE83?=
 =?utf-8?B?TFBQRThIRTZNNm1wY2hnMFVpazhPMityWFY2YWNHK2hqZkFhdWxyZjNXS05l?=
 =?utf-8?B?SUtxa09lRTNJUFpaZ05kRUxiVURqbzIrYkRmb2g1UmtIeXI1UXdCb2xVQ0Rx?=
 =?utf-8?B?aTM0Z1hCNkFxQlN2ZzJOOWlkeEU0Tk4xSTNFSkZ1WWR4cUZrYUhRSzBBQndM?=
 =?utf-8?B?amY3VHk5R0UrdE1FT0hrUXJBMUMvc2ZjQ0pEak1ZMU5xV1VtaktpR0RHc3ow?=
 =?utf-8?B?WEtVdmtWNzJwUkVWNzB5U29iUlpib0tnUHRPWFF4OUpmaU5ObmQvTlhBVG9Y?=
 =?utf-8?B?bHBoZmE2bWUyeDFGamFtNm9DTTFOZ29nb291OWpGYmI3S0hUK1E0VU9POTZT?=
 =?utf-8?B?WksveVg0d2RmRkE4N2Q1S0J1T2w2QldxcXNXT2FEMk9wUTRHL2dLODBPOUlj?=
 =?utf-8?B?ajhqNFBKaGRTWXpmRHNjTTFyRmV4c0lRTFVUVjZoYXRmTXRFMk5BblFiZ3dO?=
 =?utf-8?B?OXV1VGx3eFdnSUI3eW1qTEhYblhWZFNEdHJTdjJoYWxSWWE3NlgzMG5BMmZp?=
 =?utf-8?B?cU1xa2xMYjFneGR1SXU3cHk3U01FOGUzVlppMTd6VUE5Tm5aYVRPV0ExQ2Rh?=
 =?utf-8?B?SmpFSEl3UW5sQUowU2FocWFtQW5YcURmaVIxVmlIeTJVY2xqMWFmdXB3c0dP?=
 =?utf-8?B?QTJXUjVLNG9WWElRaGFFaGVJSW9MYnk1SXFaSm9lWnZUNXRzeXlIQkdWdmJj?=
 =?utf-8?B?eDNHOEZUOTY3Ym5rTWQzYTA0WjVqMkhXRVRHdXJ3THJ5OThrM1d6WFh1THRZ?=
 =?utf-8?B?KzEwRE95bjlSUXAzZm85TER1UmRvU01lVXgzeHhWTFErVVllVklkREphd1ZV?=
 =?utf-8?B?V0hnVHpMWktyV3lMenJkTTh3M3dwR0Y4QURLNWRNV0tJUkZ4OHhzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11efe1dc-e2ff-47fd-87b6-08da189fb051
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 14:05:36.1315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZSsSzWTHDgW0XIBhmDnr4eJ/y8sZaZspUXmH7Ruv531zx/Wz1guLQLQESijlPeDzHYYd8xaP9i2cW6YTaSWFZPa96sUnDps4oz17D9EqQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2178
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
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+ID4gPiA+ID4gT24gV2VkLCAzMCBNYXIgMjAyMiBhdCAxOTowNCwgU2Fu
a2VlcnRoIEJpbGxha2FudGkNCj4gPiA+ID4gPiA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4g
d3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIHBhbmVsLWVkcCBkcml2ZXIgbW9k
ZXMgbmVlZHMgdG8gYmUgdmFsaWRhdGVkIGRpZmZlcmVudGx5DQo+ID4gPiA+ID4gPiBmcm9tIERQ
IGJlY2F1c2UgdGhlIGxpbmsgY2FwYWJpbGl0aWVzIGFyZSBub3QgYXZhaWxhYmxlIGZvciBFRFAg
YnkNCj4gdGhhdCB0aW1lLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFNhbmtlZXJ0aCBCaWxsYWthbnRpDQo+ID4gPiA+ID4gPiA8cXVpY19zYmlsbGFrYUBxdWljaW5j
LmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgc2hvdWxkIG5vdCBiZSBuZWNlc3Nhcnkg
YWZ0ZXINCj4gPiA+ID4gPg0KPiA+ID4NCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzQ3OTI2MS8/c2VyaWVzPTEwMTY4MiZyZXY9MS4NCj4gPiA+ID4gPiBDb3VsZCB5
b3UgcGxlYXNlIGNoZWNrPw0KPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBjaGVjayBm
b3IgRFBfTUFYX1BJWEVMX0NMS19LSFogaXMgbm90IG5lY2Vzc2FyeSBhbnltb3JlIGJ1dA0KPiB3
ZQ0KPiA+ID4gPiBuZWVkIHRvIHJldHVybiBlYXJseSBmb3IgZURQIGJlY2F1c2UgdW5saWtlIERQ
LCBlRFAgY29udGV4dCB3aWxsDQo+ID4gPiA+IG5vdCBoYXZlIHRoZSBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgbnVtYmVyIG9mIGxhbmVzIGFuZCBsaW5rIGNsb2NrLg0KPiA+ID4gPg0KPiA+ID4gPiBT
bywgSSB3aWxsIG1vZGlmeSB0aGUgcGF0Y2ggdG8gcmV0dXJuIGFmdGVyIHRoZQ0KPiA+ID4gPiBE
UF9NQVhfUElYRUxfQ0xLX0tIWg0KPiA+ID4gY2hlY2sgaWYgaXNfZURQIGlzIHNldC4NCj4gPiA+
DQo+ID4gPiBJIGhhdmVuJ3Qgd2Fsa2VkIHRocm91Z2ggYWxsIHRoZSByZWxldmFudCBjb2RlIGJ1
dCBzb21ldGhpbmcgeW91DQo+ID4gPiBzYWlkIGFib3ZlIHNvdW5kcyBzdHJhbmdlLiBZb3Ugc2F5
IHRoYXQgZm9yIGVEUCB3ZSBkb24ndCBoYXZlIGluZm8NCj4gPiA+IGFib3V0IHRoZSBudW1iZXIg
b2YgbGFuZXM/IFdlIF9zaG91bGRfLg0KPiA+ID4NCj4gPiA+IEl0J3MgY2VydGFpbmx5IHBvc3Np
YmxlIHRvIGhhdmUgYSBwYW5lbCB0aGF0IHN1cHBvcnRzIF9laXRoZXJfIDEgb3INCj4gPiA+IDIg
bGFuZXMgYnV0IHRoZW4gb25seSBwaHlzaWNhbGx5IGNvbm5lY3QgMSBsYW5lIHRvIGl0LiAuLi5v
ciB5b3UNCj4gPiA+IGNvdWxkIGhhdmUgYSBwYW5lbCB0aGF0IHN1cHBvcnRzIDIgb3IgNCBsYW5l
cyBhbmQgeW91IG9ubHkgY29ubmVjdCAxIGxhbmUuDQo+ID4gPiBTZWUsIGZvciBpbnN0YW5jZSwg
dGlfc25fYnJpZGdlX3BhcnNlX2xhbmVzLiBUaGVyZSB3ZSBhc3N1bWUgNCBsYW5lcw0KPiA+ID4g
YnV0IGlmIGEgImRhdGEtbGFuZXMiIHByb3BlcnR5IGlzIHByZXNlbnQgdGhlbiB3ZSBjYW4gdXNl
IHRoYXQgdG8NCj4gPiA+IGtub3cgdGhhdCBmZXdlciBsYW5lcyBhcmUgcGh5c2ljYWxseSBjb25u
ZWN0ZWQuDQo+ID4gPg0KPiA+ID4gSXQncyBhbHNvIHBvc3NpYmxlIHRvIGNvbm5lY3QgbW9yZSBs
YW5lcyB0byBhIHBhbmVsIHRoYW4gaXQgc3VwcG9ydHMuDQo+ID4gPiBZb3UgY291bGQgY29ubmVj
dCAyIGxhbmVzIHRvIGl0IGJ1dCB0aGVuIGl0IG9ubHkgc3VwcG9ydHMgMS4gVGhpcw0KPiA+ID4g
Y2FzZSBuZWVkcyB0byBiZSBoYW5kbGVkIGFzIHdlbGwuLi4NCj4gPiA+DQo+ID4NCj4gPiBJIHdh
cyByZWZlcnJpbmcgdG8gdGhlIGNoZWNrcyB3ZSBkbyBmb3IgRFAgaW4gZHBfYnJpZGdlX21vZGVf
dmFsaWQuIFdlDQo+ID4gY2hlY2sgaWYgdGhlIExpbmsgYmFuZHdpZHRoIGNhbiBzdXBwb3J0IHRo
ZSBwaXhlbCBiYW5kd2lkdGguIEZvciBhbg0KPiA+IGV4dGVybmFsIERQIGNvbm5lY3Rpb24sIHRo
ZSBJbml0aWFsIERQQ0QvRURJRCByZWFkIGFmdGVyIGNhYmxlDQo+ID4gY29ubmVjdGlvbiB3aWxs
IHJldHVybiB0aGUgc2luayBjYXBhYmlsaXRpZXMgbGlrZSBsaW5rIHJhdGUsIGxhbmUNCj4gPiBj
b3VudCBhbmQgYnBwIGluZm9ybWF0aW9uIHRoYXQgYXJlIHVzZWQgdG8gd2UgZmlsdGVyIG91dCB0
aGUgdW5zdXBwb3J0ZWQNCj4gbW9kZXMgZnJvbSB0aGUgbGlzdCBvZiBtb2RlcyBmcm9tIEVESUQu
DQo+ID4NCj4gPiBGb3IgZURQIGNhc2UsIHRoZSBkcCBkcml2ZXIgcGVyZm9ybXMgdGhlIGZpcnN0
IGRwY2QgcmVhZCBkdXJpbmcNCj4gPiBicmlkZ2VfZW5hYmxlLiBUaGUgZHBfYnJpZGdlX21vZGVf
dmFsaWQgZnVuY3Rpb24gaXMgZXhlY3V0ZWQgYmVmb3JlDQo+ID4gYnJpZGdlX2VuYWJsZSBhbmQg
aGVuY2UgZG9lcyBub3QgaGF2ZSB0aGUgZnVsbCBsaW5rIG9yIHRoZSBzaW5rDQo+ID4gY2FwYWJp
bGl0aWVzIGluZm9ybWF0aW9uIGxpa2UgZXh0ZXJuYWwgRFAgY29ubmVjdGlvbiwgYnkgdGhlbi4N
Cj4gDQo+IEl0IHNvdW5kcyB0byBtZSBsaWtlIHdlIHNob3VsZCBlbXVsYXRlIHRoZSBIUEQgZXZl
bnQgZm9yIGVEUCB0byBiZSBoYW5kbGVkDQo+IGVhcmxpZXIgdGhhbiB0aGUgZ2V0X21vZGVzKCkv
cHJlcGFyZSgpIGNhbGxzIGFyZSBhdHRlbXB0ZWQuDQo+IEhvd2V2ZXIgdGhpcyBtaWdodCBvcGVu
IGFub3RoZXIgY2FuIG9mIHdvcm1zLg0KPiANCg0KRm9yIERQLCB0aGUgSFBEIGhhbmRsZXIgbWFp
bmx5IGluaXRpYXRlcyBsaW5rIHRyYWluaW5nIGFuZCBnZXRzIHRoZSBFRElELg0KDQpCZWZvcmUg
YWRkaW5nIHN1cHBvcnQgZm9yIGEgc2VwYXJhdGUgZURQIHBhbmVsLCB3ZSBoYWQgZGlzY3Vzc2Vk
IGFib3V0DQp0aGlzIGludGVybmFsbHkgYW5kIGRlY2lkZWQgdG8gZW11bGF0ZSBlRFAgSFBEIGR1
cmluZyBlbmFibGUoKS4gTWFpbiByZWFzb24NCmJlaW5nLCBlRFAgcG93ZXIgaXMgZ3VhcmFudGVl
ZCB0byBiZSBvbiBvbmx5IGFmdGVyIGJyaWRnZV9lbmFibGUoKS4NClNvLCBlRFAgbGluayB0cmFp
bmluZyBjYW4gaGFwcGVuIGFuZCBzdXN0YWluIG9ubHkgYWZ0ZXIgYnJpZGdlX2VuYWJsZSgpLg0K
DQpFbXVsYXRpbmcgSFBEIGJlZm9yZS9kdXJpbmcgZ2V0X21vZGVzIHdpbGwgbm90IGhhdmUgYW55
IGVmZmVjdCBiZWNhdXNlOg0KDQoxLiBnZXRfbW9kZXMoKSB3aWxsIGdvIHRvIHBhbmVsJ3MgZ2V0
X21vZGVzKCkgZnVuY3Rpb24gdG8gcG93ZXIgb24gcmVhZCBFRElEDQoNCjIuIHBhbmVsIHBvd2Vy
IHdpbGwgYmUgdHVybmVkIG9mZiBhZnRlciBnZXRfbW9kZXMoKS4gUGFuZWwgcG93ZXIgb2ZmIHdp
bGwNCnJlc2V0IGV2ZXJ5IHdyaXRlIHRyYW5zYWN0aW9uIGluIERQQ0QuIGFueXdheSBpbnZhbGlk
YXRpbmcgbGluayB0cmFpbmluZw0KDQozLiBtb2RlX3ZhbGlkIHdpbGwgbGFuZCBpbiBkcCBkcml2
ZXIgYnV0IHBhbmVsIHdpbGwgbm90IGJlIHBvd2VyZWQgb24gYXQgdGhhdA0KdGltZSBhbmQgd2Ug
Y2Fubm90IGRvIGF1eCB0cmFuc2ZlcnMgb3IgRFBDRCByZWFkIHdyaXRlcy4NCg0KPiA+IFNvLCB3
ZSBuZWVkIHRvIHByb2NlZWQgd2l0aCB0aGUgcmVwb3J0ZWQgbW9kZSBmb3IgZURQLg0KPiANCj4g
V2VsbC4uLiBFdmVuIGlmIGR1cmluZyB0aGUgZmlyc3QgY2FsbCB0byBnZXRfbW9kZXMoKSB0aGUg
RFBDRCBpcyBub3QgcmVhZCwNCj4gZHVyaW5nIHN1YnNlcXVlbnQgY2FsbHMgdGhlIGRyaXZlciBo
YXMgbmVjZXNzYXJ5IGluZm9ybWF0aW9uLCBzbyBpdCBjYW4NCj4gcHJvY2VlZCB3aXRoIGFsbCB0
aGUgY2hlY2tzLCBjYW4ndCBpdD8NCj4gDQoNCmdldF9tb2RlcygpIGN1cnJlbnRseSBkb2VzIG5v
dCBsYW5kIGluIERQIGRyaXZlci4gSXQgZ2V0cyBleGVjdXRlZCBpbiBwYW5lbA0KYnJpZGdlLiBC
dXQgdGhlIG1vZGVfdmFsaWQoKSBjb21lcyB0byBEUCBkcml2ZXIgdG8gY2hlY2sgdGhlIGNvbnRy
b2xsZXINCmNvbXBhdGliaWxpdHkuDQoNCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0
cnkNCg0KVGhhbmsgeW91LA0KU2Fua2VlcnRoDQo=
