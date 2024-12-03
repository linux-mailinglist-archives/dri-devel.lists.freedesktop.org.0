Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07919E27BA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B0E10EAA9;
	Tue,  3 Dec 2024 16:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WrOBkBYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856610EA9A;
 Tue,  3 Dec 2024 16:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWrbkwoX4ieSL/pka4f1v9QhtjsbTCLF8ew9tEDzSypEw9koMiXXSjINvfGIaYeacvk3lg45Qh37EOEEcatibnh1/aLt1GIVP7s563MQR92fqsYRI25NUjUZSdXSM0vWM5vf+ryELiE9bCt66Azpm0ut6qjs/j5QNJ6by02DwBOq3Vtl+dBE39YaCCFS8GYvKjYB2WXMixrf7xhFngqwG63p6jWUUCr0TVZaF8AfQ0E+iKQ/2XrwJmQnpyIgEtVVFPAhNnuGNP7zEvR2TNeuGQMU+L+lrK4KHF2OQeDXc+6GrrmDRcLqS7EQtu0zp++XCuJsc18dqBYHq1CJ/NjM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlXPj5Dx/EVBA0KZeg+684YIX0iYwGnUCgAILDnoDNg=;
 b=p/m9YuxeDT4jd+fIjwdrKujGwSiwXJl3Dfh83MQlXL+lWNGICx1UrwJ0Y3WN2pM3nM0eX2prz5CxFopcYtWpZ3OwH75q8gHHcSBEBS70r0op9x0u36Ji1cYbP/HGtM4VRf4r321q4bbL948IQmF9t79LQlRTi5UEZNoXiDrK6rYTa4mQDmmhM8G9P7PxbMaukaZsk0AbtqBJNZWM0yvJKt0UcYNX1Sfu67ud/JsnDsvQXFqzwhnvnV6kCZghBjgy3ylNpklhGhTBJXNyhY+/kjeZBE9GmwgzgeE0IyYbec8hln1nGuBe2nFHP+1GmNSyclgtA94NrypTPAiOBF/QEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlXPj5Dx/EVBA0KZeg+684YIX0iYwGnUCgAILDnoDNg=;
 b=WrOBkBYi7ojQ3yTKo2hpOPB2+OjCIJAPZYz4L0HPq/U0EtHBwyJ2fzuvIPhrFx8EKWkFm8pzqU3GBAWOzGFY67rMf+hrxkOMZPsB7qC1oL9B50Lk4+RIckujSu3bq96dYKZ9NZdBZ/UjttWkZjUT4IY9GZUuBL4DUmayFClti4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Tue, 3 Dec
 2024 16:39:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:39:52 +0000
Message-ID: <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
Date: Tue, 3 Dec 2024 17:39:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9fdb8c-7ce1-4b57-3fee-08dd13b91c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTg4dnN3UHYwUndCWXBxdm43QmhtL0Z4SGx1bmR4Tit5ampxQk9rb2xFbmlJ?=
 =?utf-8?B?bWxFQ2JYTU5nQURZRTQ4eWxSRjRZTXExWituMmRabDFSRVE2T1h3NFFRRGhp?=
 =?utf-8?B?b3FadE1kbGFHRmpGV1ZtYzdUWk9LS0dpRUp2bEk5MUhKeUduMGhnZDhmODZZ?=
 =?utf-8?B?UEhnMXNuTzg4ZkYyYXZNQ1VmZGRTV1NyaFJobjVzaXp4b2IraUd4dFl1TVdW?=
 =?utf-8?B?OHpndWpYcHc3WHdQSCtnbGIzdlYwd1huZE90NWxFeHJOckdJTjg4MUN3V0tn?=
 =?utf-8?B?bjdtbE83cmU2UHJvZCtmSkRRbnFEa3RldzYyTU10bXJrSXVFRFArek14akZj?=
 =?utf-8?B?UlJOQnZnNlBtQ3k0eE50c041NEkrbnlKam1uUU5QazVaMThROGRNaGlCOGQx?=
 =?utf-8?B?N256c0J6bE4zbTBlQU8zWVg3WStRNndWMnY0ZzAxY3o1YmJkRTA5WHh2WWV6?=
 =?utf-8?B?OGRnME1rL3FSQ0dsOEhzRHByeVFvMllqZnJSSnJlY3QvRlgwMVJ3QnovU1Jl?=
 =?utf-8?B?dlVPUHpnUjNBcmU4elJvcE9rRnRJRDREanJoR3JlM2tqVXRRNDBlRksxNlNm?=
 =?utf-8?B?MFRYWUF1eHdSMWNUd3NDbGdVS1NpTTVIV3JOSXFXOFFid291VERsVzFuYko0?=
 =?utf-8?B?bmpLYTFjRGgzVElES2lVekg4OXdiS3hKUTFMTEpwQm5kbG5yT0hlUitDQmtS?=
 =?utf-8?B?dy9zQUpZYzVrTHc1bVM3LzF4bEhrbE5ITFBvcUJqU29lYko0dkk2WWd0QWl6?=
 =?utf-8?B?enhVMWp0TlR4cmV3eitSOS90N0ZCUVJMbEg1RW0yOTdlNUdkNC9XRE1RWFQz?=
 =?utf-8?B?ZlpMYWoyZXNiaVlzelUxV3k1ZXlpT3A1SCtiQnk1NEI3SDFzbHdJcTNTTzlu?=
 =?utf-8?B?WERzVDdCOTd4Y3BTT0JsWUVvVXlJMFFuZ0ZjdkZBSUprRVYrNiszb3N4dFZr?=
 =?utf-8?B?RmR6emk0bWJadGZnZVE3MStvZHNBOVBKc1M0azVObDByWE80REdkMklVZG5r?=
 =?utf-8?B?UDhzVW94VjJZSTA2eDdJTzBXNmhSbWQzdFp0eHVjcURsZ2ptOFNnak5tSUhZ?=
 =?utf-8?B?cE8zZ2k2UmFlUWo5WkZRcitvWnFHK3ZhVVQ3dkViVVFBcXA4NnRSQnBvc1hp?=
 =?utf-8?B?U2JMektWUFBhU00vZDJYSm1Kb3M4eGJRNnd2RTRueFBNK2QzS3hmZU8vZkpX?=
 =?utf-8?B?QjZCbytCNzU0TGtDS1BmUFJZeXRHeUV5ZHhWK3U3RUp0a1VTUFIwWWZjYjUv?=
 =?utf-8?B?NGQ1TWRJbW54U2hBZk5xT0IxTTN2RjRRdGZNTHpYRmpDQnh2UTBqQUw4WHhq?=
 =?utf-8?B?emR0b2l0bmNLa0xqWTUxbXYxN0dKWEtyQ2Ywb1RqVHRHc29XdlU5N1VYbzFQ?=
 =?utf-8?B?dXU0YUUxRWVCd0ZZdUFOM3M4SDNyMXlvY3JDbUl6MEtBR1I4YWJiTkhqLzhv?=
 =?utf-8?B?YWNYTmpSaUdPeWtwb1AyeU80b090ek56TS9EN2xvTGkrazZiUEIyMEE2aDVR?=
 =?utf-8?B?aTIrMzBQZ2lrWU5lb1lsaTFNZXY0Z05xNUE1Zk10VzJrbjcrckRYd3dVdFE0?=
 =?utf-8?B?cFFVbkNRWG5Wam0zNFZDK2tRU0U5NUdMTTg5dm05K3JweXVQcUZHdDYyOU0r?=
 =?utf-8?B?VTBTYm9zcDBOcklwT0tZQ2VIckRIallRckZ6Q1dqN1NMV3ZBS3cxR1dPZElE?=
 =?utf-8?B?bjIrZlNsajVvZEx2K1Q2TTE4UTlzUkZoc0lIRGVZTmpoUVBlalV4ZC9POFJN?=
 =?utf-8?B?QUNobUpaZEdTVWNNQkw2YTErRjI1eVlIUC9vaFFROE9aMnJxRnVNSzN6SFN6?=
 =?utf-8?B?bXVESnFGdWhKSU5CL2VEdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVMTExqSEYwc2c1RFJ3NFp0VWZoajdKQlVFQXRyNUxQQ0MyV1NWbEZCS3Bj?=
 =?utf-8?B?Y0dkbVhiMTUrTjV6dzZNeVBIcGlxWkFuNm9RZHo0TVZTYXlvemVpcXRHQkpK?=
 =?utf-8?B?bFhmL3lyOVNpYWZpaUJxWWpSVndBUzNsN1B1cXBRZWxZTFNGb2h1dFk1MC9V?=
 =?utf-8?B?OEhwTCs0NzB6RUpHLy9nSHlWRHkydStNZEdHdTBxKzEwTFowaXE3bVJSemZk?=
 =?utf-8?B?SGJPYURiekxvdGJ0M0JVcmlWYnllUTBRRnhBRlpBcEtESzJQMFBYQ1EwRC9o?=
 =?utf-8?B?RkpBYm9EUDBvYVlxOEhZdngrREQzN3R5S1pYRTNOZFR2cDNaYU1rYk9KYTBV?=
 =?utf-8?B?eXJ0L2RrU0h2dDc1THM1UGNYNE1Fdmo3VXdHMmJaaFFyTVBrOG9oeW1ycmp6?=
 =?utf-8?B?Zmc3NXpuOW5NY3dVVlpvWUZadnNXeTNKT0lDTDZqeGJQeXdKRkRrTFdKUUxM?=
 =?utf-8?B?SjMzMFFPc050cEZoREFsY1cvZEo4bUJ5b3grb00yY0hTdS9Ia2NJdlFoOWJu?=
 =?utf-8?B?cnZTbDNTNzNDQm0rSzJUZlVQV09ORUF3OUtpS0tsZlpKaHdYenl1TTFUdHkv?=
 =?utf-8?B?YmRGOWY5RmVNRFQ4RWVNbzI0OWVnQUZ1WnBjQklwOERHWHJ0YnU3RDJpSHJh?=
 =?utf-8?B?OWpnTGNuWWpzZHNxNjh2Q2x5T1ZFelpIR3dEWklBVTJhY05pajFqNzN5R1Vn?=
 =?utf-8?B?MlpKczV2ZTdoamEvTE9NeU1wMmJ6d2t4TGpGMENJYzVQV2kwRlcrVkt2bTMz?=
 =?utf-8?B?YjNyeURhOTk2eHJMRk1aKy9jTlUxcTZ6RHRXYVNncmRrbWtDNG5NbVgvcWhQ?=
 =?utf-8?B?TUJYU3hEa2llSUV6amR1NmVCVzRXOTVLUllGeHJKVjhzNjRmLzJoNnY4RUJk?=
 =?utf-8?B?dFZaT0dMQ01UKy9sNThzbGh0SmRLRnNyUlVPaFNBOExIOE5xd3BLenFvZW1D?=
 =?utf-8?B?YUcvb04rOUVZT3dTeUNUUGxWWEgyaUIvWTRQWm9yS3VTZzBuOC92OSs1WjNN?=
 =?utf-8?B?MjFEdDF3LzJKN2pnUzI3YzdUYUR1UTNvdGNYZzVxbEd4V2FEVE5BdmpBSTZR?=
 =?utf-8?B?WWk2VTVVVHhuSVo0YU91Y0VNOUZ6Zm9PTDFnUW9MUEY0dkxueEg5dXcwV0lM?=
 =?utf-8?B?Q0NZMFhTRTV0YkZPMDMzYTRHd0h4ajJTaHJCSFVBY014TUtzMFg5clE5aEVZ?=
 =?utf-8?B?Tjl6cGh4OWtzR0s0alRqT3cxMDlTUEl0a1BkMzc4NWZVTlFjK0Y0dzhGdTFN?=
 =?utf-8?B?T0kwalRwUktwN0w4c05zS01xL2h4SGxsZ0ZtTVpjQmRiUDNkVmxVV2ptQSty?=
 =?utf-8?B?bkc3WXdkY0NQTzZIRTgwS21mRDcwNi9TWnJMbHJUZDlEK1hidE5xZ1hOa2NT?=
 =?utf-8?B?YUJFbkdkK2hxZUFpbXV2L1lhZUtXN0pYUlFVVmE5SEhWeDd3bHA4RHNIYklB?=
 =?utf-8?B?V2hudjNmQ1YxUTRtaFpoV2hUbnkxbEw1THRpUmZCRWhxZ3pmVXRSUVpnWkJL?=
 =?utf-8?B?b1VCaFhraGpaaWI1UjNMWWRjaVgxNXZvN3lja0FvSmF5TElNeFZyL2RQVFJL?=
 =?utf-8?B?aXJXOEVuNFBTOXNwQ0tjWWVWL0RBZDZnMHBRNzlicmhudzdlZndxZVpaM2ho?=
 =?utf-8?B?LzVOU3FGT3J4VXBJMDJKN3Y3eGc1OTVnZGhzRzY5VlFFYVdERGNNbXYvUlA5?=
 =?utf-8?B?U25jRHJPa3RUbG5qcGdveldRVExaZUdHbVpZS3dRR1JTcER4OG9DeHF2bXQv?=
 =?utf-8?B?WGRZVTQwcmJxWnNTRDMyOHh5bjcwL05LYWxDWDMyZGV3cEtSTFVOMXAvdmlr?=
 =?utf-8?B?ZmZTQVRESEVjcC9ld1dEWWpBS3c0ZSs3YTBTb1FPc1VSbko2NWp0TDVQTjUz?=
 =?utf-8?B?eG9ranYxa2s0Q0tja1VmM3B4aFdiZzFKUWlNaG4yYUZCbEdBUWRqSXJZU2Yz?=
 =?utf-8?B?YzY4L0VBTDBidWpiMzM3ZTdUSnBRbC9kcE8ya1hscWEwTmJlb3htOGJmN3Np?=
 =?utf-8?B?VmlTTi81WUkxcTk0cTJWUWo3MmFzZHBxWmhwVUluQnFYVWdTM1pXSWlONXYw?=
 =?utf-8?B?dDVTOUhsMU5IOEhRSWVyQm5CZmp1a21HQ1gyaStoV2s1UkFnUFdtNUFWd3Zk?=
 =?utf-8?Q?Ax8knWsy2sZm0cC4VFCFwsidz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9fdb8c-7ce1-4b57-3fee-08dd13b91c12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:39:52.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI2mjAGC08pXr2XX3XVSV53XSkDS479PWoNqcbwNIqj+LqiBystmGgYFyl9o2Jo6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
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

Am 03.12.24 um 17:31 schrieb Thomas Hellström:
> On Tue, 2024-12-03 at 17:20 +0100, Christian König wrote:
>> [SNIP]
>>>>>>> @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool
>>>>>>> *pool,
>>>>>>> struct ttm_tt *tt,
>>>>>>>      	else
>>>>>>>      		gfp_flags |= GFP_HIGHUSER;
>>>>>>>      
>>>>>>> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER,
>>>>>>> __fls(num_pages));
>>>>>>> -	     num_pages;
>>>>>>> -	     order = min_t(unsigned int, order,
>>>>>>> __fls(num_pages)))
>>>>>>> {
>>>>>>> +	order = min_t(unsigned int, MAX_PAGE_ORDER,
>>>>>>> __fls(num_pages));
>>>>>>> +
>>>>>>> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
>>>>>>> +		if (!tt->restore) {
>>>>>>> +			gfp_t gfp = GFP_KERNEL |
>>>>>>> __GFP_NOWARN;
>>>>>>> +
>>>>>>> +			if (ctx->gfp_retry_mayfail)
>>>>>>> +				gfp |=
>>>>>>> __GFP_RETRY_MAYFAIL;
>>>>>>> +
>>>>>>> +			tt->restore =
>>>>>>> +				kvzalloc(struct_size(tt-
>>>>>>>> restore,
>>>>>>> old_pages,
>>>>>>> +						
>>>>>>> (size_t)1
>>>>>>> <<
>>>>>>> order), gfp);
>>>>>>> +			if (!tt->restore)
>>>>>>> +				return -ENOMEM;
>>>>>>> +		} else if (ttm_pool_restore_valid(tt-
>>>>>>>> restore)) {
>>>>>>> +			struct ttm_pool_tt_restore
>>>>>>> *restore =
>>>>>>> tt-
>>>>>>>> restore;
>>>>>>> +
>>>>>>> +			num_pages -= restore-
>>>>>>>> alloced_pages;
>>>>>>> +			order = min_t(unsigned int, order,
>>>>>>> __fls(num_pages));
>>>>>>> +			pages += restore->alloced_pages;
>>>>>>> +			r = ttm_pool_restore_tt(restore,
>>>>>>> tt-
>>>>>>>> backup, ctx);
>>>>>>> +			if (r)
>>>>>>> +				return r;
>>>>>>> +			caching = restore->caching_divide;
>>>>>>> +		}
>>>>>>> +
>>>>>>> +		tt->restore->pool = pool;
>>>>>>> +	}
>>>>>> Hui? Why is that part of the allocation function now?
>>>>>>
>>>>>> At bare minimum I would expect that this is a new function.
>>>>> It's because we now have partially backed up tts, so the
>>>>> restore is
>>>>> interleaved on a per-page basis, replacing the backup handles
>>>>> with
>>>>> page-pointers. I'll see if I can separate out at least the
>>>>> initialization here.
>>>> Yeah, that kind of makes sense.
>>>>
>>>> My expectation was just that we now have explicit
>>>> ttm_pool_swapout()
>>>> and
>>>> ttm_pool_swapin() functions.
>>> I fully understand, although in the allocation step, that would
>>> also
>>> increase the memory pressure since we might momentarily have twice
>>> the
>>> bo-size allocated, if the shmem object was never swapped out, and
>>> we
>>> don't want to unnecessarily risc OOM at recover time, although that
>>> should be a recoverable situation now. If the OOM receiver can free
>>> up
>>> system memory resources they can could potentially restart the
>>> recover.
>> What I meant was more that we have ttm_pool_swapout() which does a
>> mix
>> of moving each page to a swap backend and freeing one by one.
>>
>> And ttm_pool_swapin() which allocates a bit of memory (usually one
>> huge
>> page) and then copies the content back in from the swap backend.
>>
>> Alternatively we could rename ttm_pool_alloc() into something like
>> ttm_pool_populate() and ttm_pool_free() into ttm_pool_unpopulate(),
>> but
>> those names are not very descriptive either.
>>
>> It's just that we now do a bit more than just alloc and free in those
>> functions, so the naming doesn't really match that well any more.
> So what about ttm_pool_alloc() and ttm_pool_recover/swapin(), both
> pointing to the same code, but _alloc() asserts that the tt isn't
> backed up?
>
> That would give a clean interface at least.

More or less ok. I would just put figuring out the gfp flags and the 
stuff inside the for (order... loop into separate functions. And then 
remove the if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) from the pool.

In other words you trigger the back restore by calling a different 
function than the allocation one.

>
> For a renaming change that touch all TTM drivers, I'd rather put that
> as a last patch since getting acks for that from all TTM driver
> maintainers seems like a hopeless undertaking.

Yeah the acks are not the problem, merging it through the xe tree would be.

Christian.


>
> /Thomas
>
>
>
>
>> Christian.
>>
>>> /Thomas

