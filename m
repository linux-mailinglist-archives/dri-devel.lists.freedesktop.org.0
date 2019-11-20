Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEA510396C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1277C6E408;
	Wed, 20 Nov 2019 12:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam04on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4c::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36C06E408
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djPky+5qc8j761OgcWLCO8tlgJLeWuQZFyabkz06ety9RMHed9FR9/AARWqhmNor4SrE9fprsm1mwC1bib69TeqhLb5j5o7d7rPcpGALQyWNOOsu0X4tysAq0BdZvu/sIJ4O7/kxpXlsYt5weaf+EkEQ2LXTNnNifiISGUzWFATmafzFICD4ccfuk1bixiN2bXMIqx4oFocdXG5pEBgaZ05lmQVodvhgeAyaM0WtkTpEu8Co+7PtBwp3QrPJiNNS+l7JMB1MPPuVGMEoNmtwXZ6JhyCkzeYK7S5rhAEb0v+TZ+MoGIoPvWvaVTBlkHBdtLi5WOAL0PMI46pBvqJXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQd8vYYBzFfyTKxZR60hYWhnpOgmVZxk5T1eN62wVVM=;
 b=Sa7G4CeORbprXzuEs+2uHoBtwteMf0RVmKCkKog5lEDi42CrP/DQmjdzaQuPLXvZGQMBfSl3Y2/q+oNnSJLhL4kfMlAOHuc26y5P3qW6MblNdAPC8P2IshNfWL16AXtDF5MiThrDRUL4owNlE0Ql7z28OwFU+py55wdAGfcBIR0DJ4fEjxc0kJnCEPBZwTmfXf8y/zPPRXzVIGLaIicjaYJm3ZBXXsgomgNfmJ4aqmf8MpUWX2BKhZuNK0DKTkItr8e5qlg/2bflvsgjF+M6j0NeFD46NfATYzSLDYQ8y65xOc/i+7vPvA+x7UhDb8AegsWhd0enXXsW7MjAXZB99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1482.namprd12.prod.outlook.com (10.172.37.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Wed, 20 Nov 2019 12:02:30 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 12:02:30 +0000
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6540938e-b555-82c9-28e5-bbef3741863a@amd.com>
Date: Wed, 20 Nov 2019 13:02:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:208:122::24) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c2e16c9-d00c-497f-4f9a-08d76db184ce
X-MS-TrafficTypeDiagnostic: DM5PR12MB1482:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14825529ACE3AACC1DD52E45834F0@DM5PR12MB1482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(189003)(199004)(53754006)(5024004)(14444005)(7736002)(66946007)(6506007)(2616005)(386003)(6512007)(99286004)(66476007)(2906002)(6116002)(476003)(25786009)(305945005)(110136005)(58126008)(8936002)(50466002)(2501003)(65806001)(65956001)(31686004)(66556008)(47776003)(229853002)(5660300002)(230700001)(11346002)(446003)(6666004)(6486002)(8676002)(46003)(76176011)(23676004)(52116002)(2486003)(86362001)(36756003)(478600001)(6246003)(186003)(31696002)(486006)(81166006)(81156014)(14454004)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1482;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXQOnV/Y/2pk6vbTHdLlCvbAGqhyUNFOVqKPJ4ns+IJccQQofa5WM0o+7NU950gDpO5Upy3tHGAsHXF9SZGGfiCT8KaPd6dzPU1sBCQPCvDmrbVIIW7pU3tKuJNsA5lLWhbHhMF+fcJAXXcPlKTHCjNRrD3x8WwKxLXQ4YlKnVLsmfEjQ+JeFG5Szv7cFz35xLbmgRUyM/GnSEM0fYxcLogLdsN7R8CnL2rxYvFyE7VkSuHSILhMEbU+ImY81z/JLwteqEg3ypwyZ9/oSrDXB3mRn/qSTkDcaOfeo+APNd7SwgiYPybusGLQIZDFtIMyV+sAfijtko0FNmtbJJqzKiPc0pVqjgnzusn+Rxpz//Z2JzjGyQCRnYXj9zqO7Zx4eHTKFxDmUWb3r8+/bIddjtHtC5e1ofo0uE7Q5sxFKpNgN01jDsQRszE553872O9n
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2e16c9-d00c-497f-4f9a-08d76db184ce
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 12:02:30.2855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XK88p3g6UcfJvLxAoMWDWRM5CGxVCm7GUT9ra6cLD69HZ8VY+jVWKRRWBVCeZxYT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1482
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQd8vYYBzFfyTKxZR60hYWhnpOgmVZxk5T1eN62wVVM=;
 b=JOB42CeLfjH7kUSIVNo9Y5YPbyulh7jMCp6D2wjdmXx747Z15u+za5Pm25jL3+iHbzRJEqHRmliy1fspohgwoe+Gbt2c0/TDvlNfXveCQ4xFPbrAy+wxvMlnpbcyUvA59S9A+ICBj6MczAOAk5eiQMDVWwEL1qlUj0DteDc81Ak=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBXaGF0IGFtIEkgbWlzc2luZz8KVGhlIGFzc3VtcHRpb24gaXMgdGhhdCB3aGVuIHlvdSB3YW50
IHRvIGNyZWF0ZSBhIHZtYXAgb2YgYSBETUEtYnVmIApidWZmZXIgdGhlIGJ1ZmZlciBuZWVkcyB0
byBiZSBwaW5uZWQgc29tZWhvdy4KCkUuZy4gd2l0aG91dCBkeW5hbWljIGRtYS1idWYgaGFuZGxp
bmcgeW91IHdvdWxkIG5lZWQgdG8gaGF2ZSBhbiBhY3RpdmUgCmF0dGFjaG1lbnQuIFdpdGggZHlu
YW1pYyBoYW5kbGluZyB0aGUgcmVxdWlyZW1lbnRzIGNvdWxkIGJlIGxvd2VyZWQgdG8gCnVzaW5n
IHRoZSBwaW4oKS91bnBpbigpIGNhbGxiYWNrcy4KCllvdSBhbHNvIGNhbid0IGxvY2svdW5sb2Nr
IGluc2lkZSB5b3VyIHZtYXAgY2FsbGJhY2sgYmVjYXVzZSB5b3UgZG9uJ3QgCmhhdmUgYW55IGd1
YXJhbnRlZSB0aGF0IHRoZSBwb2ludGVyIHN0YXlzIHZhbGlkIGFzIHNvb24gYXMgeW91ciBkcm9w
IAp5b3VyIGxvY2suCgpCVFc6IFdoYXQgaXMgdm1hcCgpIHN0aWxsIHVzZWQgZm9yPwoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKQW0gMjAuMTEuMTkgdW0gMTI6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVy
Ogo+IEhpIGFsbCwKPgo+IEkndmUgYmVlbiBsb29raW5nIGF0IGRtYV9idWZfdih1biltYXAsIHdp
dGggYSBnb2FsIHRvIHN0YW5kYXJkaXplCj4gbG9ja2luZyBmb3IgYXQgbGVhc3QgZHluYW1pYyBk
bWEtYnVmIGV4cG9ydGVycy9pbXBvcnRlcnMsIG1vc3QgbGlrZWx5Cj4gYnkgcmVxdWlyaW5nIGRt
YV9yZXN2X2xvY2suIEFuZCBJIGdvdCBxdWVzdGlvbnMgYXJvdW5kIGhvdyB0aGlzIGlzCj4gc3Vw
cG9zZWQgdG8gd29yaywgc2luY2UgYSBiaWcgY2h1bmsgb2YgZHJpdmVycyBzZWVtIHRvIGVudGly
ZWx5IGxhY2sKPiBsb2NraW5nIGFyb3VuZCB0dG1fYm9fa21hcC4gVHdvIGJpZyBvbmVzOgo+Cj4g
LSB0dG1fYm9fa21hcCBsb29rcyBhdCBiby0+bWVtIHRvIGZpZ3VyZSBvdXQgd2hhdC93aGVyZSB0
byBrbWFwIHRvIGdldAo+IGF0IHRoYXQgYnVmZmVyLiBiby0+bWVtIGlzIHN1cHBvc2VkIHRvIGJl
IHByb3RlY3RlZCB3aXRoCj4gZG1hX3Jlc3ZfbG9jaywgYnV0IGF0IGxlYXN0IGFtZ3B1L25vdXZl
YXUvcmFkZW9uL3F4bCBkb24ndCBncmFiIHRoYXQKPiBpbiB0aGVpciBwcmltZSB2bWFwIGZ1bmN0
aW9uLgo+Cj4gLSBiZXR3ZWVuIHRoZSB2bWFwIGFuZCB2dW5tYXAgc29tZXRoaW5nIG5lZWRzIHRv
IG1ha2Ugc3VyZSB0aGUgYmFja2luZwo+IHN0b3JhZ2UgZG9lc24ndCBtb3ZlIGFyb3VuZC4gSSBk
aWRuJ3QgZmluZCB0aGF0IGVpdGhlciBhbnl3aGVyZSwKPiB0dG1fYm9fa21hcCBzaW1wbHkgc2Vl
bXMgdG8gc2V0IHVwIHRoZSBtYXBwaW5nLCBsZWF2aW5nIGxvY2tpbmcgYW5kCj4gcmVmY291bnRp
bmcgdG8gY2FsbGVycy4KPgo+IC0gdnJhbSBoZWxwZXJzIGhhdmUgYXQgbGVhc3QgbG9ja2luZywg
YnV0IEknbSBzdGlsbCBtaXNzaW5nIHRoZQo+IHJlZmNvdW50aW5nLiB2bXdnZnggZG9lc24ndCBi
b3RoZXIgd2l0aCB2bWFwLgo+Cj4gV2hhdCBhbSBJIG1pc3Npbmc/Cj4KPiBUaGFua3MsIERhbmll
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
