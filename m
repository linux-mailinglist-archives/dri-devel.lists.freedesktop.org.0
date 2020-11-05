Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470822A81F5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 16:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825E56E131;
	Thu,  5 Nov 2020 15:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4543A6E131
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 15:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxaxTW01kt2q798Y2IexcTRghHtK8QAX43hQFZdMU8yhGzYNyOijDrmOtWFYaDsvD3/9W0MfUu2SbcTjfB9ct1O9KFfpfEkO8TQjspPrSk2ywDdCBnOJTMioy+lyR32B1nFawHSm1jnXR3LDnH0CADaB4qIGuvkXJXrnsQqJLi6k1rSIqWj9j8mRydycRjvriQM8ZnkmKh3uQsQ/i1UU4SGi6K/Vz7HzvsM/zRD92D0f+W2BEHc6Y8z6hdBU/bGeZI5DfYM0U5nQSkGYEYGgydnN9RrsRY+hkXxl9lfffP8PFNN0/uunc6PPIA9JOjzV/8s2urcNcQkGRkoDyBHu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0quEQMsmiSQUw1HFS6W7YZ4HWMS18QQ+OnQqYexWfo=;
 b=jqtZ1Y79W/PZX4f6jRPWaDtC6ggWpq9c0by+aOac1ukUPBqhgit86bguoJPMj8VV9rYf18gAEEcinjDA3tu8VtQBR/8BlcMZez+BsB+wREE+A720fIPGIjhNU2XIqi/jjOuTnLuE5qi3EEfg8l/x02HZ5Blb15d60pnkInpJidMtYMIhXbHVOP3UyP3R4T1RNvCrIDKCtcJFP12Cf8fnhF2urBgkBd95G9E/JXLPUO7W+tFxu8ays2o4uLoDC3I6eJTlRp42IPB7D4nxnr2MdKSROG/Sm9asLdrSYhqaUOND1Pe9u7NfKSDoTZr86NIssrwYylyZfrBZ4gLR//7Ixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0quEQMsmiSQUw1HFS6W7YZ4HWMS18QQ+OnQqYexWfo=;
 b=D/PXil1fv4zZHOwwqlTjtf/oprB7dtrkKu26pCBL5a1+9rsf9RkTgunT5b+w51jm7mjzkicG5k39Qqqb0qJW8lCoIrJGiW5m7c69ReBGKnkwml1LbI++UA8rxuq98nOqfcad5i8zFZtGzMrQVrthbIQphXMCqMJHdAYTT68sMFg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 5 Nov
 2020 15:15:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 15:15:42 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
 <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
 <20201105125009.GV401619@phenom.ffwll.local>
 <614b3893-b735-7ba4-4f0a-55891adbdc8d@amd.com>
 <20201105132016.GY401619@phenom.ffwll.local>
 <d15fa2da-fdc7-f7c8-195c-53f9ca505d80@amd.com>
 <CAKMK7uFUUP5Kj4jBh66yHyMMdo_pm=EqybxyhyDkkCROPhD68Q@mail.gmail.com>
 <CAKMK7uHt8Wxxn0LGKQbTOG0q-uTyJ0ob3BSrWoMkm0UA7zsNFg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c04b4710-7b37-bfd4-0bad-859592e9ba33@amd.com>
Date: Thu, 5 Nov 2020 16:15:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHt8Wxxn0LGKQbTOG0q-uTyJ0ob3BSrWoMkm0UA7zsNFg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:205::32)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:205::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 15:15:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 694d1d60-2a22-489d-5c23-08d8819da8e6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40002EB94181A7A291815F6F83EE0@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YoSb3yx/b5k9vA11HLyWszEx1UJOgkIJFJHKSQUP/gur3TuNcs41XHYBBeY0Asmul2pesqAUwDqJ0WRP6eV+BK+eXnKxMXrBjckgok43QvT+vHWsEWlrtcUnq0iPXTxQahfvqZfVUWOVNWNbEuLARa0yRDkU8G70bo1AQ4RPcVnSAZ1bUqCum6XH4W9s+S6DfZyUqDPNq2u0Cd6z7aY7sBjPc4boMvDYK+i2r2K2IkOo2T7J93dQwczCC4QaV7A3JTkhHv/qIaO24dhOBaxFLBRndNkfbrpO7zaVj+Gqi7yH1ud1hJbtNl46kc83u25Gshn1DOLYVlbzAYdpRZOW/6fQ8yP/NrNvZQMkSBBIwN1cIBsnbf3WAOes9s+gCbFph20yQmFqMiUwsL7NtmERxS5o22cQu6vqZdS/gJpsT6Q/wd+xXlmQ8qz7VnR1KX8fE84I+BReBxcIFpgpE7tXgHCYGVVsb6SueM1ltZbixmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(45080400002)(16526019)(66946007)(66556008)(966005)(31696002)(6666004)(66476007)(6486002)(83380400001)(186003)(8676002)(8936002)(6916009)(2906002)(478600001)(83080400002)(66574015)(52116002)(2616005)(36756003)(54906003)(316002)(53546011)(86362001)(31686004)(4326008)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZcHhtf2PvY8NNrYTyxv75UryxaoBzwZsFgiKGQTbnqz9/bnaCk1HFbqhCYvR198WtrvE47LdAUKKQ7Qsd9VX6Uo6AFMLhNpLcSONN0fYcJJiBYiKKgrtTibWbiJWeGYfm4KcbTi2HZePCA6TkxvlBMbf4V9kfyNGscv0Ljdim1nBtE+P3K4Q+q2dXNoNaJ2KCg9hrEnJsRYoMJ+hLXgb0AS03IKNqX83ymyQHpn1rhJiH7TmwUcvA263fleKgZZnkpGs43Lp3DnInd1zmAX4VyQ7s3/nxXVIGEF0BqKEymN+n5rKYWuevXFtJQF+Dc/JRScZV2Emtp1LB88CQS92gbPPdSwMaaLsHwhCXPSUeBjMUYm94N9DxlYHhpDpCUsgJDSRiCIiRArdiPtrPaNV5gMABwFtwBSJ6hxbvOcHu/Hy/RkZTxjlvQrKzMih0I/K0Ag+27nMIwrUgcneAdkU4S+8QPS1x1shn5O+6ZRlnt7JSXnnYqefmJFBMMT13UvSxaaW2IOvqXOTgD2qyPXnIFj0Zqylkg9I+LldMfYM/OGpZawddx3tEZTw8tC3ZBnlNAkzhCmxKzjiAba8X4lYouvFl2nIMxZxFoDyW1CYnJA9DdQcl71G49y98SnR1m/eev8Gp9nFixvPBmZMI583KwJjA2nw9k5hcGMI8DIm97HVxKThPQLwOfrWCEFFKE2u2Po5MI1vExTwKJ9RHtLJ+g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694d1d60-2a22-489d-5c23-08d8819da8e6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 15:15:41.8841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3ZlSc41eK2oKUqdB4bhhKYfyKOmp+4DPgGgUw6JuUUbi37IiIGYcDzsJEDbhZdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMTEuMjAgdW0gMTU6Mzggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgTm92
IDUsIDIwMjAgYXQgMzozMSBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3Rl
Ogo+PiBPbiBUaHUsIE5vdiA1LCAyMDIwIGF0IDI6MjIgUE0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+IEFtIDA1LjExLjIwIHVtIDE0OjIwIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+PiBPbiBUaHUsIE5vdiAwNSwgMjAyMCBhdCAwMTo1Njoy
MlBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAwNS4xMS4yMCB1bSAx
Mzo1MCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4+PiBPbiBUaHUsIE5vdiAwNSwgMjAyMCBh
dCAwMToyOTo1MFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+IEFtIDA1
LjExLjIwIHVtIDEwOjExIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+Pj4gT24gVGh1LCBO
b3YgNSwgMjAyMCBhdCA5OjAwIEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4+PiBBbSAwNC4xMS4yMCB1bSAxNzo1MCBzY2hyaWViIERh
bmllbCBWZXR0ZXI6Cj4+Pj4+Pj4+Pj4gUmFuZG9tIG9ic2VydmF0aW9uIHdoaWxlIHRyeWluZyB0
byByZXZpZXcgQ2hyaXN0aWFuJ3MgcGF0Y2ggc2VyaWVzIHRvCj4+Pj4+Pj4+Pj4gc3RvcCBsb29r
aW5nIGF0IHN0cnVjdCBwYWdlIGZvciBkbWEtYnVmIGltcG9ydHMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBUaGlzIHdhcyBvcmlnaW5hbGx5IGFkZGVkIGluCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBj
b21taXQgNThhYTY2MjJkMzJhZjdkMmMwOGQ0NTA4NWY0NGM1NDU1NGExNmVkNwo+Pj4+Pj4+Pj4+
IEF1dGhvcjogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4+Pj4+
Pj4+IERhdGU6ICAgRnJpIEphbiAzIDExOjQ3OjIzIDIwMTQgKzAxMDAKPj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+ICAgICAgICAgIGRybS90dG06IENvcnJlY3RseSBzZXQgcGFnZSBtYXBwaW5nIGFuZCAt
aW5kZXggbWVtYmVycwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gICAgICAgICAgTmVlZGVkIGZvciBz
b21lIHZtIG9wZXJhdGlvbnM7IG1vc3Qgbm90YWJseSB1bm1hcF9tYXBwaW5nX3JhbmdlKCkgd2l0
aAo+Pj4+Pj4+Pj4+ICAgICAgICAgIGV2ZW5fY293cyA9IDAuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiAgICAgICAgICBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZt
d2FyZS5jb20+Cj4+Pj4+Pj4+Pj4gICAgICAgICAgUmV2aWV3ZWQtYnk6IEJyaWFuIFBhdWwgPGJy
aWFucEB2bXdhcmUuY29tPgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gYnV0IHdlIGRvIG5vdCBoYXZl
IGEgc2luZ2xlIGNhbGxlciBvZiB1bm1hcF9tYXBwaW5nX3JhbmdlIHdpdGgKPj4+Pj4+Pj4+PiBl
dmVuX2Nvd3MgPT0gMC4gQW5kIGFsbCB0aGUgZ2VtIGRyaXZlcnMgZG9uJ3QgZG8gdGhpcywgc28g
YW5vdGhlcgo+Pj4+Pj4+Pj4+IHNtYWxsIHRoaW5nIHdlIGNvdWxkIHN0YW5kYXJkaXplIGJldHdl
ZW4gZHJtIGFuZCB0dG0gZHJpdmVycy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFBsdXMgSSBkb24n
dCByZWFsbHkgc2VlIGEgbmVlZCBmb3IgdW5hbXBfbWFwcGluZ19yYW5nZSB3aGVyZSB3ZSBkb24n
dAo+Pj4+Pj4+Pj4+IHdhbnQgdG8gaW5kaXNjcmltaW5hdGVseSBzaG9vdCBkb3duIGFsbCBwdGVz
Lgo+Pj4+Pj4+Pj4gTkFLLCB3ZSB1c2UgdGhpcyB0byBkZXRlcm1pbmUgaWYgYSBwYWdlcyBiZWxv
bmdzIHRvIHRoZSBkcml2ZXIgb3Igbm90IGluCj4+Pj4+Pj4+PiBhbWRncHUgZm9yIGV4YW1wbGUu
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gTW9zdGx5IHVzZWQgZm9yIGRlYnVnZ2luZywgYnV0IEkgd291
bGQgcmVhbGx5IGxpa2UgdG8ga2VlcCB0aGF0Lgo+Pj4+Pj4+PiBDYW4geW91IHBscyBwb2ludCBt
ZSBhdCB0aGF0IGNvZGU/IEEgcXVpY2sgZ3JlcCBoYXNuJ3QgcmVhbGx5IGZvdW5kIG11Y2ggYXQg
YWxsLgo+Pj4+Pj4+IFNlZSBhbWRncHVfaW9tZW1fcmVhZCgpIGZvciBhbiBleGFtcGxlOgo+Pj4+
Pj4gV2h5IGRvIHlvdSByZWplY3QgdGhpcz8KPj4+Pj4gV2hlbiBJT01NVSBpcyBkaXNhYmxlZCBv
ciB1c2VzIGFuIDEgdG8gMSBtYXBwaW5nIHdlIHdvdWxkIG90aGVyd2lzZSBnaXZlIHRoZQo+Pj4+
PiBzYW1lIGFjY2VzcyBhcyAvZGV2L21lbSB0byBzeXN0ZW0gbWVtb3J5IGFuZCB0aGF0IGlzIGZv
cmJpZGRlbi4gQnV0IGFzIEkKPj4+Pj4gbm90ZWQgdGhpcyBpcyBqdXN0IGZvciB0aGUgZGVidWdm
cyBmaWxlLgo+Pj4+IEFoLCB0aGVyZSdzIGEgY29uZmlnIG9wdGlvbiBmb3IgdGhhdC4gUGx1cyBp
dCdzIGRlYnVnZnMsIGFueXRoaW5nIGdvZXMgaW4KPj4+PiBkZWJ1Z2ZzLCBidXQgaWYgeW91J3Jl
IHdvcnJpZWQgYWJvdXQgdGhhdCBob2xlIHdlIHNob3VsZCBqdXN0IGRpc2FibGUgdGhlCj4+Pj4g
ZW50aXJlIGRlYnVnZnMgZmlsZSBmb3IgQ09ORklHX1NUUklDVF9ERVZNRU0uIEkgY2FuIHBlcmhh
cHMgdGhyb3cgdGhhdCBvbgo+Pj4+IHRvcCwgdGhhdCBmb2xsb3dfcGZuIHBhdGNoIHNlcmllcyBJ
J20gYmFraW5nIGlzIGFsbCBhYm91dCB0aGlzIGtpbmQgb2YKPj4+PiBmdW4uCj4+PiBBbmQgZXhh
Y3RseSB0aGF0IHdvdWxkIGdldCBhIE5BSyBmcm9tIHVzLgo+Pj4KPj4+IFdlIGhhdmUgc3BlY2lh
bGx5IGNyZWF0ZWQgdGhhdCBkZWJ1Z2ZzIGZpbGUgYXMgYW4gYWx0ZXJuYXRpdmUgd2hlbgo+Pj4g
Q09ORklHX1NUUklDVF9ERVZNRU0gaXMgc2V0Lgo+PiBVaCB0aGF0IGRvZXNuJ3Qgd29yayBpZiB5
b3Ugd29yayBhcm91bmQgY29yZSByZXN0cmljdGlvbnMgd2l0aCB5b3VyCj4+IG93biBkZWJ1Z2Zz
IHBhdGhzLgoKVGhhdCdzIHdoeSB3ZSBoYXZlIHRoZSByZXN0cmljdGlvbiB0byBjaGVjayB0aGUg
bWFwcGluZyBvZiB0aGUgcGFnZXMuCgpUaGlzIHdheSB3ZSBvbmx5IGV4cG9zZSB0aGUgbWVtb3J5
IHdoaWNoIHdhcyBhbGxvY2F0ZWQgYnkgb3VyIGRyaXZlciBhbmQgCmRvbid0IGFsbG93IGFueSB1
bmNvbnRyb2xsZWQgYWNjZXNzIHRvIHRoZSB3aG9sZSBzeXN0ZW0gbWVtb3J5LgoKV2UgaGF2ZSBz
b21ldGhpbmcgc2ltaWxhciBmb3IgcmFkZW9uIGFzIHdlbGwsIGJ1dCB0aGVyZSB3ZSBoYXZlIGEg
Z2xvYmFsIApHQVJUIHRhYmxlIHdoaWNoIHdlIGNhbiB1c2UgZm9yIHZhbGlkYXRpbmcgc3R1ZmYu
Cgo+PiAgIE1heWJlIHlvdSBjYW4gZG8gZnVuIGxpa2UgdGhpcyBpbiB5b3VyIGRrbXMsIGJ1dAo+
PiBub3QgaW4gdXBzdHJlYW0uIExpa2UgaWYgdGhpcyB3YXMgc3BlY2lmaWNhbGx5IGNyZWF0ZWQg
dG8gd29yayBhcm91bmQKPj4gQ09ORklHX1NUUklDVF9ERVZNRU0gKGFuZCBpdCBzb3VuZHMgbGlr
ZSB0aGF0KSB0aGVuIEkgdGhpbmsgdGhpcwo+PiBzaG91bGQgbmV2ZXIgaGF2ZSBsYW5kZWQgaW4g
dXBzdHJlYW0gdG8gYmVnaW4gd2l0aC4KPiBJJ20gYWxzbyBraW5kYSBjb25mdXNlZCB0aGF0IHRo
ZXJlJ3MgZGlzdHJvcyB3aXRoIENPTkZJR19TVFJJQ1RfREVWTUVNCj4gd2hpY2ggYWxsb3cgZGVi
dWdmcy4gZGVidWdmcyBpcyBhIHByZXR0eSBiYWQgcm9vdCBob2xlIGFsbCBhcm91bmQsIG9yCj4g
YXQgbGVhc3QgdGhhdCdzIGJlZW4gdGhlIGFzc3VtcHRpb24gYWxsIHRoZSB0aW1lLgoKWWVhaCwg
Y29tcGxldGVseSBhZ3JlZSA6KSBCdXQgdGhhdCdzIG5vdCBteSBwcm9ibGVtLgoKQ2hyaXN0aWFu
LgoKPiAtRGFuaWVsCj4KPj4+Pj4gV2hlbiBJIHRyaWVkIGEgZmV3IHllYXJzIGFnbyB0byBub3Qg
c2V0IHRoZSBwYWdlLT5tYXBwaW5nIEkgaW1tZWRpYXRlbHkgcmFuCj4+Pj4+IGludG8gaXNzdWVz
IHdpdGggb3VyIGV2aWN0aW9uIHRlc3QuIFNvIEkgdGhpbmsgdGhhdCB0aGlzIGlzIHVzZWQgZWxz
ZXdoZXJlCj4+Pj4+IGFzIHdlbGwuCj4+Pj4gVGhhdCdzIHRoZSBraW5kIG9mIGludGVyYWN0aW9u
IEknbSB3b3JyaWVkIGFib3V0IGhlcmUgdGJoLiBJZiB0aGlzIGRvZXMKPj4+PiBzb21lIGtpbmQg
b2Ygc2hyaW5raW5nIG9mIHNvbWUgc29ydHMsIEkgdGhpbmsgYSByZWFsIHNocmlua2VyIHNob3Vs
ZCB0YWtlCj4+Pj4gb3Zlci4KPj4+Pgo+Pj4+IEFuIGltcHJvdmVkIGdyZXAgc2hvd3Mgbm90aGlu
ZyBlbHNlLCBzbyB0aGUgb25seSB0aGUgYWJvdmUgaXMgdGhlIG9ubHkKPj4+PiB0aGluZyBJIGNh
biB0aGluayBvZi4gV2hhdCBraW5kIG9mIGV2aWN0aW9uIHRlc3QgZ29lcyBib29tIGlmIHlvdSBj
bGVhcgo+Pj4+IC0+bWFwcGluZyBoZXJlPyBJJ2QgYmUgaGFwcHkgdG8gdHlwZSB1cCB0aGUgY2xl
dmVyIHRyaWNrIGZvciB0aGUgZGVidWdmcwo+Pj4+IGZpbGVzLgo+Pj4+IC1EYW5pZWwKPj4+Pgo+
Pj4+PiBSZWdhcmRzLAo+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+PiBJZiB0aGlzIGlzIHRv
IGF2b2lkIGlzc3VlcyB3aXRoIHVzZXJwdHIsIHRoZW4gSSB0aGluayB0aGVyZSdzIGEgc2ltcGxl
Cj4+Pj4+PiB0cmljazoKPj4+Pj4+IC0gZ3JhYiBwYWdlIHJlZmVyZW5jZQo+Pj4+Pj4gLSByZWNo
ZWNrIHRoYXQgdGhlIGlvdmEgc3RpbGwgcG9pbnRzIGF0IHRoZSBzYW1lIGFkZHJlc3MKPj4+Pj4+
IC0gZG8gcmVhZC93cml0ZSwgc2FmZSBpbiB0aGUga25vd2xlZGdlIHRoYXQgdGhpcyBwYWdlIGNh
bm5vdCBiZSByZXVzZWQgZm9yCj4+Pj4+PiAgICAgIGFueXRoaW5nIGVsc2UKPj4+Pj4+IC0gZHJv
cCBwYWdlIHJlZmVyZW5jZQo+Pj4+Pj4KPj4+Pj4+IE9mIGNvdXJzZSB0aGlzIGNhbiBzdGlsbCBy
YWNlIGFnYWluc3QgaW92YSB1cGRhdGVzLCBidXQgdGhhdCBzZWVtcyB0byBiZSBhCj4+Pj4+PiBm
dW5kYW1lbnRhbCBwYXJ0IG9mIHlvdXIgZGVidWcgaW50ZXJmYWNlIGhlcmUuCj4+Pj4+Pgo+Pj4+
Pj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPj4+Pj4+Cj4+Pj4+PiBKdXN0IHBvbmRlcmlu
ZyB0aGlzIG1vcmUgc2luY2Ugc2V0dGluZyB0aGUgcGFnZS0+bWFwcGluZyBwb2ludGVyIGZvciBq
dXN0Cj4+Pj4+PiB0aGlzIHNlZW1zIHNvbWV3aGF0IHdpbGQgYWJ1c2Ugb2YgLT5tYXBwaW5nIHNl
bWFudGljcyA6LSkKPj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICBpZiAocC0+bWFwcGluZyAhPSBhZGV2LT5tbWFuLmJkZXYuZGV2X21hcHBpbmcpCj4+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVBFUk07Cj4+Pj4+Pj4gQ2hy
aXN0aWFuLgo+Pj4+Pj4+Cj4+Pj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Pj4KPj4+Pj4+Pj4+IENocmlz
dGlhbi4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ry
b21Adm13YXJlLmNvbT4KPj4+Pj4+Pj4+PiBDYzogQnJpYW4gUGF1bCA8YnJpYW5wQHZtd2FyZS5j
b20+Cj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4+Pj4+Pj4+Pj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPj4+Pj4+Pj4+PiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4KPj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+PiAgICAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV90dC5jIHwgMTIgLS0tLS0tLS0tLS0tCj4+Pj4+Pj4+Pj4gICAgICAgMSBmaWxlIGNoYW5nZWQs
IDEyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+
Pj4+Pj4+Pj4gaW5kZXggODg2MWE3NGFjMzM1Li40MzhlYTQzZmQ4YzEgMTAwNjQ0Cj4+Pj4+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+Pj4+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+Pj4+Pj4+PiBAQCAtMjkxLDE3ICsyOTEsNiBA
QCBpbnQgdHRtX3R0X3N3YXBvdXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0
dG1fdHQgKnR0bSkKPj4+Pj4+Pj4+PiAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+Pj4+PiAg
ICAgICB9Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiAtc3RhdGljIHZvaWQgdHRtX3R0X2FkZF9tYXBw
aW5nKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4+Pj4+
Pj4+Pj4gLXsKPj4+Pj4+Pj4+PiAtICAgICBwZ29mZl90IGk7Cj4+Pj4+Pj4+Pj4gLQo+Pj4+Pj4+
Pj4+IC0gICAgIGlmICh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKQo+Pj4+Pj4+
Pj4+IC0gICAgICAgICAgICAgcmV0dXJuOwo+Pj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4+PiAtICAgICBm
b3IgKGkgPSAwOyBpIDwgdHRtLT5udW1fcGFnZXM7ICsraSkKPj4+Pj4+Pj4+PiAtICAgICAgICAg
ICAgIHR0bS0+cGFnZXNbaV0tPm1hcHBpbmcgPSBiZGV2LT5kZXZfbWFwcGluZzsKPj4+Pj4+Pj4+
PiAtfQo+Pj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4+PiAgICAgICBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQo+Pj4+
Pj4+Pj4+ICAgICAgIHsKPj4+Pj4+Pj4+PiBAQCAtMzIwLDcgKzMwOSw2IEBAIGludCB0dG1fdHRf
cG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+Pj4+Pj4+Pj4gICAgICAgICAg
IGlmIChyZXQpCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+IC0gICAgIHR0bV90dF9hZGRfbWFwcGluZyhiZGV2LCB0dG0pOwo+Pj4+
Pj4+Pj4+ICAgICAgICAgICB0dG0tPnBhZ2VfZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19QUklWX1BP
UFVMQVRFRDsKPj4+Pj4+Pj4+PiAgICAgICAgICAgaWYgKHVubGlrZWx5KHR0bS0+cGFnZV9mbGFn
cyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpIHsKPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICByZXQgPSB0dG1fdHRfc3dhcGluKHR0bSk7Cj4+Cj4+IC0tCj4+IERhbmllbCBWZXR0ZXIKPj4g
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+IGh0dHBzOi8vbmFtMTEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGYmxvZy5mZnds
bC5jaCUyRiZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M2
MTllNmE2MTEzNjc0NjkxZWI5NzA4ZDg4MTk4NzRmNCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MDE4MzkwODI2OTQ0NTAlN0NVbmtub3duJTdDVFdGcGJH
WnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3
aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9VW83VVhTN3klMkJVJTJGSGZuQmVueDJ2
UVh1eXlCJTJGQ3VPVUxMT3AxdUwwZWc0SSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
