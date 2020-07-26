Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412C22E173
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 18:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3F489E59;
	Sun, 26 Jul 2020 16:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5366589E59
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 16:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC0y/VxWkJh56DTu4CeCDyWAxsqynZW5CbpgWvUxOUj0XHl+BQJS0wNGysLBxQVtqGA3Ex7zws5DKwBGmHPRS9hWusiq2SpacwR+ZG45VV1JTSYOb6Mz3ql9lBuIMZrAlf7CrDKGUL0GDkMmntHN9q/j3SODFoFpo6Ooxs4I23CqAXmNVC0P7OcwTBwdBpZX99vZU1KVrSaYIZf12Uwq71B+4LjJdlvtoqd0TUNZK4CuYGoLM8U5AQRFRLcJ5JR6ws+Xw/06+ACn7O9o/K6hqSDyA9gie0Z9Ew00UreN7NjsY3/w1ZQgjt0qtX1/DvYMxB9hMLAaC5aphqUR+wbgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Stm8SfGj63gZsOikw4qC2dfZ7Yuld6yzNhRA6bhxpHA=;
 b=k7ZnSs3jI0qJwrKNv2wv3XRUTc6lNwBrfPIbaOHPc8cTjo94YCc0sxyD9Uv30+fDGQ65ckarn9pAMoE8tS6I06q1jB772t84F4LT9GcJRp+4wlrN6ORx/7GL7P/+wrSfUVtFMZA7eNmJPWughRQuDkpz+VBZjo/lTAaZ6aVVkg0V4NpewOvE+5fJDF47rR3Vp44by77L1DVC/qDcBj0uymqd83YazjU5RlkYnKJ8omy+uIywNJHhM7EntaDLCm7lMfhIepHI4kIdOjMuFIlp05B0QvlhxnlWimtH1l+T2cd8JwkfCfU8Nnk1Pgfs8j4+1kO702fyPsjysFaRPAWnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Stm8SfGj63gZsOikw4qC2dfZ7Yuld6yzNhRA6bhxpHA=;
 b=CKBXNfPHZi+1hn5wTPnlYag0giEgoo532iaK+VwDxqDGFGPoYXpBUXAOfBPMMrcW68YjpN94y0Cjs2naewkXfYTu0hl+RFcxo3iqJCuUeIOAJC0X0ANp3IpeZA1FVv20fRUgJQUYE4dFCo92MAuMriZHtoVpjY6KhQPqoyeUFsc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3067.namprd12.prod.outlook.com (2603:10b6:5:115::10)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Sun, 26 Jul
 2020 16:50:58 +0000
Received: from DM6PR12MB3067.namprd12.prod.outlook.com
 ([fe80::f193:e4c7:59e:4905]) by DM6PR12MB3067.namprd12.prod.outlook.com
 ([fe80::f193:e4c7:59e:4905%5]) with mapi id 15.20.3216.031; Sun, 26 Jul 2020
 16:50:58 +0000
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions v2
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200724115611.15375-1-christian.koenig@amd.com>
 <eed23689-279e-2ec9-ccab-143271b80466@amd.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <26def03b-5790-a3d7-a99e-d762842d17e5@amd.com>
Date: Sun, 26 Jul 2020 11:50:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <eed23689-279e-2ec9-ccab-143271b80466@amd.com>
Content-Language: en-US
X-ClientProxiedBy: SN1PR12CA0082.namprd12.prod.outlook.com
 (2603:10b6:802:21::17) To DM6PR12MB3067.namprd12.prod.outlook.com
 (2603:10b6:5:115::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.130.99] (165.204.78.25) by
 SN1PR12CA0082.namprd12.prod.outlook.com (2603:10b6:802:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Sun, 26 Jul 2020 16:50:57 +0000
X-Originating-IP: [165.204.78.25]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29a3bc21-936d-46a2-908a-08d831841219
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB30661C6095AE14BBFBA3961EFD750@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ioLC/9o/SyrXTlmpz2wrAfW9Belvd0SsBpm5ldhSOUGdYcyqM25gYlbu1i5KXQ9wEvPcIpFZ1lnxFfXbHbyAIyyeAiBgODjEaafSYXMPm2sCfFTV/3Kbztgt/Ibh/Cgi6k8sSrSqkOUrpKp3ucszhFDLWU1GS6o7mkxPrfUhAK8L1lcpT7y4xZOkm95gSXSLlZoHkj3kGAWv7oGTh4qbq9mqGCXimN1nBH2Pro+trdmVRQw4Dmvbx95ExBQ4k5Wn6yjQ6hlT4/xZMzvfyfjBbdamW4CbnC2wIsYk/2KMZ7+4/fHBJuedvdWNAN+AQ1oe+8nBi2TyLRgLbcZCtbzQOB6HO6xFt/l2712CQHF8Hgz8Yt14NfN8We2cyokMXjCQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3067.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(956004)(6666004)(26005)(52116002)(16576012)(2906002)(2616005)(36756003)(86362001)(8936002)(31696002)(31686004)(6486002)(110136005)(16526019)(8676002)(4326008)(186003)(66556008)(53546011)(478600001)(5660300002)(66946007)(83380400001)(66476007)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cHyk8qhASh30OAMzpfzIoDTNoKmk84Gn8ocIykq1NI3QpjX/6K6vUBFtKB4zhJIYXt7ozYw3UremMRtGIcrhvfDUkIKRTbUKxbazeQ5EC0L2h5LmCHpGwFJdjioanic6OLIL1vWZmUFYcv5WRjAmJVSVzRHTD8OAkUQu4PFE5y5/k4inkmM080kX4cBEuX+It/jVeXsbJLmp/G6LlflAsuAatH3by50bHTmrL6FGBbPp3+FJ5MDeFTHakwXZWIkcIXRd4BemaQ0uLsogfX/KupkX3HmsWG+RovuFeJppWajg/xSz8FzJa/Palm41OrMWgZkWwIDM6FYfHKTF985+L/Hhx31TR6VXEgZ3h6jgGlAMxanqPd+ABLO/us7zs1Jf41s4IaUqsc2ix7triJ38yziLo4ZAZBuvenDxktlvUYHb5dMdmtGImsifi5dOCVObq428NwRRDgiRpPk7JN/f7rkaE27x5LYieHriBRw9DqE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a3bc21-936d-46a2-908a-08d831841219
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3067.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2020 16:50:58.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxDNOa+TP7OAK5d9G+8KPKYc53+n+CLCsBQBd5bjrz/UEOhB4Wh3ZeZv7y4Yh8bh+cx/id92aQNpBR8Hq+GglQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: Philip.Yang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjQvMjAyMCAxMDowMSBBTSwgRmVsaXggS3VlaGxpbmcgd3JvdGU6Cj4gQW0gMjAyMC0w
Ny0yNCB1bSA3OjU2IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBXZSBjYW4ndCBw
aXBlbGluZSB0aGF0IGR1cmluZyBldmljdGlvbiBiZWNhdXNlIHRoZSBtZW1vcnkgbmVlZHMKPj4g
dG8gYmUgYXZhaWxhYmxlIGltbWVkaWF0ZWx5Lgo+Pgo+PiB2MjogZml4IGhvdyB3ZSBjbGVhbnVw
IHRoZSBCT3MgcmVzb3VyY2VzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4KPiBJdCB3b3VsZCBiZSBnb29kIHRvIGdldCBhIFRl
c3RlZC1ieSBmcm9tIEFsZXggYXMgd2VsbC4KPgo+IFRoYW5rcywKPiAgwqAgRmVsaXgKClRlc3Rl
ZC1ieTogQWxleCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+CgpSZWdhcmRzLAoKQWxleCBT
aWVycmEKCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDggKysr
KysrLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gaW5kZXggMDc2OGEwNTRhOTE2Li40NjlhYTkzZWEz
MTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtNjUyLDggKzY1MiwxMiBAQCBzdGF0
aWMgaW50IHR0bV9ib19ldmljdChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIAlw
bGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50ID0gMDsKPj4gICAJYmRldi0+ZHJpdmVyLT5ldmlj
dF9mbGFncyhibywgJnBsYWNlbWVudCk7Cj4+ICAgCj4+IC0JaWYgKCFwbGFjZW1lbnQubnVtX3Bs
YWNlbWVudCAmJiAhcGxhY2VtZW50Lm51bV9idXN5X3BsYWNlbWVudCkKPj4gLQkJcmV0dXJuIHR0
bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKPj4gKwlpZiAoIXBsYWNlbWVudC5udW1fcGxhY2Vt
ZW50ICYmICFwbGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50KSB7Cj4+ICsJCXR0bV9ib193YWl0
KGJvLCBmYWxzZSwgZmFsc2UpOwo+PiArCj4+ICsJCXR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNl
KGJvKTsKPj4gKwkJcmV0dXJuIDA7Cj4+ICsJfQo+PiAgIAo+PiAgIAlldmljdF9tZW0gPSBiby0+
bWVtOwo+PiAgIAlldmljdF9tZW0ubW1fbm9kZSA9IE5VTEw7Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
