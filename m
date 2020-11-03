Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE72A3ED2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0866EB9C;
	Tue,  3 Nov 2020 08:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4989C6E86D;
 Tue,  3 Nov 2020 08:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCcYoHbcwhiKx1UuOABb14CFKahSuAV79jZVBDCweP9EVh/qnzn4AJjXgBYuUfltuggnp1H2ES4YkWGm24pwchCBqIzRBn/dWuxICICjlCMeJbM4hLF82hSG/qMRJevExZHXBrZttYtfOIc3Da6nInuBnjgUSbqfHXVOxpUtzhHvAPbLaGib/Ib+Ru13b/vZgmgCW23JEog8YGj3rhRGnLQL0btnYOvMhBWBmdgSP2/+BtbcT9JvFqjSqPRKRQolKzdV+5mGCq0zLBx9IUXcbCwja9Cgqw2msNiVNcaJunqCOEIZCw5U7b1ArYnifCnbPEXNiO/85oVhGPptliwDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38jpEJ3MQ9Etp+55oqRI+57YukolE7yGG9nzyaTSN1k=;
 b=Z1TKCsjstqNzb3tXkELnO3nAJEdlg6fEbPeEx/7tx8qlVLxBTvOtgt+Ps87GNR3SUwEt6Xn0fY/DPxSYOLe6jaBRO2jSlcEGiujmDcYhwKXSIzL/6uU4m10WYz2NQxcelOx75w+1USGJuNYXiw7VxFD2T0ap+9dyk9zJG7DKtRV0IEXvDH91JZXIekXwau8W19Ts6MleuXpLMGZtuQgTcw81s27OZfYDugkpuV2cBMEWs5tOhXLdCbhljA6w0pV0raDXcu7XageUrMT7yeUCxeYXNkRsw24VdsH+4WY6kaMJwETX18wAsrHuahGlS/dMA5U/r5ZiNnGT6KVyUJ2O+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38jpEJ3MQ9Etp+55oqRI+57YukolE7yGG9nzyaTSN1k=;
 b=iprfHkIkG2fjBrs47+9faETKTgSLtI/qE/mf21fxOO4aMRZ86xduwYePgZdeiOzIPYYB4TvOVi3TQEn2whDMlzudb95eWTiklVXOHejjgnxmtJSzjxV+xdQLpGj1P5Ep62lfTYUyF5lxB11Dx7/bM0+tN7xITa5hJlqIDICU3WA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 08:23:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 08:23:56 +0000
Subject: Re: [PATCH] drm/amdgpu: do not initialise global variables to 0 or
 NULL
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201102184147.GA42288@localhost>
 <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
 <c916ae88-5933-ab06-ad32-d87f00cac21f@gmail.com>
 <20201103065324.GD75930@kroah.com>
 <c6292ea5-4559-f8e5-d10a-9acb884b2ce8@amd.com>
 <20201103075355.GA2505796@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bc1fcda4-d229-c5a1-bea4-eda646a12bd0@amd.com>
Date: Tue, 3 Nov 2020 09:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201103075355.GA2505796@kroah.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:208:1::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:208:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.22 via Frontend Transport; Tue, 3 Nov 2020 08:23:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90716e5a-a4e6-4036-a27d-08d87fd1ce76
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4320EEC4B7072B0E08F9B20783110@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6kzwXde7EUrUwG2izgH1NQIaEA1VgFkLGGO+WZ1D/O8yBWl4nuCUo/zzRRcBaCpU3nl3Y5cK/3mRd94xn3Oite/kaLnwqUdg6Zl3DOCcaNQuPH0wYru3ek9QxECh6C7VLCZ3NcCUt2LKr31DDT0OVD9h5jIFLkAlZGphstXAPrhOUd6kjlWaxByVeLbabWWC21oY+ZtO3E+iaX0nwj1odt2YxkPdqzY0k1S96lJyQTMfcl/NDKrm5MIE5hFzAKieMuQZZ3FUrCyzePdAMOXlWn21iwFaH3qALfman35VPptNKvJqpepx+8tIfPGGBtklUyEnpuwuOlt3B0nlMyzCpqI/WAPTAjqi3SwcboajNmb78PvQoQNJdsCugARTam5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(31696002)(7416002)(31686004)(66574015)(36756003)(52116002)(6666004)(53546011)(5660300002)(66946007)(66476007)(8936002)(66556008)(6486002)(86362001)(4326008)(54906003)(6916009)(2906002)(83380400001)(16526019)(186003)(8676002)(2616005)(478600001)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: srDa97hoIFAvwW8aATCritMCgNOzVsCNy9Kjq8+uHOm9OynQbS7XEmJXDSoMxrEl29sKzyuZUYrE2uiXaYXTuEztHV28GmHZhBral5FS5PDD18tFfrpFYl2UYQPHJgIy+CFzwJU4U8VU9IpDFgKPdmbi4hH1LVX2nRQG2KTPaaDaNFtJocx7gsD+uLFG2cYkRzUcP3TPTkrHUHqzcZW2nKUPSuBxFeeXVZyLmsx4gOg1QJqI4d5r1iuelp9FN8S3OJBDK7LAcD4nftgAkbn7HQanGIYf/fhoUCImjyaWr730qbVKQqY24IV+U6SQOrk0M8sRtP+VhM54abZjpWbpOe0UiHzihvl3+hVd443MpN62GJeYwFlFkGwzRHItBjoiSPvqAGAQzxs9XmruH5Bc1G8x5QwDtpqfbGqJFJynOk159RTQTVlJaczjnUfzwPmQlAPYBNjjT1uYDLBE01j4oJXweNiyz8T/nE3HjfEhy+AAuMZbWkN6WMm6Shim/mZ5ZtBIkKbTfJ1Ry4ddJWESw4uJoSF0146kbIjdsMqUh0H5Pqxw1HDA9ywmWyCCHrVx1274cPfj8Cl7bX2G8BFIAI6qT/GpXDAb70TrCwtO3Jkl1o0ZuP4GQUWXJ043xLVEEoAxWMq8ZQXOmt5nZCUdva1y6+9TIMifxJ77b8VptYh6avUm3ZYZj3F+FXUZEIY0sVRU/2ftA3yL6T4cTgla5Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90716e5a-a4e6-4036-a27d-08d87fd1ce76
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 08:23:56.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyqFk3mRTlN2Av0kqU2l3/YiVxRwzVKG/cVF+bLK4wRSYZi/dsCSrL3yi8NnIX09
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMTEuMjAgdW0gMDg6NTMgc2NocmllYiBHcmVnIEtIOgo+IE9uIE1vbiwgTm92IDAyLCAy
MDIwIGF0IDA5OjQ4OjI1UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDAz
LjExLjIwIHVtIDA3OjUzIHNjaHJpZWIgR3JlZyBLSDoKPj4+IE9uIE1vbiwgTm92IDAyLCAyMDIw
IGF0IDA5OjA2OjIxUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gQW0gMDIu
MTEuMjAgdW0gMjA6NDMgc2NocmllYiBBbGV4IERldWNoZXI6Cj4+Pj4+IE9uIE1vbiwgTm92IDIs
IDIwMjAgYXQgMTo0MiBQTSBEZWVwYWsgUiBWYXJtYSA8bWgxMmd4MjgyNUBnbWFpbC5jb20+IHdy
b3RlOgo+Pj4+Pj4gSW5pdGlhbGl6aW5nIGdsb2JhbCB2YXJpYWJsZSB0byAwIG9yIE5VTEwgaXMg
bm90IG5lY2Vzc2FyeSBhbmQgc2hvdWxkCj4+Pj4+PiBiZSBhdm9pZGVkLiBJc3N1ZSByZXBvcnRl
ZCBieSBjaGVja3BhdGNoIHNjcmlwdCBhczoKPj4+Pj4+IEVSUk9SOiBkbyBub3QgaW5pdGlhbGlz
ZSBnbG9iYWxzIHRvIDAgKG9yIE5VTEwpLgo+Pj4+PiBJIGFncmVlIHRoYXQgdGhpcyBpcyB0ZWNo
bmljYWxseSBjb3JyZWN0LCBidXQgYSBsb3Qgb2YgcGVvcGxlIGRvbid0Cj4+Pj4+IHNlZW0gdG8g
a25vdyB0aGF0IHNvIHdlIGdldCBhIGxvdCBvZiBjb21tZW50cyBhYm91dCB0aGlzIGNvZGUgZm9y
IHRoZQo+Pj4+PiB2YXJpYWJsZXMgdGhhdCBhcmUgbm90IGV4cGxpY2l0bHkgc2V0LiAgU2VlbXMg
bGVzcyBjb25mdXNpbmcgdG8KPj4+Pj4gaW5pdGlhbGl6ZSB0aGVtIGV2ZW4gaWYgaXQgbm90IG5l
Y2Vzc2FyeS4gIEkgZG9uJ3QgaGF2ZSBhIHBhcnRpY3VsYXJseQo+Pj4+PiBzdHJvbmcgb3Bpbmlv
biBvbiBpdCBob3dldmVyLgo+Pj4+IEFncmVlIHdpdGggQWxleC4KPj4+Pgo+Pj4+IEVzcGVjaWFs
bHkgZm9yIHRoZSBtb2R1bGUgcGFyYW1ldGVycyB3ZSBzaG91bGQgaGF2ZSBhIGV4cGxpY2l0IGlu
aXQgdmFsdWUKPj4+PiBmb3IgZG9jdW1lbnRhdGlvbiBwdXJwb3NlcywgZXZlbiB3aGVuIGl0IGlz
IDAuCj4+PiBXaHkgaXMgdGhpcyBvbmUgdGlueSBkcml2ZXIgc29tZWhvdyBzcGVjaWFsIGNvbXBh
cmVkIHRvIHRoZSBlbnRpcmUgcmVzdAo+Pj4gb2YgdGhlIGtlcm5lbD8gIChoaW50LCBpdCBpc24n
dC4uLikKPj4gQW5kIGl0IGNlcnRhaW5seSBzaG91bGRuJ3QgOikKPj4KPj4+IFBsZWFzZSBmb2xs
b3cgdGhlIG5vcm1hbCBjb2Rpbmcgc3R5bGUgcnVsZXMsIHRoZXJlJ3Mgbm8gcmVhc29uIHRvIGln
bm9yZQo+Pj4gdGhlbSB1bmxlc3MgeW91IGxpa2UgdG8gY29uc3RhbnRseSByZWplY3QgcGF0Y2hl
cyBsaWtlIHRoaXMgdGhhdCBnZXQKPj4+IHNlbnQgdG8geW91Lgo+PiBZZWFoLCB0aGF0J3MgYSBy
YXRoZXIgZ29vZCBwb2ludC4KPj4KPj4gTm90IGEgcGFydGljdWxhciBzdHJvbmcgb3BpbmlvbiBv
biB0aGlzIGVpdGhlciwgYnV0IHdoZW4gc29tZXRoaW5nIGdsb2JhbCBpcwo+PiBzZXQgdG8gMCBw
ZW9wbGUgdXN1YWxseSBkbyB0aGlzIHRvIGVtcGhhc2VzIHRoYXQgaXQgaXMgaW1wb3J0YW50IHRo
YXQgaXQgaXMKPj4gemVyby4KPiBBZ2Fpbiwgbm8sIHRoYXQncyBub3Qgd2hhdCB3ZSBoYXZlIGJl
ZW4gZG9pbmcgaW4gdGhlIGtlcm5lbCBmb3IgdGhlIHBhc3QKPiAyMCsgeWVhcnMuICBJZiB5b3Ug
ZG8gbm90IHNldCBpdCB0byBhbnl0aGluZywgd2UgYWxsIGtub3cgaXQgaXMKPiBpbXBvcnRhbnQg
Zm9yIGl0IHRvIGJlIHNldCB0byAwLiAgT3RoZXJ3aXNlIHdlIHdvdWxkIGV4cGxpY2l0bHkgc2V0
IGl0Cj4gdG8gc29tZXRoaW5nIGVsc2UuICBBbmQgaWYgd2UgZG9uJ3QgY2FyZSwgdGhlbiB0aGF0
IHRvbyBkb2Vzbid0IG1hdHRlcgo+IHNvIHdlIGxldCBpdCBiZSAwIGJ5IG5vdCBpbml0aWFsaXpp
bmcgaXQsIGl0IGRvZXNuJ3QgbWF0dGVyLgo+Cj4gSSB0aGluayB0aGlzIHZlcnkgY2hhbmdlIGlz
IHdoYXQgc3RhcnRlZCB0aGUgd2hvbGUgImtlcm5lbCBqYW5pdG9yIgo+IG1vdmVtZW50IGFsbCB0
aG9zZSB5ZWFycyBhZ28sIGJlY2F1c2UgaXQgd2FzIGVhc2lseSBwcm92ZW4gdGhhdCB0aGlzCj4g
c2ltcGxlIGNoYW5nZSBzYXZlZCBib3RoIHRpbWUgYW5kIG1lbW9yeS4KCk9rLCB3ZWxsIHRoYXQg
aXMgZXZlbiBiZXR0ZXIgYmVjYXVzZSBpdCBpcyBhIHRlY2huaWNhbCBhcmd1bWVudC4KCllvdSBo
YXZlIGNvbnZpbmNlZCBtZSwgdGhlIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4K
PiBUaGlzIHNob3VsZG4ndCBldmVuIGJlIGFuIGFyZ3VtZW50IHdlIGFyZSBoYXZpbmcgYW55bW9y
ZS4uLgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
