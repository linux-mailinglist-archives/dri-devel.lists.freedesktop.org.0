Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF92357529
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 21:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13A6E984;
	Wed,  7 Apr 2021 19:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F576E981;
 Wed,  7 Apr 2021 19:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePWBQgPt0fpSLeL3OuaQkpJ//OdfkJLN0Yuzna0t1FN9uqB9YJV6IXMvJNzxGEh3DXNpiRRiy07SdjSM5wAGBZMcAEQBfURuyWepeKDG/OmPVy6Y22BlxeBcDmXyT4sJ2YMWqb3Bi8qlojUl1h1wy/wri8LGY6AJTdlECFC0yjsjH7E9OZGMX9TLo1wcG33XTgsoMWfAznql+T4UGhJDluMIYlcdHMR2Cngbh4NpKWG0Ay6PvNdBs6FTdIpsM6w633cIe5c6ybRewuZHRqpIGXiKKhkht/IxlmOm26Isg1d/eBoOnwOKNRga/pm7J8SKg7iCwWyQJCERo5b86f2GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CkAg8oQuDY72Ev53yViTI3qwyOuGUY5nNnSGaukuzA=;
 b=B3L0eMisjHlTgDvLL1EqVKnJT6/gv+OyGXoNRkLQanw9VEEUyG0PDQFtZoxOjdCYvtd1fypu65VxzUKjwSxaUw7oZYhXJwQziqk6KS+aYp1x3amZFkCuHiMCF9Gx9PYduN3h7zjhqRGO9YnLaP1POLCQGO/Qt6LPA05nbpvDk8B+8ECk+mSNPqueGE5sY8HFlA09pnCPdCbbMn8iR2E5FXPmwbSyoGot9kitOeyBuWel6g2tbLkQv4R67PF/3o8/27+s/Tdq6KkUm1eH5E0L0eDfYhFIix6e2neDW5l4abd6r3hS7/RUlyv4aHMnRvSvVN/lxJoZe9kTmOzLYLJzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CkAg8oQuDY72Ev53yViTI3qwyOuGUY5nNnSGaukuzA=;
 b=oTF4PFyOvNk9Zqspnpxpu2+YgKqFw1T3TFGNaelvXjD1S3lUwVEVpkAcNcSYKDOnLPcSr2JMlVtfQd/Zrf4n1lMCHvtzFV+AwtYHhIx5ceEhpuIeDx13z31K0qnSVZL9w2iXcAMsxmJiVL/UEDpf7/Y7jrN/SV6/41bXExaUreE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3694.namprd12.prod.outlook.com (2603:10b6:208:165::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 19:49:34 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Wed, 7 Apr 2021
 19:49:34 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
From: Felix Kuehling <felix.kuehling@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
 <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
 <780bb477-77c3-2f3c-2417-edeffccd63b9@amd.com>
Organization: AMD Inc.
Message-ID: <a152c174-c0fe-fc6f-9fa0-9054ffe415a9@amd.com>
Date: Wed, 7 Apr 2021 15:49:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <780bb477-77c3-2f3c-2417-edeffccd63b9@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 19:49:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f37fbc31-2d65-47d7-e7be-08d8f9fe44eb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3694D3FD26C346B3E4D4CD5B92759@MN2PR12MB3694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxLjn/2LsybvE3mHMQP0qDEVAZFcmQAtGXiaqThLObpOrHo0X0IIorupnP19Y4SxEi0X2dDbsQZcG5OM5EIOKI5ZH/bnAXKSF91krxdq3GYqEBwjkP6dI7gPU099piIXeWhLqSUuykxmMq9SQSB1/xpsGbJEdu2GLZsZh+4L/XWURlIJ+PU1fO7R4ssPeebQeUqdt7Ak1jd2n5QKFS3N+Goq9jaD9M+aheOEQ5SQIQ1mjHWQ7gRFv5FljRoG3UzWsUKyCzE/krbZNsBqiX0s6X6eKZbdx+PoBww4o2f+hAO2mHbG92S5y4bQPPxgGeI4twyiKdHNvMlpGm4QafEPvnFWwS0DJu5Ry018rWutMa2+bIS/g44ElYAUdlW63U4U5XfGclok36S6QwnUI8aZtVkAKgjWEbPcRNV/2Phtd+fdhGpT8mZ6oNKzaxl2RPqdI5vQxSylISGqYWJEvWHluBm6tQpkRXJTZXuPq56bVvnRcFYfk6U4GAKTVRsShEvu8gJsztoWsnJ05cdCpaS0WLQnnPsSOqOP10eBA2OYiwX95fc5J7O5d6GnxDRwdmKgVqglImMhF5sSjr7zM1Vc2Lh7TUw/BJRrgBcaFVAJssyPtdCI8nA/yAsIeGb91Hwko86TutNHXrMA4oCz16SNenLLNPi8jxT//HbNLDejwFDF0dZaAQbvkNqFsFcdQrzZsFdk0nveODWxDdPnA0M6KR6mrGwcshIyka/+S2r5oexOkSdjrOT8YH+9qbHIh/f+8zxJsk+MglcyE6q3NS0H5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(4326008)(66556008)(478600001)(31686004)(66476007)(38350700001)(7416002)(86362001)(16526019)(83380400001)(16576012)(31696002)(186003)(38100700001)(6636002)(316002)(66946007)(36916002)(53546011)(52116002)(66574015)(6486002)(110136005)(5660300002)(8676002)(44832011)(26005)(921005)(8936002)(2616005)(956004)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWNhelVDMFR1Q0ViTjllR1EwTkVsbWkxZTNZOXlTY0p6OUFGb0JCSDM1UDIv?=
 =?utf-8?B?VnV2cU1iUUs2QnI3a1J3UGMySU9DNUROUzdMQ3lkZk8waTVhTnJRb3RvbE1Z?=
 =?utf-8?B?ZkRTZDRzLzExNkx2ZFVKSXVGTUpJVFNRY01FMWpONVNzWU5BOUtrbUdmM0lt?=
 =?utf-8?B?Q25lOWtrZWFTaDQ2a1p3VjBRY1FpNWlORlZkYnNQVFdzVnoySHFaU08raml1?=
 =?utf-8?B?OUVNSlFBYWRKQnBPYXBSQzZwUnJtWTJHRFhVekYvUjBhNWtITFIzMUgycXRK?=
 =?utf-8?B?UjF2TjdoR2ZmVno3UHZ5YVdOOWNCaWhNM3VqV1MvWWsxUmZkZlpDUm53RkRu?=
 =?utf-8?B?SUg3Ykx1SEtiYmUvL3d2NmxSaWlxNzNsTEhUWFIxZzRhWElRb0VDdGIwQ0tl?=
 =?utf-8?B?QVpkMGVHNmw4RTNNZUhEMyticFl5YU1RaUY4N0Z4eWtrNVlRRFdLYjUzUllx?=
 =?utf-8?B?VkcrdXIvQ2JZdVNkajQyUi9uS2FnTlVubzg1TEpOVnBFSzBJbW44VHdUQkI2?=
 =?utf-8?B?dkJRbUV0U1VWbnd5eTBEZVd0dkkwWnZlMCtIenhMWjZBUXNycFd2VGw1eEpj?=
 =?utf-8?B?TTFlRHYzQ3dJTlRQS21WNnRId3NPTDdCSVpkUEs4M1BkTEtxWDVmOGJnd2Y5?=
 =?utf-8?B?UmhWNjlaUEl4dld6WGlKVUpQblorN0hLNWUxaTdVZFdnMXo2Z3J4Y01oUHVS?=
 =?utf-8?B?RFl5aDhpaGZCYm1RdXNnZ3dpaU0wWGVadVlDbFlLWTB3MnE0VzdhK1ZVVEJP?=
 =?utf-8?B?MHhtNDZSNkpkbHRPdU1uWUVYaXYyUmNkNGUzaDBrN0k5YjhKcGF1MWlCQThk?=
 =?utf-8?B?Vy95N1ViWWtla3MwT29Rdnp3Zzl6WUZmL2pQRzBJMndqS09nWHN1dUk5b2Zs?=
 =?utf-8?B?Ti9SK1lJUG1uUWpJaXRiQ1BndGFadFdra2lWYW9WWUJjeHZsd3ZGaGcvZFpV?=
 =?utf-8?B?Ky9ZRzFkYUNSbzNKd0Q5TkNtb2Z1cE5xYzY3NWlsL3hXVUZwQjJVRmxUOUxz?=
 =?utf-8?B?YzRYaGFDQlJyMFVteERTaDN4UHpJNHhiL1JnTWkvWWlIUWIrdFRIRklIZTN1?=
 =?utf-8?B?d3hDRDZGemVVNTJVdjNUK2dNb3dCNHgzTzZkMlVGSEVTd3ZlUFp5bCtNY296?=
 =?utf-8?B?UTVFTGJWTE5Xa2lzcGNodHFCSmoxNDA2L0NYMFNobzdMaE85ZHdnTy9VUUpF?=
 =?utf-8?B?V1ZWRVRjSGZsVHBpMjJGQWFjVURweEpaZFNtbm1MOHdKS2dVR0N2N3c2bFBk?=
 =?utf-8?B?dTRwYk50SUF5KzhMUUpONkpYN09OVVhYcUl4SE10UjNRTmt1ZXFEdVVnVEtD?=
 =?utf-8?B?bXpISS94MWJxbHNPckx4bHR6enQ2c2lxZXlsS1NObi85ZkZUK0IycjNKR1hr?=
 =?utf-8?B?d0o4dVdUQUx2aTd5ck94NVN2Q3JJSlVoenM1VkMwdzNwbE9EV1NSTThQdis2?=
 =?utf-8?B?UmVhL1B0bFRrRzVxbFhFZnQ2ZEZVZGZ0aDJLbFJZQnZmNG5NUlZ2S1lmNnli?=
 =?utf-8?B?Zjl5aGV6Sy94RzlJVnV0aCt5NTJKZ3g1QkcwRlkyNCtLUzJQNEhwRnp1bFBk?=
 =?utf-8?B?cUgvTnBvT0RkdXo3YVNwN0JTT2ZRZEFJenc4TlorOVFJanMyZEg4NVEvSW1q?=
 =?utf-8?B?Z0Fvdk12ejBkdWJyZ1ZhUms0bElYbFFpekxWekR1MnMzL0tRVzNqL0JscC93?=
 =?utf-8?B?cWx0N2p1a0IrRVNDeWNhMS8zaHg4MVpmOTdyd2cwdllrZ3ZMdjhrT29kL0p6?=
 =?utf-8?Q?WPOdD/nXmS1HVO/xEZG0VoaJb7tdWx0N66TGQdG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37fbc31-2d65-47d7-e7be-08d8f9fe44eb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 19:49:34.8187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aseEGhw23OAFXccvTdROhhxmdtADSoqypv684JBV2JCkMvbnT/mv5Qxaa5qf+H/VRExFQrG4Qnm6OsiSOLjT+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wNyAzOjM0IHAubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+IE9uIDIwMjEt
MDQtMDcgNzoyNSBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gK8KgwqDCoCAv
Kgo+Pj4+Pj4gK8KgwqDCoMKgICogRG9uJ3QgdmVyaWZ5IGFjY2VzcyBmb3IgS0ZEIEJPcy4gVGhl
eSBkb24ndCBoYXZlIGEgR0VNCj4+Pj4+PiArwqDCoMKgwqAgKiBvYmplY3QgYXNzb2NpYXRlZCB3
aXRoIHRoZW0uCj4+Pj4+PiArwqDCoMKgwqAgKi8KPj4+Pj4+ICvCoMKgwqAgaWYgKGJvLT5rZmRf
Ym8pCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4+IFdobyBkb2VzIHRoZSBh
Y2Nlc3MgdmVyaWZpY2F0aW9uIG5vdz8KPj4+PiBUaGlzIGlzIHNvbWV3aGF0IGNvbmZ1c2luZy4K
Pj4+Pgo+Pj4+IEkgdG9vayB0aGlzIGNoZWNrIGFzLWlzLCBpbmNsdWRpbmcgdGhlIGNvbW1lbnQs
IGZyb20gYW1kZ3B1J3MKPj4+PiB2ZXJpZnlfYWNjZXNzIGZ1bmN0aW9uLiBUaGUgdmVyaWZ5X2Fj
Y2VzcyBmdW5jdGlvbiB3YXMgY2FsbGVkIGJ5Cj4+Pj4gdHRtX2JvX21tYXAuIEl0IHJldHVybmVk
IDAgYW5kIHR0bV9ib19tbWFwIGRpZCB0aGUgbWFwcGluZy4KPj4+IFRoaXMgaXMgcHJvYmFibHkg
YSBsZWZ0LW92ZXIgZnJvbSB3aGVuIHdlIG1hcHBlZCBCT3MgdXNpbmcgL2Rldi9rZmQuIFdlCj4+
PiBjaGFuZ2VkIHRoaXMgdG8gdXNlIC9kZXYvZHJpL3JlbmRlckQqIGEgbG9uZyB0aW1lIGFnbyB0
byBmaXggQ1BVIAo+Pj4gbWFwcGluZwo+Pj4gaW52YWxpZGF0aW9ucyBvbiBtZW1vcnkgZXZpY3Rp
b25zLiBJIHRoaW5rIHdlIGNhbiBsZXQgR0VNIGRvIHRoZSBhY2Nlc3MKPj4+IGNoZWNrLgo+Pgo+
PiBPaywgZ29vZCB0byBrbm93Lgo+Pgo+PiBUaG9tYXMgY2FuIHlvdSByZW1vdmUgdGhlIGV4dHJh
IGhhbmRsaW5nIGluIGEgc2VwYXJhdGUgcHJlcmVxdWlzaXRlIAo+PiBwYXRjaD8KPj4KPj4gSWYg
YW55Ym9keSB0aGVuIGJpc2VjdHMgdG8gdGhpcyBwYXRjaCB3ZSBhdCBsZWFzdCBrbm93IHdoYXQg
dG8gZG8gdG8gCj4+IGdldCBpdCB3b3JraW5nIGFnYWluLgo+Cj4gRldJVywgSSByYW4gS0ZEVGVz
dCB0ZXN0IHdpdGggdGhpcyBzaG9ydGN1dCByZW1vdmVkIG9uIGN1cnJlbnQgCj4gYW1kLXN0YWdp
bmctZHJtLW5leHQgKyBteSBITU0gcGF0Y2ggc2VyaWVzLCBhbmQgaXQgZGlkbid0IHNlZW0gdG8g
Cj4gY2F1c2UgYW55IGlzc3Vlcy4KCldhaXQsIEkgY2VsZWJyYXRlZCB0b28gc29vbi4gSSB3YXMg
cnVubmluZyB0aGUgd3Jvbmcga2VybmVsLiBJIGRvIHNlZSAKc29tZSBmYWlsdXJlcyB3aGVyZSBh
Y2Nlc3MgaXMgYmVpbmcgZGVuaWVkLiBJIG5lZWQgdG8gZG8gbW9yZSBkZWJ1Z2dpbmcgCnRvIGZp
Z3VyZSBvdXQgd2hhdCdzIGNhdXNpbmcgdGhhdC4KClJlZ2FyZHMsCiDCoCBGZWxpeAoKCj4KPiBS
ZWdhcmRzLAo+IMKgIEZlbGl4Cj4KPgo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uIApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
