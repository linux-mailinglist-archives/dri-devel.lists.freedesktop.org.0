Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D7ADAEC6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F06610E339;
	Mon, 16 Jun 2025 11:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cz95459N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6710E339
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuYUBXvrvn/XilmIe8NYkD+JQJPghsBgdPvhu/SFtvSIu+2DQM81+soYrPWwbiAv1n+tMLrA+k6toWBYdxbJWXJTs2/EdPyMUt60nKl5pSZ18Omjy2oXWBNHFIfeOGz5QH0a/LdNJxRxvphJs57iKUL+LnS2hR4PdLJcEVelBzTZ3B/i47NpCTv/UlkkQTGB0oBSK2Tn4O5zNe7fVU4Jk957VMr0BVHWyjs7URjseK+qntpQImkLhQiMLxU/UueQIjdTGKNogZJN+IGktsdhB5HtC67955TDOQqYfn6MjjXmEbo0F1+3KG0xLhsn4h2QIxHteQglx2KWX03j192WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj4AV9CoXsCdpVWG8I6um3WVGz02a3znAIUbnFHNbkc=;
 b=cDIg2nWQzaYOY1DhpsXdlRQsx0WICUu01Bo7jHLMvur7m3TCpCxOxq9R5EGntIWrvWajunRkAbA3g+hNNIgvDUsT/jordkXc2pPTQnq6h8PJl4ChVw36yRVlHHPNMa8eAFUBHbF9Yvz1kbA2Vb7Fxhfv9AX+71BflYgjBArxJpBFjFXTxk4HrjatbQqu/F+2/Nm6PBvZqlncifTr+m6yXzP0JS8FXrNenyS9j77l63vmlit50zGKFFvfAqN8JeHG57xRojVJrluGNX5qcGOTgUkF4AUFVNnnfeFHtoCPV/yW1LUuQ5DcPXyFF3jxJm1Kck1jE2K7T542fMk1DtKkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj4AV9CoXsCdpVWG8I6um3WVGz02a3znAIUbnFHNbkc=;
 b=cz95459N3rOI4dQk0UDF7njORee1tAzLZzPzfBDXsnUidx0j8zCeqQRQRY5jqfWcrFJZK7HJJrDE+4XSM4gUk4MqBMyNAg3y+3nW7KgIHKURp1nDMT3N/gMc27NM/euhAZAE6fxPvBSoykXzgfWmQ0WCPG7eZjzcH5gzPc9ClVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9446.namprd12.prod.outlook.com (2603:10b6:8:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 11:38:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 11:38:22 +0000
Message-ID: <28ef7ee3-0f02-4609-bb56-926cda563d60@amd.com>
Date: Mon, 16 Jun 2025 13:38:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com,
 tursulin@ursulin.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
 <aEw3IRn565keDO6B@phenom.ffwll.local>
 <26705733-0c24-4f3b-a6ce-d5f2fd8c935d@amd.com>
 <aE_0PLfh3h2IeTun@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aE_0PLfh3h2IeTun@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a186b9-e7d4-436e-319b-08ddacca4c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVhBbkJtNjdYVDBYVmdwdzVwcUgyT2l3YU9vaHQwMXhBSi9vZmJlSTB1NGYz?=
 =?utf-8?B?NnozRlNFb2NieG1pdllwWGRkamMzcGszTjJScnpxblhOL1VvSVZRbmwxOFNm?=
 =?utf-8?B?Wi9FQnZ4cXhSN1YzTHhXTm1LSWNUNXNpS0NJdjBDZGF3RWxWOTlTU09rY29D?=
 =?utf-8?B?K1JvN09FYXAyWTQydWp1Y0ZrdVZHOTBaNTMvVlBDZis4bTFFUHNXbTVraTNS?=
 =?utf-8?B?L1lRSjF2alBPVjZQNzVoWmsvMzZNVHg0cVZka1BvemxhZ3RSSzF6OUlza1hI?=
 =?utf-8?B?KzRrWjZmaFN0aEhUaGJCTHo4eHpsUWo3dmd4MjdnazA4MmxOU3kxc3Y2Uldv?=
 =?utf-8?B?ZlFrTTU1RG9oaUN5eGlISnc0ZWdwVW9UMFkrelY3MmZPSkZ5c1JGZzV0TE9I?=
 =?utf-8?B?Q2NGRXJ1eDVlTjA0UDRodnFTQjRjQ0pqZHlwRFI5dW5BYk1NQUIzMFFVQVFX?=
 =?utf-8?B?cHdrR245cGkrL05VTVFFejNWYzlDckE3TVBSVUZKT2dOYVFrcmxkdnQwTkU0?=
 =?utf-8?B?cnkyekxVZitLOHVBdFQ5LzNwUkZiWlhKOVRsVmtCUkNDZ1JOWCtxMTV0ZlNm?=
 =?utf-8?B?b01ENmpUREVCa3VuZTJOclNFTkRPWkxvaGxWamZJNkJlRHc0eUN5VWhvTVZE?=
 =?utf-8?B?TnJza0Flc29WdEFpbEkwU1ArUTBrVHB2VEJPcXpwR3FsTUp4WDF5RlViVnFO?=
 =?utf-8?B?MkhDRCtGMjk5VVg3QktlRDNRRUdLb3NNVE5kRkdkWHhQa2k3blJQa1dhYnVC?=
 =?utf-8?B?YVBNbW5iSU0wclRjZDJHZWxCN1BDWXFtb3ZhVzJ5NlkxcWxXdExrYjBmMDR2?=
 =?utf-8?B?Z0pvM1ZGZUN1aEdGTDB3UTE4OGpTVndsREdrOVBMb1hNVVgyclpMcWRlSXd3?=
 =?utf-8?B?UzBBU1FWeFVoSy9nU2ZzK3VSQ04wNC82U3pVZThkcEhrcUN1VVhieEswZWlh?=
 =?utf-8?B?SWlSYXRzbmZmNjR6Q3Q5Yis1ZTVETG5NK1RzNE5ObkRhaHdkMmFpeGRiKzNJ?=
 =?utf-8?B?Z1I4aS9Rck9PcU10N1pjTnVaVEE1M1puWGZOK2RXUHdXRHViUnlKOU5WUmda?=
 =?utf-8?B?aitWVjVZaWhCR3ZjaUo2QWxMK1hQd2hqWU5RUFByLzdXV3NQR2VsT3YwRVZt?=
 =?utf-8?B?V2s0T1U1R1pNc20xUTZnNmNkTEt4L0NoSGdHUjNVQlRVQ2hCSlRKYjZhbDd3?=
 =?utf-8?B?M2tObDRpaUppSGVYZllEZW9ZQ3JPclpISFJLZXpJQUNSWSs1U3h5RVNDeWd0?=
 =?utf-8?B?L2RjZk1UbUZYNExscHFxei9SMXd4d1pzUmRXTGYrRUtZMDVpRGgwSFRhQnl2?=
 =?utf-8?B?V3RRaGR5anozbndJUEw0dnlnaEZQUzJwU3JHdmgxK1BlUlBlQXBYQ21XbjJE?=
 =?utf-8?B?TEoyZmpYWUlPV1FqRGV2OTJkeDBjOHpRYkJjMkRrUUFyY3V3czhwQUhNOXY2?=
 =?utf-8?B?dG9zczZpUjliVWUzUHdPREhCNlBHMXMxemp3Rm1pN0xTL2FXeWFIMU15d21u?=
 =?utf-8?B?K2M5RmNjSG5IMG1SUUlkbG5CNlJ3QmNMbjQzL295RnhaNXI0R3pOUk9YRERE?=
 =?utf-8?B?MXVTUTJPcFRsQS9tVUxUZmY5VnFucmdvTzQrMW1mbUZ0SXlZNFltaDdjR2dm?=
 =?utf-8?B?Y0hQcEF3R001NUxVTElCaUUwRXZ5NXFZaDJkK3dlVzNkOXRpdDFEelZKTldO?=
 =?utf-8?B?cHgxVExyU0FYeE5uMTYwbDk5SnJ6S1JzcEk5VWdmOUdSQjNkcUp3bkVjV1JW?=
 =?utf-8?B?V3lNM1Rid0FUQk8rREdISUpsc2w1ZERydFZPZGJiVnROZ1pTUUxBK28zVW1q?=
 =?utf-8?B?ZGpjM2tBRDNhSy9tMHFJY2JFb2UyN3pYS3hTVFBqeVZsSElTQ2Y1d3FSQ2JB?=
 =?utf-8?B?Tk1nSy8vUm1IRUxhYk05aGFzVkVoRnc5MEI1UFZkaEtnNjhoQnZWNU9TRjV4?=
 =?utf-8?Q?Sg2Ccnee44k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pia29RV0Z1VXdQUEQvbkVRK2JMbXRNZTVmZ3VrYVhyNjM0Yzc1ZlFiTlZi?=
 =?utf-8?B?eHgzZDhMVWdheGxMRmNGTW5US1FpbG1PNzN5RFpldXpBazd5MDI1Q0xnekM3?=
 =?utf-8?B?eTlaUXZ0UU1Xemg5SVpPOVRFTXRjM2hmWG4rVjVXVUR6Q0RESVFzbmZ0SG1o?=
 =?utf-8?B?a0EzWFZ2S1FuUmp4aGNQNEdwb3psRXVSSU9jS2dqT25GcHJJMFRHMjkrNzFD?=
 =?utf-8?B?ZGh1dVFwaEE5VGxFbTBLK3NBTTVNbHpPVm0wcnBYcmR2d01KUHpmTGJDalp3?=
 =?utf-8?B?TlFRTlBRUW41aVNxRWxUWnF3K2hiWklWV3loRlAySkNKUGtnR1Q2Ry9Wc2ZM?=
 =?utf-8?B?SE9GN0FmelIvNDNPVkIrdEdDL0JCZlNBbW14bENSdXZ4TlRzT1YvRFF3OHNX?=
 =?utf-8?B?Yy8xOUN4MHNXSk03YTgxVnFDYXVWRzNWMVZkK2FFYkx4SFNrZGtOaWlkVExF?=
 =?utf-8?B?N2dJQW5IcjJiRXNKQlA0a3lmY05LdXEyeXhtOXE4T1ZSWkdJaDcxa2pXVkhH?=
 =?utf-8?B?M2ZhY2tPbit2VUtudE9mNnZNZzVOTjNROVdBaDFKalBwckswUUJ0ZWxRcGVL?=
 =?utf-8?B?NUpRS3ZQUXhTdFNiRUpBeWJ5NzF3dXJBcHdpcU1ROXd1a3VreE1uV0k0K2t4?=
 =?utf-8?B?dWxsQk93emo0UlRrSVlTYk5ldHp5RXdMdmdnK1A1ZmliczRwbFVRRm5nQVNT?=
 =?utf-8?B?bmZoUm51Q3JSdHIyRitGbk82aS9zYVhkb0tmd3R6aGJmV2RibDhJU2RCTmNz?=
 =?utf-8?B?MGx0d1d3K29USWhaNmdqZnZNYWoyTG9DNXhwTHBhMHN0dE85aG81cXkyTldV?=
 =?utf-8?B?MDNCK2JMUFNlMjgzam1COEU5eUhsNlF3M0g5RlRQVHExbkZHR2R2dFpNalZE?=
 =?utf-8?B?Nzl2eVRYa2pIYVZsbWpLVi9BWnlON2dSVHQvMnlXcmx0YlNKc3pDeENtelhR?=
 =?utf-8?B?UTJDbVE5TisrZTJweFVEWW0yUkpPZzB6T1RaL084ZDEwME1CUFd0ZTB6SUY0?=
 =?utf-8?B?TURMS2tEK3lON2lxTlB0TlIwS1N3QllCaWhqQU9tVzl2bDRvdVZ4YlYxbG5i?=
 =?utf-8?B?RHRmTjJmVU5QUE5NdHl1RmJFSVd5aTA4QlRJcVhDN0N5OEtNZG4wOWswWlBG?=
 =?utf-8?B?ZzFNeHZBbkErUXJDRXIraEZ1ejN1cTczbXhlTWJJVHh6emxFQVBWVkdFd210?=
 =?utf-8?B?bzhHckxVYVhDMWtvNmkyOUpHR2hSTjhLK2xaUDJpQkZoZFcrbVV5V0ppVFBQ?=
 =?utf-8?B?eVR3V0pYaUt6eFlBeG9SQ1ZqWFBDeTJuZWs4OEdhNkR0c0xKT0xCaldMYU5s?=
 =?utf-8?B?QnFmcHBmcUpKUUJTUWhIV29uR09QU1VyMC9KUEVYQUkwVHZwbFhOQ28vSkNr?=
 =?utf-8?B?a09PTEFvOXV2ME1QWnBqK0ZRaWE2Zm5ua1dDTmt4UzBmTzc3aDVGa0pZVUtp?=
 =?utf-8?B?ZEt3T2g4dUptMkxGZTRwN0d2bWd2OXdKYUNFYmYvRmNhYW1qMlZDNm93M2pO?=
 =?utf-8?B?a2ZqaURIejYrYlVoeFRodUZNakhTUkpsSnlSQlZKQllWTUNwTVhVRmY2Zllu?=
 =?utf-8?B?ZEp6OHUvTzBid3BpazRuVVJXam1sbHlNMDhvZU5WY3lod2hlVndGcTRmb0ls?=
 =?utf-8?B?UWFkVS9UZkM2WFlpOTVIMUMyWGpJRzlTNHVaM3l6WWJVL2Y4NHJhQUFneUtq?=
 =?utf-8?B?d0d3VWliNER0ME1lc3d1YlFPWU9VOThtUjNsdFU2UGQ1VmFCN0pRSmEyd01B?=
 =?utf-8?B?RENaZ1BmSXVqOXV4dFdLVUpCZnkyek5RQWViVmFhVSsxZ29vU1AyZEo5RDB5?=
 =?utf-8?B?a1hGOTRiSktENkdWSUZrM2pWanNPakI1Z0QrMXhnT0Z5UzgwWGtwMzNMVEhl?=
 =?utf-8?B?dEgxVjhXaS93dXJIZTJ1eXRVSFV6bVFPRGptTjE0bEowa3JtQWVhNUkxRzAv?=
 =?utf-8?B?K0MrSmlRbmZUbG1rWW5nUkpxcnBxKytFQ3JTd3JQSkVuUGFBS0hOeWZ0Q1pS?=
 =?utf-8?B?ZkRvNG9WUUsxOEllY3JKbzZpV3lTT1Y5WGtuZGlBbjlDaFpkRXZVbnhLdnp6?=
 =?utf-8?B?bTY4bFpSL1didkNNVkhZNTc0NVBBTUY2YW42b1pxTXpFRForb1pISU44THZS?=
 =?utf-8?Q?qyyLkl0+HewaJQHZ8E9Vy62l0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a186b9-e7d4-436e-319b-08ddacca4c16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:38:21.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UasGQMcpv/YXQdrIUpQtYq6SnglNPU7687tK6EHXxQ5ELjtuqa6kuXvICZIPV1Dy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9446
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/25 12:38, Simona Vetter wrote:
>> 6. Now FD2HANDLE is called with 10 and here is what happens:
>>
>> 	drm_prime_lookup_buf_by_handle() is called for handle 10, so we
>> 	don't find anything.
>>
>> 	obj->dma_buf is true so we branch into the if and call
>> 	drm_prime_add_buf_handle() with handle 10.
>>
>> Now we have called drm_prime_add_buf_handle() both for handle 8 and
>> handle 10 and so we have both 8 and 10 for the same DMA-buf in our tree.
> 
> So this is the case that broke, and which the various igt prime tests
> actually had testcases for. Unless I'm completely confused here now.
> 
>> So FD2HANDLE could return either 8 or 10 depending on which is looked up
>> first.
>>
>> I'm not 100% sure if that has any bad consequences, but I'm pretty sure
>> that this is not intentional.
>>
>> Should we fix that? If yes than how?
> 
> I dont think there's an issue, all we guarantee is that if you call
> FD2HANDLE or HANDLE2FD, then you get something consistent back. From a
> userspace pov there's two cases:
> 
> 1. We've already seen this buffer, it got handle 8, that's the one we've
> stored in the lookup caches. If you then do GETFB2 you get handle 10,
> which could be confusing. So you do
> 
> 	temp_dmabuf_fd = ioctl(HANDLE2FD, 10);
> 	new_id = ioctl(FD2HANDLE, temp_dmabuf_fd);
> 	close(temp_dma_buf_fd);
> 	ioctl(GEM_CLOSE, 10);
> 
> At this point new_id is 8,

No, exactly that is not guaranteed.

The previous call to HANDLE2FD stored 10 into the lookup cache additionally to 8 with the same dma_buf pointer.

And if you now get 8 or 10 as return from FD2HANDLE depends on how the red/black tree is balanced. It can be that 8 comes first or it can be that 10 comes first because the tree is only sorted by dma_buf pointer and that criteria is identical for both 8 and 10.

As far as I can see this case is not correctly handled.

Regards,
Christian.

 and you already have that in your userspace
> cache, so all is good.
> 
> 2. Userspace doesn't have the buffer already, but it doesn't know that. It
> does the exact dance as above, except this time around it gets back the
> same gem_handle as it got from GETFB2 and knows that it does not have to
> close that handle (since it's the only one), and that it should add that
> handle to the userspace-side dma-buf import/export side.
> 
> It's a bit a contrived dance, but I don't think we have an issue here.
> 
> Cheers, Sima
> 
>>
>> Regards,
>> Christian.
