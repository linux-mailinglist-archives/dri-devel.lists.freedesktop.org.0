Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFC22BBC9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 03:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35C6E8EB;
	Fri, 24 Jul 2020 01:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020C86E8EB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 01:58:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcPTQ3d7Jf2zkgNEKZzsRu8ozz9uo0dE4U0gZ6fTj1F59nKKT6+LxJ7qXurn9s/RKIIsRFshAU1eVKYppP6sAPbP9O6OeGiqQfj+EkkITmMWKEEE3TAYo8A5G1I48+1EzJ4SGfmD2whaChNSnol1RyuLX5wG1FMMnoi9uxNJXcmhGtHP2zbnJGOvWqN+IWK7/cTw4ioHVj0vDrEICq2EYteZg5q5Y3YuWj5le3K+cP+BM1jFs/2eYWxJ2FIa+CP8Cm5H5+EI+eP1G1GJ6U4dcfOf1TBXuxGNslFVdTMZ4T6QkglTr8jLvQxYQV00kmNlvSC9CriTug/1iyBRac6IKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjFM31rsB0ZqlNlTndoQYV15UKACnL830e8O5rdJqgU=;
 b=MpZzT9wJKoa+qOccYe4Emp4GhCVcmrviKXT/AS56f8y9JzhA7B2Pv6QmapYRRIAhv9IhlYyKrfJIELe/QQp+JxrK5wYezK2lhkDAitBSI/o4rjqnnsg6Ss3NzG4yFS3rdPZCjyxmGtOtK6UjevxHBycPr5pbD5pgV9fWFCAOubr0w/KxwTuX8MXo7GCGX5rYiEJOL1YhbjmxFm3EcbfoOz7iOZ8ULdn/DZ4NT0CtEDUyutZYZGi5eSsOEZsZfldrlCuXkatHgIFZE+XIINwtrBq+Fy6sYXvaLjwZoaJpVNK17RPwkTG7gAMsr7dq0onUzkzMOliySl5fcScn61BgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjFM31rsB0ZqlNlTndoQYV15UKACnL830e8O5rdJqgU=;
 b=iZoTp2MgPz2Ci6SYIBy2SmwgHWSttwNm3Eiit7pZfJIqpjtacpu6iuVVH0KRF0M+AGkWsNI0OAep/At26NUkmwuwHaTudTeR20ebrxAtlUUEDNG0uNbPsVxHb0rn7iOIY7vOEvepVD5+Yia8l8n3LJYbvNL+sv8iN1+JjLV0mVQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM6PR12MB3019.namprd12.prod.outlook.com (2603:10b6:5:3d::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21; Fri, 24 Jul 2020 01:58:48 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::9dc3:cdc3:f733:39cd]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::9dc3:cdc3:f733:39cd%5]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 01:58:48 +0000
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723090000.5725-1-christian.koenig@amd.com>
 <982ad05c-f2f8-0a53-9b90-119fe93a5374@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <a854df68-5487-552d-0ee0-335fbe2d6356@amd.com>
Date: Thu, 23 Jul 2020 21:58:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <982ad05c-f2f8-0a53-9b90-119fe93a5374@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Fri, 24 Jul 2020 01:58:47 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d776fe5c-b29d-4181-c833-08d82f751ad2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3019:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3019D68C4E2233FE2F46014DE6770@DM6PR12MB3019.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8hlxwcPCw7Hgkxsv8OvJxYbMxR+sr3OnorpHNWgnRWQ7H5Hz77Bb6fHSFlKKrIFzejO3BTTLRdrQjfu/EwHxNFxBlhe+FIPQHLSPHaDx1brYUiwrnxr3SN4CdwjFrCxTRd7QtbxSn8rZnjzZm5VjQzsqkWNnB/SoNC3c6/Nta6Vd/sKASEamHMCFnb2kdFi6Wj9D6W8TuH7n6U8FfpJ8IdIk+u+HM0TsLGKgsbrrjm2LIdrCN+tufHjhpt43itUEmSODmG4uM2Rgc3ppMIx6dQJMD61GBBxpiSPe8FPh9NLA7iWrp61+yj1ptF3Mc/0XhTwnkESCY/n6TXoUT6rf5MGnBLgRfSTlaHDKTfXWL5CNOKfpbqAIWkCqerAkmmf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(83380400001)(316002)(16576012)(66476007)(31686004)(52116002)(478600001)(16526019)(6486002)(66556008)(8936002)(26005)(66946007)(53546011)(2616005)(36756003)(956004)(8676002)(2906002)(110136005)(4326008)(186003)(5660300002)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: a9t26XQk1aIpQnIi4dWuUkgwdcCwXLm5iBMwGCYJPrRrzGJpiET6cXcnuXhZ2OK/ZZWn99xwCbWrXQYC4srxIhxW8U5AzXLKT87i7fuaYXSXSZDZYjGKN+EfHGLMcl8gfpr30CnNtORAGBIo7i/lqZNwvTGQ22PIC/BhOAIDS8MjmYx8tWL09y0HkMclWpj0SjbH39p4GLhxsuL8OJ9rtT4eZ2UYHWkYdmvzUchH5Wz5FPKEiWyw83tXK4VLTLPOrGZnaXoyZDWv/2h/SEVguUaQeXSZfde6rVCLFgVgvNxmbkghBa9h5Jn7QVfTvsaKFWOsYbEOiR0Jb852Zprgnbhf3Aa1cH7OVu/GGJd0CVDC8+MJcUqjmEM4keeNL7FA0deRgjLDmVmDfr4MSRjKHSYVndUpTPVqm/sw6ZjzDLck1Q4Dq1FxAAwwN+5MLzrrjHrhw1WASSSeT0cecup0GIBkEDwhL+ciVFkc5JQAItDe9ZNhmVDW7lBR6uCIUGbB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d776fe5c-b29d-4181-c833-08d82f751ad2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 01:58:48.2634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGwWL1ZSbkoDrfdRv46VDYL4Adz/WFErJ0v6EVR9SjVFz0o8ts0oRU75quL+Rr4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3019
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDctMjMgNzowMiBwLm0uLCBGZWxpeCBLdWVobGluZyB3cm90ZToKPiBBbSAyMDIw
LTA3LTIzIHVtIDU6MDAgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IFdlIGNhbid0
IHBpcGVsaW5lIHRoYXQgZHVyaW5nIGV2aWN0aW9uIGJlY2F1c2UgdGhlIG1lbW9yeSBuZWVkcwo+
PiB0byBiZSBhdmFpbGFibGUgaW1tZWRpYXRlbHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDEyICsrKysrKysrKystLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPj4gaW5kZXggYmMyMjMwZWNiN2UzLi4xMjIwNDAwNTZhMDcgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYwo+PiBAQCAtNjUxLDggKzY1MSwxNiBAQCBzdGF0aWMgaW50IHR0bV9ib19ldmljdChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIAlwbGFjZW1lbnQubnVtX2J1c3lfcGxh
Y2VtZW50ID0gMDsKPj4gICAJYmRldi0+ZHJpdmVyLT5ldmljdF9mbGFncyhibywgJnBsYWNlbWVu
dCk7Cj4+ICAgCj4+IC0JaWYgKCFwbGFjZW1lbnQubnVtX3BsYWNlbWVudCAmJiAhcGxhY2VtZW50
Lm51bV9idXN5X3BsYWNlbWVudCkKPj4gLQkJcmV0dXJuIHR0bV9ib19waXBlbGluZV9ndXR0aW5n
KGJvKTsKPj4gKwlpZiAoIXBsYWNlbWVudC5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQubnVt
X2J1c3lfcGxhY2VtZW50KSB7Cj4+ICsJCXR0bV9ib193YWl0KGJvLCBmYWxzZSwgZmFsc2UpOwo+
PiArCj4+ICsJCXR0bV90dF9kZXN0cm95KGJvLT50dG0pOwo+PiArCj4+ICsJCW1lbXNldCgmYm8t
Pm1lbSwgMCwgc2l6ZW9mKGJvLT5tZW0pKTsKPiBXaGVyZSBkb2VzIHRoZSBtZW1vcnkgaW4gdGhl
IGJvLT5tZW0gKHR0bV9tZW1fcmVnKSBnZXQgZGVzdHJveWVkPyBJdAo+IGRvZXNuJ3QgZ2V0IGF0
dGFjaGVkIHRvIGEgZ2hvc3QgQk8gaW4gdGhpcyBjYXNlLCBzbyBzb21lb25lIHdpbGwgaGF2ZSB0
bwo+IGNhbGwgdHRtX2JvX21lbV9wdXQgZXhwbGljaXRseSBiZWZvcmUgeW91IHdpcGUgb3V0IGJv
LT5tZW0uCgpBZnRlciBtaWdyYXRpbmcgdG8gcmFtLCAKc3ZtX3JhbmdlX2JvX3VucmVmLS0+YW1k
Z3B1X3VucmVmX2JvLT50dG1fYm9fcHV0LT50dG1fYm9fcmVsZWFzZSBjYWxscyAKdHRtX2JvX21l
bV9wdXQuCgp2cmFtIGlzIGFscmVhZHkgZnJlZWQgYmVmb3JlIHdlIHNpZ25hbCBmZW5jZSwgcmln
aHQ/CgpSZWdhcmRzLAoKUGhpbGlwCgo+IFJlZ2FyZHMsCj4gIMKgIEZlbGl4Cj4KPgo+PiArCQli
by0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKPj4gKwkJYm8tPnR0bSA9IE5VTEw7Cj4+
ICsJCXJldHVybiAwOwo+PiArCX0KPj4gICAKPj4gICAJZXZpY3RfbWVtID0gYm8tPm1lbTsKPj4g
ICAJZXZpY3RfbWVtLm1tX25vZGUgPSBOVUxMOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
