Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49E34E840
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD96E8D3;
	Tue, 30 Mar 2021 13:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40A36E8D3;
 Tue, 30 Mar 2021 13:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWPyzQG+tA2KTUh40xdu+DBHeYASkrZKaecTh6G7D5a0OsohMfkYsbhq3O4pf7sMTFVdctWAbcOccqWPcmAq6MCNUqFLTxYJabUxM9hyM6Lbpan/MKuzrbESjRWqJ9cVO8DHy9W4opIrQJVmaxrx8g/nseKHOOc8pBYfgH9wajnVBMbMarBebPV6Dm5F6h3MkW5JlBMFZlzgzGZN8qss6Mgze+ZINzQY4U0It/04s/LMkW5auFk9pTqAQjgDNNsmlHtE52k6jV5BvPQk0HErsB8soTYnQpv/5ZtzYdrVP1AmbviLqYOJhaIAMihjuZfMGKIlfBIgMFd727q+QcAISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv+Kp5NHjAjb3NffPZvXt3nL8KucCuJ+SxfGqYIJIv8=;
 b=hZeFoKCoMIzhXZD7Chyab/jQxFqcfO1aOo4xnz5RvfBDS8JbcR1howwDpIrnFPvpnszip1zAOm81bHch9GVH+0gb2DuTE784EW/9jsCzHK24fY9IAbqe7KK0SCeKzrQC0/cSYGdX35dyH+LzFixLOi+m/pnDlN1q+Y9jvdD60vwyxwG9heC/lIjo4/jnA7M7Qydcw0oUTMAmARs5LNb+Ira9wQUXtI0+sp1NkmdZxR6y/0RdNcrAnwzjow04qxTir9d967ZJ0+7puqoquuYSBQ/VK9w5yVmyZcJufj9NN3xUfkMUQp4u02QUnU2+BQpvvm+S3J+5obYaWVgeEnFCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv+Kp5NHjAjb3NffPZvXt3nL8KucCuJ+SxfGqYIJIv8=;
 b=MsoRqmUK8BJIE8uQgXfTURcc3jCtLiRAytEUfwSv3Z5NeSGuDFE6PH5+3H99xWgQQeNn6Id12Hph0BYC0BbsQWEhKxvcvbUXHgoOigYQnVNHNVZY6slRL9+Aq2WSwGPrDCXpiUETKRjtj7nk6eN0XsHTYPr/Ta6mskPO0HY6CmU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3965.namprd12.prod.outlook.com (2603:10b6:208:168::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 13:02:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 13:02:43 +0000
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
To: =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
 <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
 <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
 <c3caf16b-584a-3e4c-0104-15bb41613136@amd.com>
 <20210330150004.857ae73704c3533692cf79f0@danny.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fb652517-1391-4d89-fe12-72d3748ec49e@amd.com>
Date: Tue, 30 Mar 2021 15:02:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210330150004.857ae73704c3533692cf79f0@danny.cz>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8ca4:a46e:6aa7:208c]
X-ClientProxiedBy: AM3PR03CA0071.eurprd03.prod.outlook.com
 (2603:10a6:207:5::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8ca4:a46e:6aa7:208c]
 (2a02:908:1252:fb60:8ca4:a46e:6aa7:208c) by
 AM3PR03CA0071.eurprd03.prod.outlook.com (2603:10a6:207:5::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 13:02:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ffe114e3-aa90-4474-9fe1-08d8f37c1b48
X-MS-TrafficTypeDiagnostic: MN2PR12MB3965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39650FB902967913B9EEE7EA837D9@MN2PR12MB3965.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AT8+plVZsfuXPCmHQmUynhN+ab2Ev6Ccp0Mh7VxI+kNUV4ZAaYmbWDMcPzeDFbSJj4AjRIXKk614OtxqIg8Da1KxEE1XNC5nBmZpTUnYSflzIq1/8t0vto9BuFI1pZLmJq6cUsy9/tIxBgBIKmTmIAy0ZLAHKvtfAIZRm7CFN+g+XSKUip5/AmTc1GQOSQE2VyeBMxtGK8VHQySdT+H4lD1aJOlvqIdyRZzrMfrfOoSWSxRyVvlQQtz7lAQbPs81TpiJoVVIwy6ajgUrtzj+xAvF4Iepee78qwD/ADoNv2R2P0uiFo2q5i3rFp9F0sf5PkREA2+N6jZUb7850Wdcb8V0nhGXwNmeM5inA7ST2y9QaR7M2tuTZmq6XOZ1Uiqxy+yhmxIQbZzWucB/0k8+JEGFmjK7cfcF16HeVblFEDevxbGECiVxOQCVKo7+ST+Oar3LtmkoVuMYtBh9fA2j3rMouYroKI64pRe2wIpbEt8jrxrAmd0Qk9+J4w2JJqOldN+hzJe88so7YaunmbCjbeGSUvRfjnEvbYptvbfXoEvanlRP1/1uvTlSiL3M8R9ZUPuCN66M3AcSBUhVKS4IYP8L5MXP1rxKxdXA/Fx6Xe4Z8LX51oOE1fXI7z9pLixNBgukDI3iffxf1lQU29i659n8SMLmbuYAlEsbI7JtGL8OnOEgPjS7Uc3+q9XDascB1zQ+bjdRS3PkG+XIGh9YdVuCdgVy4S8SH1/UhaWdW7rUqQX8n95UWyYdWDyJPsYN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(66574015)(8676002)(45080400002)(2616005)(86362001)(31696002)(6916009)(478600001)(8936002)(316002)(16526019)(6486002)(186003)(66946007)(6666004)(38100700001)(83380400001)(66556008)(36756003)(4326008)(966005)(53546011)(5660300002)(2906002)(31686004)(66476007)(54906003)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aS9TbnpmaTJnUkN5SXRTYTRHcEhvOWlSYWNGbjRTL1U3d2RZSXhsV3F0VFNY?=
 =?utf-8?B?UmhlTDRFS09PaEJ5RGR3em84N3VGa2RzTXR6OWFrd2hTMkpOQ2Q4Y0MzYmRt?=
 =?utf-8?B?emlmZmRWL3d1bFdWdXVUUUVJNHhDdW1sckkvMWZ2aENJQ0RBREFKcTUyUjMz?=
 =?utf-8?B?V0FTbXZ6NkNqYkg3QmlURjRnR1krRE9NODhZOXZ4TmFkNDdMWEhxMkZFVmFH?=
 =?utf-8?B?R1k4TlFVaWNIZmt4VUxIZk1zWDFYelV0c0FUOWlLYVQzTlZoem9vSW1mUGdH?=
 =?utf-8?B?bFZwVjlJd1dDRzZQRy9zL2NFVytIaW4zM2RWSUtDRW9URWROanRocEUwalFy?=
 =?utf-8?B?d2hTME90YllNdTlmblJlSEJIVHFwN2V1SG5HcjRNYVB2TDZkT2lQRndIY2ZU?=
 =?utf-8?B?cjc5UWp4Sm42ak9SSldMeHlEK0lrUjBCRCtIZUcwamlEZGZWd1I1VEx1ZHVE?=
 =?utf-8?B?NTBtdEJ1UERwRHBSNFZ1RE92amdnaHpmVUNRSWZXN2JoZFUrMy9MM2FERGJn?=
 =?utf-8?B?d1RoaG1DNjdWMzB0T2pteXJsb3RITlBwd3lyZWNucVhVb05IcHpnMlhlY2FT?=
 =?utf-8?B?cGx2QnpBbTdNK1p4bmZ4azBxSlRLTVA1Qm5tWnlucXF4dUVOdE9sSVdXc1p4?=
 =?utf-8?B?SXF0NjRXeHJwYy85cnhDb3VuWW1yYmRHNDNMRkE5SHZjSkdKZzY4aWdBT3pY?=
 =?utf-8?B?MGFnQXhPc29BOC8zRVBqVmNPVzcvbUpFZituczM3UkZ5RGowR05BQlptYmlK?=
 =?utf-8?B?UVhDbnBRNG51N2xIbXZZTVo2TTFPKzUzc3liZUtTRUQ2TU9LaXorL0NMUkM1?=
 =?utf-8?B?OFhJNkRNT2FidjZuSUpkZW9tejJzYkhPSTVTZlFtYy82alZRR2pRSE14a0w1?=
 =?utf-8?B?NkxVTWZsSjRNTnppdHM1aGhqMDZSK054b05JV25nNitHYlBRYkcvNTV4THBP?=
 =?utf-8?B?M01KbU5UTG05WGdOVUQwcTI0VU1CR3VKdS9IK294Wk9rMjhwTS9oZFpueEQ0?=
 =?utf-8?B?WDM4RVA3K055ZnZ5VjdwTUxVMWZmR3g3cktFMlBGQzlHRkc1RWhRNE56WUQw?=
 =?utf-8?B?ditHY1BRb3NXeHo1WVhUei9pUkR1bmlraEY1UXBncUQwREZTSi9yeVRoUFhz?=
 =?utf-8?B?blAvNUtOY0ZVYVhWZjZhMkJaWUh0NUVMNGZma0xNZGswWTZaZHBFUWVITUsy?=
 =?utf-8?B?aStTQktHVm05QnJxS2R4dDNCV3hWMXFyeFRFdjBZeTJpTXM1b1o4OHVWOWFw?=
 =?utf-8?B?WlpwSUkyWmJ2aEZGOGxNM3hMTXNCalNVMm9WeER2TFovb3pSdVR2Vnp4dDlH?=
 =?utf-8?B?a1F0UHJ3TnR3bVlqdGVCYmFuY2xEN1pNYU9QMjRHRTlTT1YvVVNRRmMzTmNQ?=
 =?utf-8?B?cGtiZFBKZlRpMFZOa3RxWmF0VVdQU2RKb3Jsa0xnU1FIL1pETi9ibStUa1BD?=
 =?utf-8?B?SlFqeFhzcHZsZVV4NkhTcXRsbGJLbDNVNzl4emVTc2xKWTRGenBJZ21Xd1hv?=
 =?utf-8?B?OXMvQ3dtdGkzN3hiWUloSzQ4ZlhyV2Fvdlk4RHVGeDYyS1owbTg4YXZVUkk2?=
 =?utf-8?B?VWsxQ1FrNkd2MmtndjZ6RDY4bWc5S2RMMXFTUWNMMnVkK3NNMDlhR1plZmp3?=
 =?utf-8?B?dE1zaXNCem1oSEtYNXRJcUlCMmxhbG45SE5wWGZmMFRETjNaMkIyT1NLWGdK?=
 =?utf-8?B?VWdvTk42S2o0cU05Tlo2T3FLVkVScklJNW1VeTdkYkdJbHpCRkNhR1ZibzNl?=
 =?utf-8?B?NkE0SWhzaU1LSFV4SUxPUU10MDdGczdFT2x6RDRkcS9BS3pUemJMV05uWWUx?=
 =?utf-8?B?SUJsYk8vRGYzd202ZUhyemZJSGJlL2srZ1Q5TzBDK0Frck5wYlhvd1lIZUNB?=
 =?utf-8?Q?OgnxGsMxODIAa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe114e3-aa90-4474-9fe1-08d8f37c1b48
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 13:02:43.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeZXwzCh9/s3S9Xh8elqjbAWvmXUpaw2ZB6xLWbKEZTocfD5mdb7vNrllfhgfoDJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3965
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xi Ruoyao <xry111@mengyan1223.wang>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDMuMjEgdW0gMTU6MDAgc2NocmllYiBEYW4gSG9yw6FrOgo+IE9uIFR1ZSwgMzAgTWFy
IDIwMjEgMTQ6NTU6MDEgKzAyMDAKPiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+Cj4+IEFtIDMwLjAzLjIxIHVtIDE0OjA0IHNjaHJpZWIgWGkgUnVv
eWFvOgo+Pj4gT24gMjAyMS0wMy0zMCAwMzo0MCArMDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+Pj4+
IE9uIDIwMjEtMDMtMjkgMjE6MzYgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+
IEFtIDI5LjAzLjIxIHVtIDIxOjI3IHNjaHJpZWIgWGkgUnVveWFvOgo+Pj4+Pj4gSGkgQ2hyaXN0
aWFuLAo+Pj4+Pj4KPj4+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55IGNvbnN0cmFpbnQg
aW1wbGVtZW50ZWQgdG8gZW5zdXJlIGBudW1fZW50cmllcyAlCj4+Pj4+PiBBTURHUFVfR1BVX1BB
R0VTX0lOX0NQVV9QQUdFID09IDBgLsKgIEZvciBleGFtcGxlLCBpbiBgYW1kZ3B1X3ZtX2JvX21h
cCgpYDoKPj4+Pj4+Cj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgLyogdmFsaWRhdGUgdGhlIHBh
cmFtZXRlcnMgKi8KPj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc2FkZHIgJiBBTURHUFVf
R1BVX1BBR0VfTUFTSyB8fCBvZmZzZXQgJiBBTURHUFVfR1BVX1BBR0VfTUFTSwo+Pj4+Pj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSA9PSAwIHx8IHNpemUgJiBBTURHUFVfR1BVX1BB
R0VfTUFTSykKPj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4+Pj4+Pgo+Pj4+Pj4gLyogc25pcCAqLwo+Pj4+Pj4KPj4+Pj4+ICAgwqDCoMKg
wqDCoMKgwqDCoCBzYWRkciAvPSBBTURHUFVfR1BVX1BBR0VfU0laRTsKPj4+Pj4+ICAgwqDCoMKg
wqDCoMKgwqDCoCBlYWRkciAvPSBBTURHUFVfR1BVX1BBR0VfU0laRTsKPj4+Pj4+Cj4+Pj4+PiAv
KiBzbmlwICovCj4+Pj4+Pgo+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgIG1hcHBpbmctPnN0YXJ0
ID0gc2FkZHI7Cj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgbWFwcGluZy0+bGFzdCA9IGVhZGRy
Owo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBJZiB3ZSByZWFsbHkgd2FudCB0byBlbnN1cmUgKG1hcHBp
bmctPmxhc3QgLSBtYXBwaW5nLT5zdGFydCArIDEpICUKPj4+Pj4+IEFNREdQVV9HUFVfUEFHRVNf
SU5fQ1BVX1BBR0UgPT0gMCwgdGhlbiB3ZSBzaG91bGQgcmVwbGFjZQo+Pj4+Pj4gIkFNREdQVV9H
UFVfUEFHRV9NQVNLIgo+Pj4+Pj4gaW4gInZhbGlkYXRlIHRoZSBwYXJhbWV0ZXJzIiB3aXRoICJQ
QUdFX01BU0siLgo+Pj4gSXQgc2hvdWxkIGJlICJ+UEFHRV9NQVNLIiwgIlBBR0VfTUFTSyIgaGFz
IGFuIG9wcG9zaXRlIGNvbnZlbnRpb24gb2YKPj4+ICJBTURHUFVfR1BVX1BBR0VfTUFTSyIgOigu
Cj4+Pgo+Pj4+PiBZZWFoLCBnb29kIHBvaW50Lgo+Pj4+Pgo+Pj4+Pj4gSSB0cmllZCBpdCBhbmQg
aXQgYnJva2UgdXNlcnNwYWNlOiBYb3JnIHN0YXJ0dXAgZmFpbHMgd2l0aCBFSU5WQUwgd2l0aAo+
Pj4+Pj4gdGhpcwo+Pj4+Pj4gY2hhbmdlLgo+Pj4+PiBXZWxsIGluIHRoZW9yeSBpdCBpcyBwb3Nz
aWJsZSB0aGF0IHdlIGFsd2F5cyBmaWxsIHRoZSBHUFVWTSBvbiBhIDRrCj4+Pj4+IGJhc2lzIHdo
aWxlIHRoZSBuYXRpdmUgcGFnZSBzaXplIG9mIHRoZSBDUFUgaXMgbGFyZ2VyLiBMZXQgbWUgZG91
YmxlCj4+Pj4+IGNoZWNrIHRoZSBjb2RlLgo+Pj4gT24gbXkgcGxhdGZvcm0sIHRoZXJlIGFyZSB0
d28gaXNzdWVzIGJvdGggY2F1c2luZyB0aGUgVk0gY29ycnVwdGlvbi4gIE9uZSBpcwo+Pj4gZml4
ZWQgYnkgYWdkNWYvbGludXhAZmUwMDFlNy4KPj4gV2hhdCBpcyBmZTAwMWU3PyBBIGNvbW1pdCBp
ZD8gSWYgeWVzIHRoZW4gdGhhdCBpcyB0byBzaG9ydCBhbmQgSSBjYW4ndAo+PiBmaW5kIGl0Lgo+
IGl0J3MgYSBnaXRsYWIgc2hvcnRjdXQgZm9yCj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZyUyRmFnZDVmJTJGbGludXglMkYtJTJGY29tbWl0JTJGZmUwMDFlNzBhNTVkMDM3ODMyODYx
MmJlMWZkYzNhYmZjNjhiOWNjYyZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0
MGFtZC5jb20lN0NkMTZkMTIzYWFhMDE0MjBlYmQwODA4ZDhmMzdiYmYyZiU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1MjcwNjA4MTIyNzg1MzYlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9NXJGVkx4U1JuZkhV
R2pob2lxeDFlNlNlUk9xYmc0WlBlZiUyQnhFdmd2JTJCVGclM0QmYW1wO3Jlc2VydmVkPTAKCkFo
ISBZZXMgSSB3b3VsZCBleHBlY3QgdGhhdCB0aGlzIHBhdGNoIGlzIGZpeGluZyBzb21ldGhpbmcg
aW4gdGhpcyB1c2UgY2FzZS4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+Cj4gCQlEYW4KPj4+ICAg
ICBBbm90aGVyIGlzIGluIE1lc2EgZnJvbSB1c2Vyc3BhY2U6ICBpdCB1c2VzCj4+PiBgZGV2X2lu
Zm8tPmdhcnRfcGFnZV9zaXplYCBhcyB0aGUgYWxpZ25tZW50LCBidXQgdGhlIGtlcm5lbCBBTURH
UFUgZHJpdmVyCj4+PiBleHBlY3RzIGl0IHRvIHVzZSBgZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVz
c19hbGlnbm1lbnRgLgo+PiBNaG0sIGxvb2tpbmcgYXQgdGhlIGtlcm5lbCBjb2RlIEkgd291bGQg
cmF0aGVyIHNheSBNZXNhIGlzIGNvcnJlY3QgYW5kCj4+IHRoZSBrZXJuZWwgZHJpdmVyIGlzIGJy
b2tlbi4KPj4KPj4gVGhlIGdhcnRfcGFnZV9zaXplIGlzIGxpbWl0ZWQgYnkgdGhlIENQVSBwYWdl
IHNpemUsIGJ1dCB0aGUKPj4gdmlydHVhbF9hZGRyZXNzX2FsaWdubWVudCBpc24ndC4KPj4KPj4+
IElmIHdlIGNhbiBtYWtlIHRoZSBjaGFuZ2UgdG8gZmlsbCB0aGUgR1BVVk0gb24gYSA0ayBiYXNp
cywgd2UgY2FuIGZpeCB0aGlzIGlzc3VlCj4+PiBhbmQgbWFrZSB2aXJ0dWFsX2FkZHJlc3NfYWxp
Z25tZW50ID0gNEsuICBPdGhlcndpc2UsIHdlIHNob3VsZCBmb3J0aWZ5IHRoZQo+Pj4gcGFyYW1l
dGVyIHZhbGlkYXRpb24sIGNoYW5naW5nICJBTURHUFVfR1BVX1BBR0VfTUFTSyIgdG8gIn5QQUdF
X01BU0siLiAgVGhlbiB0aGUKPj4+IHVzZXJzcGFjZSB3aWxsIGp1c3QgZ2V0IGFuIEVJTlZBTCwg
aW5zdGVhZCBvZiBhIHNsaWVudCBWTSBjb3JydXB0aW9uLiAgQW5kCj4+PiBzb21lb25lIHNob3Vs
ZCB0ZWxsIE1lc2EgZGV2ZWxvcGVycyB0byBmaXggdGhlIGNvZGUgaW4gdGhpcyBjYXNlLgo+PiBJ
IHJhdGhlciBzZWUgdGhpcyBhcyBhIGtlcm5lbCBidWcuIENhbiB5b3UgdGVzdCBpZiB0aGlzIGNv
ZGUgZnJhZ21lbnQKPj4gZml4ZXMgeW91ciBpc3N1ZToKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+PiBpbmRleCA2NGJlYjMzOTk2MDQuLmUxMjYwYjUxN2Ux
YiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+PiBAQCAt
NzgwLDcgKzc4MCw3IEBAIGludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkCj4+ICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCj4+ICAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQgPQo+PiBtYXgoKGludClQQUdF
X1NJWkUsIEFNREdQVV9HUFVfUEFHRV9TSVpFKTsKPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X2luZm8tPnB0ZV9mcmFnbWVudF9zaXplID0gKDEgPDwKPj4gYWRldi0+dm1f
bWFuYWdlci5mcmFnbWVudF9zaXplKSAqIEFNREdQVV9HUFVfUEFHRV9TSVpFOwo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+Z2FydF9wYWdlX3NpemUgPSBBTURHUFVf
R1BVX1BBR0VfU0laRTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8t
PmdhcnRfcGFnZV9zaXplID0KPj4gZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQ7
Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5jdV9hY3RpdmVf
bnVtYmVyID0gYWRldi0+Z2Z4LmN1X2luZm8ubnVtYmVyOwo+PiAgIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+Y3VfYW9fbWFzayA9IGFkZXYtPmdmeC5jdV9pbmZvLmFv
X2N1X21hc2s7Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5j
ZV9yYW1fc2l6ZSA9IGFkZXYtPmdmeC5jZV9yYW1fc2l6ZTsKPj4KPj4KPj4gVGhhbmtzLAo+PiBD
aHJpc3RpYW4uCj4+Cj4+PiAtLQo+Pj4gWGkgUnVveWFvIDx4cnkxMTFAbWVuZ3lhbjEyMjMud2Fu
Zz4KPj4+IFNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFu
IFVuaXZlcnNpdHkKPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
