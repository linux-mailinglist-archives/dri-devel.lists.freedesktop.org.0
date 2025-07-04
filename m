Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3541DAF950D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F04510EA4D;
	Fri,  4 Jul 2025 14:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i1j4g5hq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4210EA4D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:10:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbk7zMnPUn0ifIV8TpD2S2SHmBj5+9yhwEdw1KSFnmcjs3+yJpg3VujMfBQEADGjDhCQdOB7jhfg/odkFoRxe27paGvoMwlHtlajPkzcYeGhCbFRHFHjMhRGKrAoRi+0l4rq0F1/HNyI2dzbqWhoyWRAAtLnu0ILeTBdY1IjgmcPYFAhC1/Nc0XOKctWJg28AbQ2w4TNcQrFBxlF1UOwvtFcCk1d6bZ9chLrhpjI2foCWuYvYxq3uRd/EzoEloe8OTRcOQa1Tz7XzHsbJTuQ5SF8g4e4LlWw02eqpKnrDs/WZROGhn9Po0EEHRWB7kio+JnNGssmgHK9GX5E5CoUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agr+9kRCTqbcar2Wgt4vd0Vt9LqW6qIGD0dmmdF8gro=;
 b=gA2HV/wChMk7QM01Fcy+0kXR8oBBt8USVIPq8H5/JCS8gY9L9ywOKYv257iLGLvwRO55/lTd4GfpV/R2Bck4H5+44ESvkTOo2nyq/yOj9TO0YJKuE9pVAXadewVq1sHxyW+bRUNdy1pQsySNA7xMsq5CAQf2IIo7DaXClIO6aRfQ1eETzKz5cu8Vfe/9Tj1K1uyR0KW2skU4MLOGD86cbaiUULuTjGY5OJIGBsu6PgfniVH37VyqnmNFzed5L4r2H6aaz3T7fHyRL40JmedEnQF710UmSoQhKYVuKtYh5JwWn/30cIFzGXLgUOm06TyC4ATM60yfhukOLfeBy87GeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agr+9kRCTqbcar2Wgt4vd0Vt9LqW6qIGD0dmmdF8gro=;
 b=i1j4g5hqVGkfSOmZCOm9I2VrAlc6i99jrVzSHE7ACxZN6VB/Oifs7OKqHtDx+x0+xRVChBbo+Y1e84r6oxwxzm3qLmWjHEe3LxrQ9IYuVqs7mnoQn9k9AgHLi0e/Ze2cNHblkUxZv19GBzgQToVhMaHCvHLo4b1sAOvmg8I69NU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9419.namprd12.prod.outlook.com (2603:10b6:408:206::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 14:10:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 14:10:12 +0000
Message-ID: <5a8f89a5-54af-48ae-9c51-0079840fab35@amd.com>
Date: Fri, 4 Jul 2025 16:10:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/framebuffer: Acquire internal references on GEM
 handles
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org, Bert Karwatzki <spasswolf@web.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250704085541.28165-1-tzimmermann@suse.de>
 <2be81e33-91f3-49f2-9293-231d48af381c@amd.com>
 <621b4efc-dd71-4eb1-b81a-f0551ef38257@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <621b4efc-dd71-4eb1-b81a-f0551ef38257@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 204f87cd-0ca9-4f2e-113e-08ddbb047e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk5LalZMYUEzVlRrVkEzOXdLbTNMSzNPVmFHQXF5ck4rY3NFWlR1dUZoQlk2?=
 =?utf-8?B?RVR5SU93TGtrK0pIeTlZZ3hlNUdKMy9kWCtMdmZGYVp4WHEwSHBYenhCcWhm?=
 =?utf-8?B?bXhkeElBQmxHUW8zZVBCQUs3TjlncGszczRjeGViaWtyOVg0eUJFRC82RWlx?=
 =?utf-8?B?VXBJbGhGRDdCY0xBMVVEUVlab3BESmVNUytVc1JTeW02OTZNUWR3ZWVsQTA5?=
 =?utf-8?B?b3h6MmpzVTNlaGQ3Z0dwU1QyMGhwblBXR0ErbUhOTWhkWGVsbkVPVXdYL0k3?=
 =?utf-8?B?QUx5S2JHL2FWSVdxWG5US1AzVDhhZ0R0c3plTXVOVGErcG5qWlY0RkZLZVZl?=
 =?utf-8?B?NDNiU2ZXdTJOOXlvNFNqL1FDa3hjZ1h1UXJJeTlTSGQxTzBjVlBpNlJGeG82?=
 =?utf-8?B?d00vRHE4dWdxODhtZXo4c29jQ0g3bnNQejBzb1g2OGt3dHpyS204VEZndzdY?=
 =?utf-8?B?QVhrVHZabWtqdXk0WHRWQXBKbStpNlpEcUtlcEtLS3duQTBCdnQ4b1RPVnNn?=
 =?utf-8?B?am56azJrbXo4bFJPMzY4dnVzOURPMzdQV2Rmck5Iekh4MzJsQ3BIRVBzRjdz?=
 =?utf-8?B?eTA0a1d3UkhZWTZqZFBRMXlzdis4Y0tUc2M0REhaSGduNW0zek4yQjZGQS9N?=
 =?utf-8?B?MDNsOEg3bzhGWjBib0h3TlF0K2pKVXJTeVZEb1ZuaEgzZXpDRlN1VW12TmJC?=
 =?utf-8?B?Si9PajBXOUl3clRnWFpqaTFtd3pxekdERTljL010bnpUR3M3MDBhT3gyajRz?=
 =?utf-8?B?K2pYNDJOZ0xuZUhLbW9Vck1SNHJqc0JUaTlVNms1UEQ2VlBPcTZEOE9NR3ZP?=
 =?utf-8?B?MDBNa0FNclRzd05TR1hVL1RlNFlreVYxZGZKTmJqVjAwTFM4MHFrSFRNQjV1?=
 =?utf-8?B?Y3pUOWt0ck5qV0hnMFNqS1dDazJjQmZYbzA0Nmk3TXdzNjJoVWtsVWwvb3Aw?=
 =?utf-8?B?Y0J4bElHZVpBVVRYSkhhTTErTWF4TUhGeldGME5CR2dwdjcxVkpCZWs3WHJr?=
 =?utf-8?B?U0F5ZnZ1YWJmNzBtdld4VWhRRys0ZUpEWlFyNFBxWjJuWUgwYTdqSkpJelhQ?=
 =?utf-8?B?S1o2eUxvMlNnUzU0UVBSbktGN3BkOEc4cENvVS9UbHJFUlgxSEtZOXA3R2pJ?=
 =?utf-8?B?a01uQ0pGWm5SRW1UYkV0bGNnMXB3akdoOTQxZ2NhZDVIL0k3bzd5eTBaNW4y?=
 =?utf-8?B?R2hGSVEyU0NMbmEwalRYaXZwcTBHclZsOG1SZkRHVTdkYU1BN3doelBrSHY4?=
 =?utf-8?B?VHhMeU9OOHMwbXAyc2JXeDFDSXJ2TWNoajF0dFpBN0pPZ21ReGdmNml2cURj?=
 =?utf-8?B?NUVPUlkza0JQM21yUXd3L0hmZ2hQaXJvcW5INjNvWnh5YVZOTTd6Z2lpYVRv?=
 =?utf-8?B?RnFSZVM3QjdqNlV1c3VSTG5ueHJtbTU5cnhZcWdTMHpzL0pwa2F1OEpmSHJJ?=
 =?utf-8?B?QXBPd0lRVGhaTm15UHdaanNQb092d2RuKy91b1NtY3VGSC93WTlDU0tjL1k5?=
 =?utf-8?B?WkRjSzRHQXJHL2dDUEJpMGpNaFBpNFhJZWkvTXNlelZMRFR6MVlxZDJ0SkpS?=
 =?utf-8?B?QnFWWVkxemx5WU5VbElFS2hnYWhGT1pibGt3elNpZDh5bWh2OU96VDZ3SG15?=
 =?utf-8?B?OHJOK29sWEt5czBQK0pSSlJkYXJzWU55RjdseEdRLzJFVlM2Y2Z5bCs1SmJv?=
 =?utf-8?B?dkl1UEJwWExPTEdDbm0zYUpoT2liUnF0M3dubVp6MGlNUDZOTkFJTnNlOGd5?=
 =?utf-8?B?ZmpsOVZjd0RjSGh5REI4TWJqNWNKREo1NHNlZFducmEvOCtRN1NoSDJrZ01n?=
 =?utf-8?B?NXdrUE9uYmFtZjlzR01KRzhpeTV2TWcwUXlJUFRxOUQwWjNiVXJGN0hKNysw?=
 =?utf-8?B?VzBnZ3JiVGpqUTB6R2dtRFJ0VHViYmU0N1ZpdUdNc25iVlgrLzliQm55aGRS?=
 =?utf-8?Q?eL5wDr+uNf8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVF1b0xJdSs2Z0FrdVVqcTB4QTZpQ2lYaXlaWjZOUjQ1Rml1dzd3M1Y3aFJ6?=
 =?utf-8?B?RWRsRFBETURBNGFzU2g0SHRGbUZna3pCK2VVSVlnVHdZVm9YeVdYa1hXZVRI?=
 =?utf-8?B?SG14MzVXZkVIYkNOM0pTZkZWaFBPa2Jkb2p2akZTd3liZ3ZvOHRia0wxbWpQ?=
 =?utf-8?B?Y2k5RE1rcDQ3VHYwV1U5S0hocXd6QmJkb2FMZDZNcDlCcWRKV01FbFc2QXVI?=
 =?utf-8?B?bzVSYmtSSGFMZnU3dkJsem9RajdPS0pKcU93SlpDcHZpRVJLVWlSUFo2T3ll?=
 =?utf-8?B?Um9vUzdBY291R0dJRGUybW9aQVFhQm5FQXNoa293dzI1bGxXdGM5b3F4cS9N?=
 =?utf-8?B?dDlISXlmbzg4S2ZJMDVWbm5OcFVzcWIxRjZTMno2QWw0THdYTGN1ZEsrZEt5?=
 =?utf-8?B?ZEErdUxQYStWWDBJSUwrQlljREtGdzZBMVJHR0dMOWdOQjVwSzRVZTB3QW8z?=
 =?utf-8?B?ZTlGN1lZbG9VUms4RHRsOE0vbnpPSWh1cm1VNFhUUzRrWXhDY2M2QnlDalo3?=
 =?utf-8?B?YzJnL2tOSDRLYVowdWlxN0tkZTZjNEFmYnpaQnRUZVZwL01pZEMvTGxqajVX?=
 =?utf-8?B?emxCNitia2Jha1pXWEtiVUYyQjI5cU1GQ1RCMjNkMXJtTDdrOEJSNVRaOHRI?=
 =?utf-8?B?bkl2L0ppVGI3NlBjQnFhcjZkMFkvdmN2NHVNUHVmeTdXemR6bnprWFJLWnFq?=
 =?utf-8?B?QW5FYmh5Nkc5bjlRMjZ0WEprTVhRa0Y1TkovWUx6b0c2LzZWbjJmOHpFUFZ6?=
 =?utf-8?B?Vml6UENTTUdWZklNd0hOayt6RnFjOFVJT2FRRTBQejNmQUFVSCs0a3cyQWtJ?=
 =?utf-8?B?NzB0M1lqQ1pEOUUyR052S1NqVTJCTDRQV09WRHQxN1FialpHNEorNVhGaUEv?=
 =?utf-8?B?MHlSdUpRRmlMN0k5K1ppZnk0eHdwNlpsWWVjM3hSdTdrczF1WlpaZmV5aStV?=
 =?utf-8?B?a3pEbU40Wmo0OTNnNkpYZnBKVFdLRE9XZXkvOW0ySkpQaXo3S3FSYTMxUDd0?=
 =?utf-8?B?UjVIaUhiTktXWEhXT2szQVBTUkpXeVoydFZCZFFKVnlzcEZzWDRSZU55UkZ4?=
 =?utf-8?B?M2xPNFlCc2NmSGQyZHJ2MFBZbzJjc21JRGtJSFhFNURZR3FjOUVNMkU5SVRy?=
 =?utf-8?B?Sk5Sb2FUMlFZeHBVTStIVEFCNVIyQnQ3Qm5MallKdTkrb1RXWFdYTWg5OFRY?=
 =?utf-8?B?bW9vOWJtK1JLMW5EMGxQZ2RWeTE1RHJLMjMzcnBNZmcrZy9LRkp5K21VdUQx?=
 =?utf-8?B?eXBoKzhvK1hhNzRmTUE2Z29BY3RUM3JFTEQ5NGhkWlk3Ky9SN0J6MTFuM0VV?=
 =?utf-8?B?VTZlYk5mV2RMRVZXVStQMkdqWmtxZjRHQ2c0VmtIMnRyekZPZHdlcFRpemZ4?=
 =?utf-8?B?ZXVvVzROSk5vcGMvZ3E0R3dWb1hURzdjM0kyMDNMWDZ2ODVNR3FiTDQ2U2Ji?=
 =?utf-8?B?L0hBQU1ia1NjS24rTGk4UTZJVlU0T1BnSE9BQ1pQT2MyQXByTzFCMGgxcjMr?=
 =?utf-8?B?TEVyNHByQ2lGcGRaK29HdnVESlNMd1ZjaUdBTTlnWmVVOWFyc1l2QXp1Q3ZB?=
 =?utf-8?B?akdtbitkc2lEUGR0c1lNUzVFZjB1M3VEK1RLWUdhUTZPV2VpQzVURUZzVnpB?=
 =?utf-8?B?N2pIME5MeEJ0U1g0cmJQTTM0amNERFFuZWphbDFjcXAxd2xDSVVoRitSTmVi?=
 =?utf-8?B?VXg1UklxQ3pFZXlMQ3ZMVjhteURjQ2M1UUM4YnRxS09CS2NwdmRRT0g1QXRB?=
 =?utf-8?B?VmQ2UEVOVW1idEdjQ3Y1TTkvMVNjS2RYTUtZYStWcFJoNU9kWENmMkZuZ2ZZ?=
 =?utf-8?B?UTJEMkpCKzRpZ2lHZWlSak1GUTFvTnFFRFJCTnlvRDFWTm41M2VmQkM0dkVP?=
 =?utf-8?B?MHdXMVE3ODFUOThZZFBLM2ROVnZVVkt6OW94NzhtWkFBVEdoY3dkRWRkYVNZ?=
 =?utf-8?B?enZRNDJPcDJXcWFEVlNMWkRUQk95amNzOGluS1pqazJ6MnZodTBMSkhzRktU?=
 =?utf-8?B?TTZZZEJ3Z1F3ZWw4MnplNGFEK1JSOFRUS3E0TnpkNmhBdW01ZFpvRTdtYXdw?=
 =?utf-8?B?UmtPZ3RmSGhSYzlOUTJSbGVteVdXSHBOY1RYVm8zY3BQUGRRR25MRnVuWmNN?=
 =?utf-8?Q?THEg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204f87cd-0ca9-4f2e-113e-08ddbb047e08
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 14:10:12.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qyae3kEpJmPw9PHwMaXNEdLHb1im0fkkcF3bjAUCajtc9Kesf/S2OWcYC7RL5tnw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9419
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

On 04.07.25 14:31, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.07.25 um 14:06 schrieb Christian König:
>> On 04.07.25 10:53, Thomas Zimmermann wrote:
>>> Acquire GEM handles in drm_framebuffer_init() and release them in
>>> the corresponding drm_framebuffer_cleanup(). Ties the handle's
>>> lifetime to the framebuffer. Not all GEM buffer objects have GEM
>>> handles. If not set, no refcounting takes place. This is the case
>>> for some fbdev emulation. This is not a problem as these GEM objects
>>> do not use dma-bufs and drivers will not release them while fbdev
>>> emulation is running.
>>>
>>> As all drivers use drm_framebuffer_init(), they will now all hold
>>> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
>>> references on GEM handles for framebuffers").
>>>
>>> In the GEM framebuffer helpers, restore the original ref counting
>>> on buffer objects. As the helpers for handle refcounting are now
>>> no longer called from outside the DRM core, unexport the symbols.
>>>
>>> Gma500 (unnecessarily) clears the framebuffer's GEM-object pointer
>>> before calling drm_framebuffer_cleanup(). Remove these lines to
>>> make it consistent with the rest of the drivers. It's one of the
>>> fbdev emulations with no GEM handle on their buffers. The change
>>> to gma500 is therefore rather cosmetic.
>> Could we separate that change out? I mean we want to backport the patch.
> 
> Sure. gma500 doesn't use handles for its fbdev emulation. So nothing changes.
> 
>>
>>> Tested on i915, amdgpu (by Bert) and gma500. Also tested on i915
>>> plus udl for the original problem with dma-buf sharing.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
>>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>>> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
>>> Tested-by: Bert Karwatzki <spasswolf@web.de>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>   drivers/gpu/drm/drm_framebuffer.c            | 23 +++++++-
>>>   drivers/gpu/drm/drm_gem.c                    | 59 +++++++++++++-------
>>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++---
>>>   drivers/gpu/drm/drm_internal.h               |  4 +-
>>>   drivers/gpu/drm/gma500/fbdev.c               |  2 -
>>>   5 files changed, 69 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>>> index b781601946db..e4a10dd053fc 100644
>>> --- a/drivers/gpu/drm/drm_framebuffer.c
>>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>>> @@ -862,11 +862,17 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
>>>   int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>>                const struct drm_framebuffer_funcs *funcs)
>>>   {
>>> +    unsigned int i;
>>>       int ret;
>>>         if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
>>>           return -EINVAL;
>>>   +    for (i = 0; i < fb->format->num_planes; i++) {
>>> +        if (fb->obj[i])
>>> +            drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
>>> +    }
>>> +
>>>       INIT_LIST_HEAD(&fb->filp_head);
>>>         fb->funcs = funcs;
>>> @@ -875,7 +881,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>>       ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>>>                       false, drm_framebuffer_free);
>>>       if (ret)
>>> -        goto out;
>>> +        goto err;
>>>         mutex_lock(&dev->mode_config.fb_lock);
>>>       dev->mode_config.num_fb++;
>>> @@ -883,7 +889,14 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>>       mutex_unlock(&dev->mode_config.fb_lock);
>>>         drm_mode_object_register(dev, &fb->base);
>>> -out:
>>> +
>>> +    return 0;
>>> +
>>> +err:
>>> +    for (i = 0; i < fb->format->num_planes; i++) {
>>> +        if (fb->obj[i])
>>> +            drm_gem_object_handle_put_if_exists_unlocked(fb->obj[i]);
>>> +    }
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL(drm_framebuffer_init);
>>> @@ -960,6 +973,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
>>>   void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
>>>   {
>>>       struct drm_device *dev = fb->dev;
>>> +    unsigned int i;
>>> +
>>> +    for (i = 0; i < fb->format->num_planes; i++) {
>>> +        if (fb->obj[i])
>>> +            drm_gem_object_handle_put_if_exists_unlocked(fb->obj[i]);
>>> +    }
>> That goes boom as soon as somebody grabs a GEM handle for the FB used for fbdev emulation (which is perfectly possible with the UAPI but not done currently as far as I know).
> 
> My uninformed question: how so? I thought userspace gets the handle from allocating buffers (e.g., CREATE_DUMB or driver ioctl). That object would be distinct from the fbdev object.

The DRM_IOCTL_MODE_GETFB and DRM_IOCTL_MODE_GETFB2 IOCTLs can create handles for the GEM objects in a FB.

So for GEM objects created for fbdev emulation the handle count could go from 0->1 by this.

>>
>> It's probably ok for a bug fix we are going to backport, but a more robust long term solution is really desired here I think.
> 
> There are only 4 GEM objects per framebuffer at most. So we could flag each plane with a bit in struct drm_framebuffer.flags when we acquire the handle in drm_framebuffer_init(). _cleanup() would then only unref those with the flag set. Does that work?

That is what I had in mind as well, yes.

Alternatively we could potentially disallow the transition of the handle count from 0->1 by the DRM_IOCTL_MODE_GETFB and DRM_IOCTL_MODE_GETFB2 IOCTLs.

But my gut feeling is having the flags in the framebuffer object is the more defensive approach. E.g. less potential to backfire.

Regards,
Christian.

> 
> Best regards
> Thomas
> 
>>
>> Regards,
>> Christian.
>>
>>>         mutex_lock(&dev->mode_config.fb_lock);
>>>       list_del(&fb->head);
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index bc505d938b3e..9d8b9e6b7d25 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -224,23 +224,27 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>>>   }
>>>     /**
>>> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>>> + * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
>>>    * @obj: GEM object
>>>    *
>>> - * Acquires a reference on the GEM buffer object's handle. Required
>>> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>>> - * to release the reference.
>>> + * Acquires a reference on the GEM buffer object's handle. Required to keep
>>> + * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
>>> + * to release the reference. Does nothing if the buffer object has no handle.
>>>    */
>>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>>> +void drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
>>>   {
>>>       struct drm_device *dev = obj->dev;
>>>         guard(mutex)(&dev->object_name_lock);
>>>   -    drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>>> -    drm_gem_object_handle_get(obj);
>>> +    /*
>>> +     * First ref taken during GEM object creation, if any. Some
>>> +     * drivers set up internal framebuffers with GEM objects that
>>> +     * do not have a GEM handle. Hence, this counter can be zero.
>>> +     */
>>> +    if (obj->handle_count)
>>> +        drm_gem_object_handle_get(obj);
>>>   }
>>> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>>>     /**
>>>    * drm_gem_object_handle_free - release resources bound to userspace handles
>>> @@ -272,21 +276,11 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>>>       }
>>>   }
>>>   -/**
>>> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>>> - * @obj: GEM object
>>> - *
>>> - * Releases a reference on the GEM buffer object's handle. Possibly releases
>>> - * the GEM buffer object and associated dma-buf objects.
>>> - */
>>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>> +static void drm_gem_object_handle_put_unlocked_tail(struct drm_gem_object *obj)
>>>   {
>>>       struct drm_device *dev = obj->dev;
>>>       bool final = false;
>>>   -    if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
>>> -        return;
>>> -
>>>       /*
>>>       * Must bump handle count first as this may be the last
>>>       * ref, in which case the object would disappear before we
>>> @@ -304,7 +298,32 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>>       if (final)
>>>           drm_gem_object_put(obj);
>>>   }
>>> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>> +
>>> +static void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>> +{
>>> +    struct drm_device *dev = obj->dev;
>>> +
>>> +    if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
>>> +        return;
>>> +
>>> +    drm_gem_object_handle_put_unlocked_tail(obj);
>>> +}
>>> +
>>> +/**
>>> + * drm_gem_object_handle_put_if_exists_unlocked - releases reference on user-space handle, if any
>>> + * @obj: GEM object
>>> + *
>>> + * Releases a reference on the GEM buffer object's handle. Possibly releases
>>> + * the GEM buffer object and associated dma-buf objects. Does nothing if the
>>> + * buffer object has no handle.
>>> + */
>>> +void drm_gem_object_handle_put_if_exists_unlocked(struct drm_gem_object *obj)
>>> +{
>>> +    if (!obj->handle_count)
>>> +        return;
>>> +
>>> +    drm_gem_object_handle_put_unlocked_tail(obj);
>>> +}
>>>     /*
>>>    * Called at device or object close to release the file's
>>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> index c60d0044d036..618ce725cd75 100644
>>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>>       unsigned int i;
>>>         for (i = 0; i < fb->format->num_planes; i++)
>>> -        drm_gem_object_handle_put_unlocked(fb->obj[i]);
>>> +        drm_gem_object_put(fb->obj[i]);
>>>         drm_framebuffer_cleanup(fb);
>>>       kfree(fb);
>>> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>>           if (!objs[i]) {
>>>               drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>>               ret = -ENOENT;
>>> -            goto err_gem_object_handle_put_unlocked;
>>> +            goto err_gem_object_put;
>>>           }
>>> -        drm_gem_object_handle_get_unlocked(objs[i]);
>>> -        drm_gem_object_put(objs[i]);
>>>             min_size = (height - 1) * mode_cmd->pitches[i]
>>>                + drm_format_info_min_pitch(info, i, width)
>>> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>>               drm_dbg_kms(dev,
>>>                       "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>>                       objs[i]->size, min_size, i);
>>> -            drm_gem_object_handle_put_unlocked(objs[i]);
>>> +            drm_gem_object_put(objs[i]);
>>>               ret = -EINVAL;
>>> -            goto err_gem_object_handle_put_unlocked;
>>> +            goto err_gem_object_put;
>>>           }
>>>       }
>>>         ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>>>       if (ret)
>>> -        goto err_gem_object_handle_put_unlocked;
>>> +        goto err_gem_object_put;
>>>         return 0;
>>>   -err_gem_object_handle_put_unlocked:
>>> +err_gem_object_put:
>>>       while (i > 0) {
>>>           --i;
>>> -        drm_gem_object_handle_put_unlocked(objs[i]);
>>> +        drm_gem_object_put(objs[i]);
>>>       }
>>>       return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>> index f7b414a813ae..9233019f54a8 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -161,8 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>>     /* drm_gem.c */
>>>   int drm_gem_init(struct drm_device *dev);
>>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>> +void drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
>>> +void drm_gem_object_handle_put_if_exists_unlocked(struct drm_gem_object *obj);
>>>   int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>                      struct drm_gem_object *obj,
>>>                      u32 *handlep);
>>> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
>>> index 8edefea2ef59..afd252108cfa 100644
>>> --- a/drivers/gpu/drm/gma500/fbdev.c
>>> +++ b/drivers/gpu/drm/gma500/fbdev.c
>>> @@ -121,7 +121,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>>>       drm_fb_helper_fini(fb_helper);
>>>         drm_framebuffer_unregister_private(fb);
>>> -    fb->obj[0] = NULL;
>>>       drm_framebuffer_cleanup(fb);
>>>       kfree(fb);
>>>   @@ -243,7 +242,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>>>     err_drm_framebuffer_unregister_private:
>>>       drm_framebuffer_unregister_private(fb);
>>> -    fb->obj[0] = NULL;
>>>       drm_framebuffer_cleanup(fb);
>>>       kfree(fb);
>>>   err_drm_gem_object_put:
> 

