Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32C2A3DE3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 08:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780646E830;
	Tue,  3 Nov 2020 07:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318F66E822;
 Tue,  3 Nov 2020 07:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVLAC76hk2KWkUbICSz7bdmPZTR4iIB9x/pWDGdBgnqXch20zKnO3eGOc0IdihpzSA4SRgwRXH3HwtfTDnwDmEF/yiH87r/vvhb8Xy/sqYAoLyF8lVbaTe5Ea6VGSVE/iXWKjFu8NqnGF491hhWkuvwIkeiMhPDsV4HAdGthf/Ppn/XuiY1ZT6C01gAPH40ld2ajkoNGuqnoS7IkHxxNBC1ubYaMyIYwRmUB439/y8sfeZeJLcgRPKyRVqAhiGkyaKLt/i7kuEjPZ72UgvN/Jy6rL/a1g3BG0JW14UoTa37W60oF16M1ksaDK3i6PkfCynGISRC17Q8qDZsJojRxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f12sEpSidlUg9HzeJdfroP+MUHI8acc2j6Ia86fkc90=;
 b=A8DGK/LSI2zuyNm22mO0Ho0e9v74tWJNmeW+eAqetdoOziisOBULF2Vw9J3KKT9A/RlffVDo07JIWanx0DPix4cz4L+0VQOSjCauy6S78Gt4nYxqXkB3Um1SNUaHANKJ8Mxh0fnSHwb7Xy9rT068DABMbWUjUo8wxOrtV2d3o+fXaiP6Sktw6AEznjnoWxKVZXJ4ovmPXgsU3pDcwG5PoEX+QBKBWFd4mB0GrliRI5iqBR8V9aFugbGC4MAB9FvvsobSOcSVrnAuYnbztC9TV8jfvuDn4GD1ygBnRKCc8f2Jo5sGbi2SdPt6z9a5hL5EC9T7nsgqKcJly0E4AijAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f12sEpSidlUg9HzeJdfroP+MUHI8acc2j6Ia86fkc90=;
 b=Iry40tOx01xt/18D4QahO2qGQCfJrvxFC4SRzKQ+0Sx9Vl58okmwgdQJmpBuF5Es+Jz4f0qTz9uel6/W0xY4Nt7O02Lu7y/2liMTlxeDxAoMSvM+0sA5w7HvrIh+Enh+hUuXUXtSRQmlJb5k04DlnK+ZCV1h8tLGuMcx+sTyirg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 07:42:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 07:42:59 +0000
Subject: Re: [PATCH] drm/amdgpu: do not initialise global variables to 0 or
 NULL
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201102184147.GA42288@localhost>
 <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
 <c916ae88-5933-ab06-ad32-d87f00cac21f@gmail.com>
 <20201103065324.GD75930@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c6292ea5-4559-f8e5-d10a-9acb884b2ce8@amd.com>
Date: Mon, 2 Nov 2020 21:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201103065324.GD75930@kroah.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:208:122::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:208:122::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 07:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2339e187-b06f-46ab-6b6e-08d87fcc1617
X-MS-TrafficTypeDiagnostic: MN2PR12MB4304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4304D956036BDC5FDF03C85F83110@MN2PR12MB4304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKL83+fGm6NmWfDU+QvnmIxMYWkMPDeToW7QNU277ebBigbWVbHBBTeAjbQYvCfOZLlh52pqM6cQ1cWSW3b0jkvE0fNKk8GBbpTyVFj9lpCUq7QlWRk7Y9UajhYY/qRaK+TxTjoEgWglZhsYmrWC8F5bRieKUmsnpKytBdSSpL/OtQuYOIiEwJNoQbCOCFsvQN6rfP2KAXKAAuSHZOZqxm2ZzMDA5mIlW+YSoICH1mYUSNP1Gb46xpyMDLyAD+3ul0qfZ/nQDsmxq6M9hDxLU0/omxoymuEvLOQ+lrGjEHlZuouNselIIMNyLeszDRbGtXO1hul3wB+X2IsctZpZI2aZR1Jg6ug18yk2d6z5qXdwNT/qmUfsw8rtCTZe0FMr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(8676002)(316002)(66476007)(52116002)(66946007)(66556008)(2906002)(31686004)(66574015)(53546011)(8936002)(5660300002)(4326008)(6486002)(6666004)(186003)(6916009)(16526019)(86362001)(36756003)(2616005)(478600001)(7416002)(31696002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IMhctfzGYN9rPliP7utQqZFymlJjlbu9PLP2JB9a1qm62ycwBL9TV3A3ODOwgxXcBcUcAhxQaducoy6qWIWEvWB9Ud38j/DqAwEEqODcNZc5t8fTV4q581yaNgc2OCQowenfLyZKfw/iFAIFhGBacO7eYps/HM1sOpgU5UFk687H/i3o0+Gr0QvJTYAjUydVrloec5B2QvgxZ6H9k7TCxBvZZH/57EMLvuqJvkxld738W5PGdMFCkAaZIpWDMdwFJ6dNEirz+rs03NkRyNoKPiJWHOjxgvoMfvdhFYSxdflFxfcgZDsoNGYtW/QCjM0WRrXMUg3taljxLlikPyug820rmsx56CYjuvD9Q510DJX3xPBPsWgHPpBDbg7EZGtRblc8sYI97d9cCCRa50Lz/6gOQMT/fDr+Jx1l/n5ffp/kJlzPQR6XJpeyaNYvsXkCZVp1dGPyEh+gorVpB1GheMtf5sgJGeQSjYlh5nhc/waobl5ajrz5Gz6Eq9Ye4GH2TN+ZOZJfrSPoehSD7V1FmrEycxedPXcqe2MIB/oqS+kPFHX4XwmqATeCFflAESfWzI/SC1gEME9vaOOmSRCSI0dgKAy+JiZ5SfihsQpK7nwSXj0aihQb0aUYgP1upjhBxpiYcEcrtLPUdJ35/claW1C05kclUE3ji+gpVZhMMFHzP11tQkCg87nnuaWe54wwQGWzINg6go9+7iotKgFgDQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2339e187-b06f-46ab-6b6e-08d87fcc1617
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 07:42:59.5143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olgH7Bv7J9Nt+86NZYtbvLDg7FBaCJnVAIUwdzoZbmiDzwV5r7Tk1PaEUt1B5fC9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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

QW0gMDMuMTEuMjAgdW0gMDc6NTMgc2NocmllYiBHcmVnIEtIOgo+IE9uIE1vbiwgTm92IDAyLCAy
MDIwIGF0IDA5OjA2OjIxUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDAy
LjExLjIwIHVtIDIwOjQzIHNjaHJpZWIgQWxleCBEZXVjaGVyOgo+Pj4gT24gTW9uLCBOb3YgMiwg
MjAyMCBhdCAxOjQyIFBNIERlZXBhayBSIFZhcm1hIDxtaDEyZ3gyODI1QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Pj4gSW5pdGlhbGl6aW5nIGdsb2JhbCB2YXJpYWJsZSB0byAwIG9yIE5VTEwgaXMgbm90
IG5lY2Vzc2FyeSBhbmQgc2hvdWxkCj4+Pj4gYmUgYXZvaWRlZC4gSXNzdWUgcmVwb3J0ZWQgYnkg
Y2hlY2twYXRjaCBzY3JpcHQgYXM6Cj4+Pj4gRVJST1I6IGRvIG5vdCBpbml0aWFsaXNlIGdsb2Jh
bHMgdG8gMCAob3IgTlVMTCkuCj4+PiBJIGFncmVlIHRoYXQgdGhpcyBpcyB0ZWNobmljYWxseSBj
b3JyZWN0LCBidXQgYSBsb3Qgb2YgcGVvcGxlIGRvbid0Cj4+PiBzZWVtIHRvIGtub3cgdGhhdCBz
byB3ZSBnZXQgYSBsb3Qgb2YgY29tbWVudHMgYWJvdXQgdGhpcyBjb2RlIGZvciB0aGUKPj4+IHZh
cmlhYmxlcyB0aGF0IGFyZSBub3QgZXhwbGljaXRseSBzZXQuICBTZWVtcyBsZXNzIGNvbmZ1c2lu
ZyB0bwo+Pj4gaW5pdGlhbGl6ZSB0aGVtIGV2ZW4gaWYgaXQgbm90IG5lY2Vzc2FyeS4gIEkgZG9u
J3QgaGF2ZSBhIHBhcnRpY3VsYXJseQo+Pj4gc3Ryb25nIG9waW5pb24gb24gaXQgaG93ZXZlci4K
Pj4gQWdyZWUgd2l0aCBBbGV4Lgo+Pgo+PiBFc3BlY2lhbGx5IGZvciB0aGUgbW9kdWxlIHBhcmFt
ZXRlcnMgd2Ugc2hvdWxkIGhhdmUgYSBleHBsaWNpdCBpbml0IHZhbHVlCj4+IGZvciBkb2N1bWVu
dGF0aW9uIHB1cnBvc2VzLCBldmVuIHdoZW4gaXQgaXMgMC4KPiBXaHkgaXMgdGhpcyBvbmUgdGlu
eSBkcml2ZXIgc29tZWhvdyBzcGVjaWFsIGNvbXBhcmVkIHRvIHRoZSBlbnRpcmUgcmVzdAo+IG9m
IHRoZSBrZXJuZWw/ICAoaGludCwgaXQgaXNuJ3QuLi4pCgpBbmQgaXQgY2VydGFpbmx5IHNob3Vs
ZG4ndCA6KQoKPiBQbGVhc2UgZm9sbG93IHRoZSBub3JtYWwgY29kaW5nIHN0eWxlIHJ1bGVzLCB0
aGVyZSdzIG5vIHJlYXNvbiB0byBpZ25vcmUKPiB0aGVtIHVubGVzcyB5b3UgbGlrZSB0byBjb25z
dGFudGx5IHJlamVjdCBwYXRjaGVzIGxpa2UgdGhpcyB0aGF0IGdldAo+IHNlbnQgdG8geW91LgoK
WWVhaCwgdGhhdCdzIGEgcmF0aGVyIGdvb2QgcG9pbnQuCgpOb3QgYSBwYXJ0aWN1bGFyIHN0cm9u
ZyBvcGluaW9uIG9uIHRoaXMgZWl0aGVyLCBidXQgd2hlbiBzb21ldGhpbmcgCmdsb2JhbCBpcyBz
ZXQgdG8gMCBwZW9wbGUgdXN1YWxseSBkbyB0aGlzIHRvIGVtcGhhc2VzIHRoYXQgaXQgaXMgCmlt
cG9ydGFudCB0aGF0IGl0IGlzIHplcm8uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gdGhuYWtz
LAo+Cj4gZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
