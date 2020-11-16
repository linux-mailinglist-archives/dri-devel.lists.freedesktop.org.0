Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5312B1EA0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 16:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F576E523;
	Fri, 13 Nov 2020 15:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27CF6E520;
 Fri, 13 Nov 2020 15:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcAXvLoUbWqetS3qyFJgKENtBY+wLPcLPyBqBerwGIiXCzdzmVaLEmKvYPUJ5TMYjy+6pUA1re0kmsFlLDeS+9/l6B0HNl9/M+0IgIvq1T4IZBCx0aiTiA6F0Pi1qbgTWeI628/OrACWwYTX36fpsiUIB+qIh3BCtoaWrH0KvAxvahgnCxy0Ek+blz+720YlnSTxeQr0gqATmwoayYMCFltrh90qFaV+uIaOkIvBFcza7U3LmHxbptyGq2CIIi3mr4aWIxlN4c4eMhauxWyzN3fAdkNJtCUB8L7qilOuRl/N3XstWGGYekRh6d1ei+yq5b7FCAyy7JU1nhvCfsFZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USHQJbOKTLT3uYmcpkNf6VuD5KOF3y5IY5HvurTf7So=;
 b=abIpWoFqD976o7HK3GpYWxQ3aqGi7rAX1KtnX9DA95rapilq1vRgjm/qDn9RH7rIVyXt0OV5jTcStXMAfeleISx4iaxd4Y/iSY48szjNkLkh9b77rDl5rsHk54tTfE0/V6ikBCAlhNdzL5p23Yf/Xhr3CNTJVtBIXPmnokb1cmTUfFviWHVt9gFWjQ1OKvuv4OOY7oBN02tjdVuw9KTqNmhcD6cTLSS6Gcr9VPj/I9bfX4Y/L0ycIqAsUOl7phwsaGbCcoU4oW4BRngzTIMV6drD8VXGLvQAqP98Xesk5+pu8gejsnyKT5VsndDEf8UtMfXeJUBJxofBIlYWfRoqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USHQJbOKTLT3uYmcpkNf6VuD5KOF3y5IY5HvurTf7So=;
 b=wXe+7ZGKkgcA8fJB4IBQ9R/4j6xoOoUqpV1LHdmEG2iTnv7jdaKgcBdOWvl+MLnW+1XLqpBfP1WdmgsW2cWLumddpmZ9UMZ0w8ihKayCYkPCOUL2nYsIonfTP3cRwm8B8YryXPI6nYpagmMbieyIFCIZLpgL7xiCpo2EJ3MhsJM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3776.namprd12.prod.outlook.com (2603:10b6:208:167::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 15:28:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 15:28:15 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
Date: Mon, 16 Nov 2020 12:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0086.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0086.eurprd06.prod.outlook.com (2603:10a6:208:fa::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Fri, 13 Nov 2020 15:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a697e6b-678f-48b2-6714-08d887e8bcd7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3776F7CBC815B743CB700B6383E60@MN2PR12MB3776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjjVsJMNMcqCErcgHzou9NGiz9EdXnheAbVK2BHBvcVuzw8Vlg0w+LsD2xtlXMUbM+jwH2KvbivLG8TNhP/z9DIO8J+eMSK5Z/gaWOy/9tF8Zs6VelP0ciO54+fM6FumSDMjSWVnGGnNfq+fo7L6NN+PEff/kDaU7S9ZanqnQ3RYwft5kyRlD2dOWF6FgKHU+zsZve0BSVt7rzF+tf+u5mqffEaA7gAoCd9M/ygHeBG1ZsTz35ME9CsmL44UHjx+AF1zmQa38V4skgROaqzKUd/8uefFRQArpsMKn26ehFaeHGP4qsHXpRiQM/b0euD6/NORgQV/4IUlYMuQN6sUeAjEx5AOjiSi8u7xAZRf9XTCZDsMOl5rBY17rNy2xRz3xoetI6QPByBPpskj8ETlSW7XfxIGg+8aPRjx1rzRm96L0vSI1njfVNXVWREiVKtYzefl9ipSVcRKDKDhN3JP5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(36756003)(2616005)(66476007)(8936002)(478600001)(2906002)(966005)(31696002)(31686004)(86362001)(52116002)(316002)(186003)(16526019)(45080400002)(83380400001)(66574015)(8676002)(66556008)(4326008)(66946007)(5660300002)(6666004)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGhXUmlFUXVGZ1lUaGZjMW1aSTdkZEtjcXpXZ1Bha2tKTEl5MVNWRUpPaXRV?=
 =?utf-8?B?QW5uVzhxdFBlSWFveEQ1dnZ3N0NrNkRFZVpick82YjMvMnBmWDR2emxGR25N?=
 =?utf-8?B?dHRWV0ZjM0ljbG90eGpoNXlZN2tkeFh3bktPWUtocHYyaHRWS2ZPbVcwNU51?=
 =?utf-8?B?R1ZRUm5NZ3Arb21vY0ppTldJWkRJUjdITzlZakJoRmJsZ0pod1NHbzY4T0o3?=
 =?utf-8?B?eTQ2OGNaWXNDNTdZaTRRclJqS3JZTWR5UmRzcFludlpCZW5rYVU2RG9rUEti?=
 =?utf-8?B?Zzc4Y2lTYjErR3I1UkJ1YWdwbm9zTWd2VDViRFN5ZG9EMWpGYUNDRmZsYUFR?=
 =?utf-8?B?M1g3emtHSVF1Q3FqTURVMEdDVGdMTVU1Nm5RLzNob3RWOVY5N21CbmphOEZJ?=
 =?utf-8?B?eHJYbXZ1djN1ODVxRVliY0NmTFNrOTVIdGduYjJsWXFxSVAwVHk5WHBqWFly?=
 =?utf-8?B?MXRBTzhqL3hPbDlMM3drcUp3MTZmYk9FR3Z2VEdnaU9obFhiVzVhMVdIaW5H?=
 =?utf-8?B?YXJhWkFxZjJzTE0vM1Z3cVBQTU1jV2o0V2dzVEQ3dm5CcGNneEFrOXJUN3hY?=
 =?utf-8?B?RTBWNUd3bmpNNFVuSEZ5d09yS3ZqUnFEQWhiakFsU1YzdUd3STJNQmh0b2ht?=
 =?utf-8?B?c0xFWXdPRkliNjQ1YUl4YVIzS1hHcHNWcEloL2dWUTJiZENRYWpzeldWNUls?=
 =?utf-8?B?d1RnWTN0QS9FMHl4cnVaalFaV2tjOXhERDdyMXArY2V1M003MmF4cllMaEUx?=
 =?utf-8?B?NVlNb1J5eG5FdTF5Q3l4L0pTSWxHRG5FdU40dFZvTUNjQ2YzSi9ZNVlOQW1w?=
 =?utf-8?B?VHoyZ1ZQcTZpK2xhSFp5MGVPT1I5RjlNS2JQQUlXWXpsUHJTbVBzM3Fxc3Vk?=
 =?utf-8?B?QTRsTVB2S0FvZ3FRNlpLa082eG4xczFoRUJvTXhHbG9CNmdTcVhnR2NENnl3?=
 =?utf-8?B?K1ZNRTVTbDNhQzRHdGNLRzliVTVhei9UWkRxM3k0RzBYZDN0dE9YWDUrdThE?=
 =?utf-8?B?MGY4OFMxTnl3N0hWVHJUWTR6aElQNUVTN3JKK2lTaDlYaU9icXlsQnlxa25K?=
 =?utf-8?B?bnV3bE9OcitMUFkxVE8vZVpVMWtZODlXaEpLTXNtUThVc0U5Tng4L1lnMmR6?=
 =?utf-8?B?azVyeSt6eE9tS1RhWHVnam9NakdQM24yL0t2MU1OMjVSZGNYbzB1NEhrZFFW?=
 =?utf-8?B?SEloMjFKTGxJN281cVpJbVlscmE4R0pkQnFCSUNWb21kQzQ1TC9Ic0dwV1NJ?=
 =?utf-8?B?eUpac2VRVzV3bzZHZWRDU1V2WnFKV0ZFd25Lem9IRnJDUTNEdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a697e6b-678f-48b2-6714-08d887e8bcd7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 15:28:14.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+cdMvnoIktm1IvL7LX+08bHiESkzsGAao3umpVmNhuQvNN7PXLxGiAolMNGGreW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3776
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMTEuMjAgdW0gMDg6NTkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaSBDaHJp
c3RpYW4KPgo+IEFtIDEyLjExLjIwIHVtIDE4OjE2IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoK
Pj4gQW0gMTIuMTEuMjAgdW0gMTQ6MjEgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPj4+IElu
IG9yZGVyIHRvIGF2b2lkIGV2aWN0aW9uIG9mIHZtYXAnZWQgYnVmZmVycywgcGluIHRoZW0gaW4g
dGhlaXIgR0VNCj4+PiBvYmplY3QncyB2bWFwIGltcGxlbWVudGF0aW9uLiBVbnBpbiB0aGVtIGlu
IHRoZSB2dW5tYXAgaW1wbGVtZW50YXRpb24uCj4+PiBUaGlzIGlzIG5lZWRlZCB0byBtYWtlIGdl
bmVyaWMgZmJkZXYgc3VwcG9ydCB3b3JrIHJlbGlhYmx5LiBXaXRob3V0LAo+Pj4gdGhlIGJ1ZmZl
ciBvYmplY3QgY291bGQgYmUgZXZpY3RlZCB3aGlsZSBmYmRldiBmbHVzaGVkIGl0cyBzaGFkb3cg
YnVmZmVyLgo+Pj4KPj4+IEluIGRpZmZlcmVuY2UgdG8gdGhlIFBSSU1FIHBpbi91bnBpbiBmdW5j
dGlvbnMsIHRoZSB2bWFwIGNvZGUgZG9lcyBub3QKPj4+IG1vZGlmeSB0aGUgQk9zIHByaW1lX3No
YXJlZF9jb3VudCwgc28gYSB2bWFwLXBpbm5lZCBCTyBkb2VzIG5vdCBjb3VudCBhcwo+Pj4gc2hh
cmVkLgo+Pj4KPj4+IFRoZSBhY3R1YWwgcGluIGxvY2F0aW9uIGlzIG5vdCBpbXBvcnRhbnQgYXMg
dGhlIHZtYXAgY2FsbCByZXR1cm5zCj4+PiBpbmZvcm1hdGlvbiBvbiBob3cgdG8gYWNjZXNzIHRo
ZSBidWZmZXIuIENhbGxlcnMgdGhhdCByZXF1aXJlIGEKPj4+IHNwZWNpZmljIGxvY2F0aW9uIHNo
b3VsZCBleHBsaWNpdGx5IHBpbiB0aGUgQk8gYmVmb3JlIHZtYXBwaW5nIGl0Lgo+PiBXZWxsIGlz
IHRoZSBidWZmZXIgc3VwcG9zZWQgdG8gYmUgc2Nhbm5lZCBvdXQ/Cj4gTm8sIG5vdCBieSB0aGUg
ZmJkZXYgaGVscGVyLgoKT2sgaW4gdGhpcyBjYXNlIHRoYXQgc2hvdWxkIHdvcmsuCgo+PiBJZiB5
ZXMgdGhlbiB0aGUgcGluIGxvY2F0aW9uIGlzIGFjdHVhbGx5IHJhdGhlciBpbXBvcnRhbnQgc2lu
Y2UgdGhlCj4+IGhhcmR3YXJlIGNhbiBvbmx5IHNjYW4gb3V0IGZyb20gVlJBTS4KPiBGb3IgcmVs
b2NhdGFibGUgQk9zLCBmYmRldiB1c2VzIGEgc2hhZG93IGJ1ZmZlciB0aGF0IG1ha2VzIGFsbCBh
bnkKPiByZWxvY2F0aW9uIHRyYW5zcGFyZW50IHRvIHVzZXJzcGFjZS4gSXQgZmx1c2hlcyB0aGUg
c2hhZG93IGZiIGludG8gdGhlCj4gQk8ncyBtZW1vcnkgaWYgdGhlcmUgYXJlIHVwZGF0ZXMuIFRo
ZSBjb2RlIGlzIGluCj4gZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKCkuIFsxXSBEdXJpbmcgdGhl
IGZsdXNoIG9wZXJhdGlvbiwgdGhlIHZtYXAKPiBjYWxsIG5vdyBwaW5zIHRoZSBCTyB0byB3aGVy
ZXZlciBpdCBpcy4gVGhlIGFjdHVhbCBsb2NhdGlvbiBkb2VzIG5vdAo+IG1hdHRlci4gSXQncyB2
dW5tYXAnZWQgaW1tZWRpYXRlbHkgYWZ0ZXJ3YXJkcy4KClRoZSBwcm9ibGVtIGlzIHdoYXQgaGFw
cGVucyB3aGVuIGl0IGlzIHByZXBhcmVkIGZvciBzY2Fub3V0LCBidXQgY2FuJ3QgCmJlIG1vdmVk
IHRvIFZSQU0gYmVjYXVzZSBpdCBpcyB2bWFwcGVkPwoKV2hlbiB0aGUgc2hhZG93IGlzIG5ldmVy
IHNjYW5uZWQgb3V0IHRoYXQgaXNuJ3QgYSBwcm9ibGVtLCBidXQgd2UgbmVlZCAKdG8ga2VlcCB0
aGF0IGluIG1pbmQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gRm9yIGRtYS1idWYgc2hhcmlu
ZywgdGhlIHJlZ3VsYXIgcHJvY2VkdXJlIG9mIHBpbiArIHZtYXAgc3RpbGwgYXBwbHkuCj4gVGhp
cyBzaG91bGQgYWx3YXlzIG1vdmUgdGhlIEJPIGludG8gR1RULW1hbmFnZWQgbWVtb3J5Lgo+Cj4g
QmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiBbMV0KPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQua2VybmVsLm9yZyUy
RnB1YiUyRnNjbSUyRmxpbnV4JTJGa2VybmVsJTJGZ2l0JTJGdG9ydmFsZHMlMkZsaW51eC5naXQl
MkZ0cmVlJTJGZHJpdmVycyUyRmdwdSUyRmRybSUyRmRybV9mYl9oZWxwZXIuYyUyM240MzImYW1w
O2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMzFiODkwNjY0Y2E3
NDI5ZmM0NTgwOGQ4ODdhYTA4NDIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3
QzAlN0MwJTdDNjM3NDA4NTExNjUwNjI5NTY5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1u
MCUzRCU3QzEwMDAmYW1wO3NkYXRhPVJMYXV1QXVYa2NsMHJYd1dXSiUyRnJLUCUyQnNDcjJ3QXpV
MWVqR1YxYm5RODB3JTNEJmFtcDtyZXNlcnZlZD0wCj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFu
Lgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+Cj4+PiAtLS0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0u
YyB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+PiAgwqAgMSBmaWxlIGNoYW5n
ZWQsIDQ5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2dlbS5jCj4+PiBpbmRleCBkMjg3NmNlM2JjOWUuLmVhZjdmYzlhN2Iw
NyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwo+Pj4gQEAgLTIyNiw2
ICsyMjYsNTMgQEAgc3RhdGljIGludCByYWRlb25fZ2VtX2hhbmRsZV9sb2NrdXAoc3RydWN0Cj4+
PiByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgcikKPj4+ICDCoMKgwqDCoMKgIHJldHVybiByOwo+
Pj4gIMKgIH0KPj4+ICDCoCArc3RhdGljIGludCByYWRlb25fZ2VtX29iamVjdF92bWFwKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+Pj4gc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4+PiAr
ewo+Pj4gK8KgwqDCoCBzdGF0aWMgY29uc3QgdWludDMyX3QgYW55X2RvbWFpbiA9IFJBREVPTl9H
RU1fRE9NQUlOX1ZSQU0gfAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFJBREVPTl9HRU1fRE9NQUlOX0dUVCB8Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkFERU9OX0dFTV9ET01BSU5fQ1BVOwo+Pj4gKwo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgcmFkZW9uX2JvICpibyA9IGdlbV90b19yYWRlb25fYm8ob2JqKTsK
Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0ID0gcmFkZW9uX2JvX3Jl
c2VydmUoYm8sIGZhbHNlKTsKPj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBwaW4gYnVmZmVyIGF0IGl0cyBjdXJy
ZW50IGxvY2F0aW9uICovCj4+PiArwqDCoMKgIHJldCA9IHJhZGVvbl9ib19waW4oYm8sIGFueV9k
b21haW4sIE5VTEwpOwo+Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyX3JhZGVvbl9ib191bnJlc2VydmU7Cj4+PiArCj4+PiArwqDCoMKgIHJldCA9IGRybV9n
ZW1fdHRtX3ZtYXAob2JqLCBtYXApOwo+Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGdvdG8gZXJyX3JhZGVvbl9ib191bnBpbjsKPj4+ICsKPj4+ICvCoMKgwqAgcmFkZW9u
X2JvX3VucmVzZXJ2ZShibyk7Cj4+PiArCj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4gKwo+Pj4g
K2Vycl9yYWRlb25fYm9fdW5waW46Cj4+PiArwqDCoMKgIHJhZGVvbl9ib191bnBpbihibyk7Cj4+
PiArZXJyX3JhZGVvbl9ib191bnJlc2VydmU6Cj4+PiArwqDCoMKgIHJhZGVvbl9ib191bnJlc2Vy
dmUoYm8pOwo+Pj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMg
dm9pZCByYWRlb25fZ2VtX29iamVjdF92dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmos
Cj4+PiBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBy
YWRlb25fYm8gKmJvID0gZ2VtX3RvX3JhZGVvbl9ibyhvYmopOwo+Pj4gK8KgwqDCoCBpbnQgcmV0
Owo+Pj4gKwo+Pj4gK8KgwqDCoCByZXQgPSByYWRlb25fYm9fcmVzZXJ2ZShibywgZmFsc2UpOwo+
Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+ICsKPj4+
ICvCoMKgwqAgZHJtX2dlbV90dG1fdnVubWFwKG9iaiwgbWFwKTsKPj4+ICvCoMKgwqAgcmFkZW9u
X2JvX3VucGluKGJvKTsKPj4+ICvCoMKgwqAgcmFkZW9uX2JvX3VucmVzZXJ2ZShibyk7Cj4+PiAr
fQo+Pj4gKwo+Pj4gIMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3Mg
cmFkZW9uX2dlbV9vYmplY3RfZnVuY3MgPSB7Cj4+PiAgwqDCoMKgwqDCoCAuZnJlZSA9IHJhZGVv
bl9nZW1fb2JqZWN0X2ZyZWUsCj4+PiAgwqDCoMKgwqDCoCAub3BlbiA9IHJhZGVvbl9nZW1fb2Jq
ZWN0X29wZW4sCj4+PiBAQCAtMjM0LDggKzI4MSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3RfZnVuY3MKPj4+IHJhZGVvbl9nZW1fb2JqZWN0X2Z1bmNzID0gewo+Pj4gIMKg
wqDCoMKgwqAgLnBpbiA9IHJhZGVvbl9nZW1fcHJpbWVfcGluLAo+Pj4gIMKgwqDCoMKgwqAgLnVu
cGluID0gcmFkZW9uX2dlbV9wcmltZV91bnBpbiwKPj4+ICDCoMKgwqDCoMKgIC5nZXRfc2dfdGFi
bGUgPSByYWRlb25fZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKPj4+IC3CoMKgwqAgLnZtYXAgPSBk
cm1fZ2VtX3R0bV92bWFwLAo+Pj4gLcKgwqDCoCAudnVubWFwID0gZHJtX2dlbV90dG1fdnVubWFw
LAo+Pj4gK8KgwqDCoCAudm1hcCA9IHJhZGVvbl9nZW1fb2JqZWN0X3ZtYXAsCj4+PiArwqDCoMKg
IC52dW5tYXAgPSByYWRlb25fZ2VtX29iamVjdF92dW5tYXAsCj4+PiAgwqAgfTsKPj4+ICDCoCDC
oCAvKgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZv
JTJGZHJpLWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNv
bSU3QzMxYjg5MDY2NGNhNzQyOWZjNDU4MDhkODg3YWEwODQyJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQwODUxMTY1MDYyOTU2OSU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1oMVU5UG84M0s3d2VieHNpS3Bu
M1pHRno5RmNnNlNSa3h0clhXWjElMkIlMkZFYyUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
