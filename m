Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E80C4719D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B1510E3C4;
	Mon, 10 Nov 2025 14:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wdHhURlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3B810E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 14:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8TYX4H9NZDsTb/ZY/pMZNnE1RGS6yNe9w5fUiN9gid05Ftkmw5JsPh3fQk5ucUiRDEdVZAP9e6bmBZcMl8fObMqr+oGuT3LLVAiQrRIwwc34477H14UDWGjdpv4hVVvf+Hk64VlOoB2hfb4dB0rGmjaJOvMlABg7v4iU1oeKFyS6SrrpciLZT2wnh06F2bzOUz24nex1ir7qjMs0tcHcYONEEYXOiMbLUsgQb+M4GD88Wa7c3SdQSdTBxREG6SpyY8bKqR44MejOMRRcRb658a5tgvu8M7Tx6K7IXVQMZmYjHli8tIr+epvfDynCei1pwM3mP6nFffNVOec6aPEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ba9mIJEbdNiJ7qNuUI4ONcvd5pqBELygQtSH7COPXY=;
 b=ebzo7AtNamth5wimwl1pq7ZChFl2maR5I/Hxhheukqv+9KK5gSoR2T0krnTUaWKzTdAo+poKDgCWZeMHpGGlhy6cFfvPPK0KM7pn2OBLzzEyqUiHRjppC4sh0YX6zzI8/4HVoLTG1B//GZ+a9mtkAikiV7MAc4N0oTdeeQQy+4/L4AQUMKR6b/gpNHgaXGGOy2qTd8+4MEEJPwPaOP2iQ5n+GEFkXX3wH4+kyGoSEurBw/n64sma71YyYbQsxBnY02tUCd1cSGt3ThQlevg1rGdAoUH5vkfgke33WLYPWkjq3MMpC41jlqEGKfsqMu0fIHaZCecIA7boFGQEhYNByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ba9mIJEbdNiJ7qNuUI4ONcvd5pqBELygQtSH7COPXY=;
 b=wdHhURlI1ucD+0/DavysqKxpRx0yhIdDXP+5GfzV+YygmU8D+JTtddpvv2fPdErgXZ0IQzSy6wVo44gqy/8GYWAmYMMuH6mkwDe9B69aaUdaWAb2a5grN2mkg4qdgowpPVDRKGUpcK7NRbJP2RIeXmoPVikFYnL8PVDUj05AEcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 14:07:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:07:33 +0000
Message-ID: <2c72eb6e-7792-4212-b06f-5300bc9a42f9@amd.com>
Date: Mon, 10 Nov 2025 15:07:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
To: phasta@kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251110081903.11539-2-phasta@kernel.org>
 <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
 <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:408:142::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: a57a32b1-8177-4760-e4a3-08de20627e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1lLUjQ0ZkZmcUxCMml0UjFSdHdLdnZJZGxzRjl4ZWdSL2xNbEh5eTFjb3Ra?=
 =?utf-8?B?ZE1zdmNzaE44cUZwMTY1VFVzMUIvUXVQdzEwVW5COUk2cGQrZW9uNUdsd1JW?=
 =?utf-8?B?dkM4U1p2RTRRWGIxSTZKQlgzUkwvYytmd2NnZ21aZWpPSVhWWVk1NittRnNP?=
 =?utf-8?B?MEdsc240Wm43c0lKcXgyWmc4blRTT2o4aG5hT0NRZUtQSUpRaktmdklHMHRi?=
 =?utf-8?B?bmkvMjY5T2Q0bUhOV09FUnBSZlZUeWVNcWtwWG0zQW8rNCtkb3lBV0d2ekFF?=
 =?utf-8?B?VU9Ndzd2ak9kSDJEcmxsYzVqVzBZTzd1L2piM2dyTUZWL3h2dmZURHhNU1NG?=
 =?utf-8?B?MmhkN2Z6bUV6eldhbE5qdGpjNUl2dlZCdG9WR0g1SDd6d0ZBRGlHODRWaTVw?=
 =?utf-8?B?YkI2TEplaU5ZUzM1VkxBNmlVajVFMWQwVisvYlRhUTN5S01VYmFKcUtzcWtq?=
 =?utf-8?B?WjlXMjMvcE5rZVNXdnNtUjdjKzVxR0ZvZGt0K1lsTWpBUG4rQk9HQWszUTdO?=
 =?utf-8?B?ZUZ5WG54KzZDOXlIQVUvZXZrVytlSHVTdTVYYk41ZlBGaGY3cG1LMkpPY0d5?=
 =?utf-8?B?VElEMjBITzlMb2E1d0tMUEYvR2M4LzltSUZiSlUxcldHUkUzazd6dGVFOWt5?=
 =?utf-8?B?TVZQcHpSc1Y3Q0JRTjJoL3A3N3JqV2ZhUWRVV2hsREtYZmRoMlg4S0M0dS9P?=
 =?utf-8?B?UW00bVNqaXp1aHhJMkROQWplWEJCeW9CU0tDcXkvUjJ6bXpBdm53VjhnOVZR?=
 =?utf-8?B?UWl6WFJ2VnFYL0h2aHNSZDNCVTZ2OVpzamxZVytvNlRjNFBoWmI1N2xtTzY1?=
 =?utf-8?B?a1Fza05xV0t5b29LaUZHUXBaaGNyL2NxSDU1dDRRRFVuRHVFcm1ieVBabXpF?=
 =?utf-8?B?WTRsaUlwTDc5ZkRrcW1GZDVJTlFEOUNGYWRLejE5MnFSaUpxQ1U3NzBqRks1?=
 =?utf-8?B?Q296OUdMTlBqZjBXZEtXNzJHcU9LV2Z0MDdvaHQ2VTNuM0FMK0hrYTdvclR0?=
 =?utf-8?B?bWl0RzRHWEJzcFRoZDduWm83eHdkVU02UkRpNEI0OVhkclpxV1FQbGVIL1ZI?=
 =?utf-8?B?U1ZmOUZtWVNCYXVieG12YlVPRHNSRDMwWVBKckprdnNmM2xCbE1NYzRMM0Y5?=
 =?utf-8?B?aTlqelpUZHFiOTc5cnpYU25PUW5JeVF0U01OMmk4c2hJYmdRVDk2bWtiaW1W?=
 =?utf-8?B?bmpVUG9aeW9YMVhwWXMxMGdnaUFYUWxQY1ljS21JV2RRd2pCKytaSStFUjFx?=
 =?utf-8?B?MGpTTkJtSDNZNkQvUHJWbnVtVU00NzZwN0R1Tms5alZQbFAyK0lWWC9WK2Fl?=
 =?utf-8?B?Y1FWRnhBYTlRekVvbkdPUXFNMXFTUDBKNkNLNG9QZUYyY295SUovZ1F3NExa?=
 =?utf-8?B?ZEZweFNSckRhQmhuL1lQdWhsN1JnSUJMd1VsVmVTcElYVzExUDlEYnBmTlN4?=
 =?utf-8?B?ZW91ZkJyZ1NSLzBBQ0h5RmZZTmg2bHU0Y05FTy9vdk9Rd3RzelZpM043SkJW?=
 =?utf-8?B?OGd3ZDVPVkl6Zlp6V3JWdmMxd05jTko2WGpUSjNST05WVmdqZjYrOHd4b0Vq?=
 =?utf-8?B?MDVMTHhuckxMdmNGaTRNYUM5SGx6K21PdUk4QlFYckdQcGdtWmlhZEkySm1o?=
 =?utf-8?B?K2U3NnY2S0hPUFB4VkR3NzdZTkNMRDN5N0hGM1lRQ0tFZmxOM3c4L0ZOeVFl?=
 =?utf-8?B?cXovVjFtbFppTFJKbExCTnhTaWxSc2t0WGtwbml0WEgxQkUwZXFibnJEMXJ0?=
 =?utf-8?B?UmtLdkZYVnhZcVFZcXFoVlpXTk1jRjlNcjNTNWNKNVNFdDV0RzdlTUhqSFlO?=
 =?utf-8?B?bkYrTllLWjQ4UEd6RURCOURyUHRjWWxZNGtkMVR1T2hmVVFSL3VNMk1KSGk4?=
 =?utf-8?B?MVI4Z0EvY2N2ZmpzVEVZRDFaa3FiUElKb01kK2YrcThLUHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE83MlFiYW4ydk9uck9FUnFBMFp1UThJWWY5U2dsSUVWRTVVL0RZUFdFQThZ?=
 =?utf-8?B?d3JWWURjd0k1QWk4aStqWEF1Ykh2OXFSTys4TjFMZUhibHYvcDB3UWNxNlgr?=
 =?utf-8?B?RVROL2pJeHhRN0VFNGpNY1ZIS2dGNXdIVXpQUENIdHdmSE8xSlRBRkxsWVl3?=
 =?utf-8?B?VzlTZXFjTmx1V3pDOUhNT0Jybk8vVGlIbHdyQ2NnSnYxZGRFakZ5N3o3VVVY?=
 =?utf-8?B?Ynh6YkFoRzVhZmhpLzdad3U1ak1YNzFiSyt2OWdhVjVKMURHNGtVTXVBdVdj?=
 =?utf-8?B?REcrK2RzRytRWGhsdDgydFo1MDJkbE5rNlNVbzEwdEFEZVNDVHFKblZuYnlB?=
 =?utf-8?B?cDluWUFTbGhkL1I2UTZMTjR1TUhNaE5uM3h5Y3FKdEs0N0NsbGFmaloxbDAw?=
 =?utf-8?B?MlRCVEJZNkZ6c2YwMFBSam1BVWZnUkRPZGNJOHFTWTVQSVZFeE4xVU91aEty?=
 =?utf-8?B?cmx1ZGYyY0hPNitqaElxeXo0Y0Ntb1h4UGswaTJFYzFldUxkWFYzdkErcjRk?=
 =?utf-8?B?Zkgwb25SSGxGbU5Zd2xoWWs4SjF2NmgyK0IwTmZXTDhLUG9DcG1STHpUZUhG?=
 =?utf-8?B?c0cyeDJ3YmU1SWU2ZTBBWkxqS1ErVmF6bmtSNklHcCtkajBDSmJDOFB4dS9x?=
 =?utf-8?B?bGQ5VGp1S0k4UE5RQ2E0MlhIeFJqVktJQ0VyMkZDWnl6ektEZHhscWhCZDdQ?=
 =?utf-8?B?REJDNHJBRk4rcVNtb1p1K1FzSFBLQmZKSzg2a09DbUlMeDZxcXhvUXJnQU9i?=
 =?utf-8?B?T3F5RmczTWxzVFNPa1pKQmkrdXozaDdwQlp6U3RZUVlnalpxOVhBT1lOdWRH?=
 =?utf-8?B?UkNPK0lFUitqRVkrQ29IaUNOSnFDYVp3OWdUcjNQZFBlcU96TjZmR3pWWFJB?=
 =?utf-8?B?eWV4dFVDZG9OVEw4UkQraC83RFM2bWdnSWl3Q05PaFhneExRWGtBay9RZ2pI?=
 =?utf-8?B?RWc1WG1GN2VYQnkyaTQ1QUkvVlo0Y24rell3VnNIOFJSUWpmT3lsRGVQalFY?=
 =?utf-8?B?WjE0UEZ4M3U2VlB5UUdEc0lsVkxSR2wwK2lIUnh5MTI0cm9laVFIeENBbmU4?=
 =?utf-8?B?ZUhyZkU3d3RQYnpEMjVDNklQUkVYUzJHKzhCdlp3T1lXSVNHeFZHZ1c0bVNP?=
 =?utf-8?B?SHR0QmwwdFJreUNOZzd0emVoOVAxRkNRZTVLYTk3SDBHMFIvWjFKNHhndnRH?=
 =?utf-8?B?aGNSRmNyQTVYdUNIQ3FjeTFvLytDNTFFc1JZbFZXOW5vc0FYNTBkMzBxWkQy?=
 =?utf-8?B?WnFKRHJ4RlROOXd4Mkp1MnBZRjVRTkUvd2dudHkwZTJxTWo5WUFtRDQvbVkz?=
 =?utf-8?B?ZXcwZEZlQVVETWNZVGNzNFFocEwrZzNtbktQaWdlbkR4VGlJN2FVSXNPUWJE?=
 =?utf-8?B?YjZndDRka3F6dlRTMGcwaGN2ODY1UUNTbG8zc04xc2lCRnVpRDBtTzZZek5o?=
 =?utf-8?B?SWQzSzRJa3F1clk0Yk1KTzZjVHR0cEduWHFjQWhWb3pBZTFORTBHdnNZQjJS?=
 =?utf-8?B?ai9GWm9YM0UrUmVqS0JHSzNRUmhlYUV0eExnU2t2eTJjZWZMUmVzdDQzOVg5?=
 =?utf-8?B?Uk42R3FhMURFTE93UmhGM2daTmxNZk5EMk1DVDRwYmZvTG1NM2tTWEhiVEE1?=
 =?utf-8?B?dTFqb2dkT1A1UUhwemJlaFNlVitrUDN4OVM1S01KWUE0NFUyNWhJWjU3MEZI?=
 =?utf-8?B?UzBaYjIzRDVoZ2xTUHlhYlNya1o3SkdDVGhodU1HUk1NREQ1YjNiVlJ4MDlG?=
 =?utf-8?B?N1JuYVBGeHY1NjNTOHJ1RExRU1UrbldwZ1RpS2MrT0tNNWVud1RNS0lZdlV4?=
 =?utf-8?B?NHpnU2E0czVLb0lJS1RWMDlmeEJBVm9HMjBWcXVqQ0NOOFVjR0VhOThrUVRY?=
 =?utf-8?B?emxXaHFuc3VWdVl1V3d4dCtUMytGRnlRN1pGTllPTjliL3UxMjFYQ0tSaTZa?=
 =?utf-8?B?Z0xOYnp4YzNCNWorWk85bUh0Zm53bzlXN0VSdjJxOWN3Zlg3WmRaSGNFOHMw?=
 =?utf-8?B?YktiNjZwTkZJZS85a0xKaGs1S3hpSzV3SUswcHgxVFF1TG53eGJEQ0pwNHJJ?=
 =?utf-8?B?TWw3ckNkcTd2aTh5YWVhYlJkSHhEQnRmNmZob3NGczlIMmU1T2ZVS3hFUXRD?=
 =?utf-8?Q?1hLeC879YCvhcaO5eI9Dj6Bhk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57a32b1-8177-4760-e4a3-08de20627e42
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 14:07:33.2828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drTCEARqNW4ibD43YzTUV4xqGmlfImzQbtpKGH6v8+KmRZ5P+WTs0/KmulXF21hK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
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

On 11/10/25 13:27, Philipp Stanner wrote:
> Please don't top-post :(
> FDFY:
> 
> 
>> On 11/10/25 09:19, Philipp Stanner wrote:
>>> The spsc_queue is an unlocked, highly asynchronous piece of
>>> infrastructure. Its inline function spsc_queue_peek() obtains the head
>>> entry of the queue.
>>>
>>> This access is performed without READ_ONCE() and is, therefore,
>>> undefined behavior. In order to prevent the compiler from ever
>>> reordering that access, or even optimizing it away, a READ_ONCE() is
>>> strictly necessary. This is easily proven by the fact that
>>> spsc_queue_pop() uses this very pattern to access the head.
>>>
>>> Add READ_ONCE() to spsc_queue_peek().
>>>
>>> Cc: stable@vger.kernel.org # v4.16+
>>> Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> I think this makes it less broken, but I'm not even sure if it's enough
>>> or more memory barriers or an rcu_dereference() would be correct. The
>>> spsc_queue is, of course, not documented and the existing barrier
>>> comments are either false or not telling.
>>>
>>> If someone has an idea, shoot us the info. Otherwise I think this is the
>>> right thing to do for now.
>>>
>>> P.
>>> ---
>>>  include/drm/spsc_queue.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
>>> index ee9df8cc67b7..39bada748ffc 100644
>>> --- a/include/drm/spsc_queue.h
>>> +++ b/include/drm/spsc_queue.h
>>> @@ -54,7 +54,7 @@ static inline void spsc_queue_init(struct spsc_queue *queue)
>>>  
>>>  static inline struct spsc_node *spsc_queue_peek(struct spsc_queue *queue)
>>>  {
>>> - return queue->head;
>>> + return READ_ONCE(queue->head);
>>>  }
> 
> On Mon, 2025-11-10 at 12:24 +0100, Christian König wrote:
>> As far as I can see that is not correct or rather not complete.
> 
> It cannot be incorrect by definition, because it simply ensures that
> the load will actually take place there.
> 
> Incomplete it can be.
> 
>>
>> The peek function should only be used to opportunistically look at the top of the queue. It would only be problematic if it returns a non NULL value once and then a NULL value later.
>>
>> The whole idea of the SPSC is that it is barrier-free and the signaling of new entries to the consumer side is providing the barrier.
>>
>> So basically on the provider side you have
>> spsc_push(entry)
>> wake_up(consumer)
>>
>> And on the consumer side you have:
>>
>> woken_up_by_provider() {
>>  entry = spsc_peek();
>>  ...
>>  spsc_pop();
>> }
> 
> Well no, the scheduler can pick up the next job whenever it feels like
> it. Restarting it for example will have it peek into your queue,
> regardless of wake events.
> 
> In any case this is a highly fragile design. See below, too.
> 
> 
>>
>> The problem we are facing here is that the spsc only provides the guarantee that you see the entry pointer, but not the content of entry itself.
>>
>> So use cases like:
>>
>> woken_up_by_provider() {
>>  while (entry = spsc_peek()) {
>>  ...
>>  spsc_pop();
>>  }
>> }
>>
>> Are illegal since you don't have the correct memory barriers any more.
> 
> I can't follow. Are you saying that spsc_queue_peek() is correct
> because you know for sure that when it's used no one else might be
> changing that pointer?

Correct, yes. That's the whole idea. I mean SPSC stands for single producer single consumer.

> 
> Even if that were true this design is highly fragile.
> 
>>
>> Took me an eternity to understand that as well, so bear with me that I didn't previously explained that.
> 
> s/explain/document :)
> 
> As discussed few weeks ago with Sima and Tvrtko, what we really need to
> move to in all of DRM is this development pattern:
> 
>    1. For parallel code, at first by default use a boring, horribly
>       slow (sarcasm) spinlock. BTW I'm not even convinced that a
>       spinlock is slower than lockless tricks. Paul's book states that
>       a CAS atomic instruction takes about 60 cycles, and taking a lock
>       takes 100.

The problem isn't the burned CPU cycles, but rather the cache lines moved between CPUs.

Keep in mind that you can rather do a fused multiple add for a full 4x4 matrix before you take a single cache line miss.

>    2. If you want to do parallelism without locks, you need to justify
>       it really well. "rmb() so list_empty() works without a lock"
>       doesn't qualify, but real use case speedups.
>    3. If you write lockless infrastructure, you need to document it
>       really well. In particular you need to state:
>          1. How it works
>          2. What the rules are
> 
> See llist.h as an example. It clearly states when you need a lock and
> when you don't.

The llist.h is actually pretty similar to the SPSC. I'm wondering why they don't have the same issues? E.g. is xchg() providing the memory barriers?


> Or RCU. No one could use it without such good
> documentation.
> 
> I have no idea whether spsc_queue is correctly implemented (I doubt
> it), and if even a highly experienced dev like you takes "an eternity"
> (quote) to understand it, one is really tempted to dream of spinlock_t,
> which has very clear semantics and is easily understood even by
> beginners.
> 
>>
>> Question is what should we do?
> 
> Easy!
> 
> Mid-term, we should replace spsc_queue with a boring, locked, super-
> slow linked list ^_^

That's what the scheduler started with and the reason why that linked list was replaced with first a KFIFO and than the SPSC was because of lacking performance.

We could go back to the KFIFO design again, but a (double?) linked list is clearly going to show the same performance problems which originally triggered moving away from it.

> 
> The spsc_queue was designed and – perhaps – perf-measured when RR was
> the only scheduling policy.
> 
> Since the FIFO rework, where FIFO became the default policy, we now
> access our super efficient super fast lockless queue most of the time
> with the spinlock being taken immediately afterwards anyways. So we
> almost have a locked lockless queue now.
> 
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/scheduler/sched_entity.c#L502

That is not that relevant.

> Only push_job() often (?) still runs locklessly, but I'm not at all
> convinced that this is worth it. Not even performance-wise.

That is what is relevant. And yes the difference was totally measurable, that's why this was originally implemented.

> 
> If you look at spsc_queue_push() you see that it
>    1. disables preemption,
>    2. uses atomic instructions and
>    3. has a ton of memory barries
> 
> – in other words, this is almost literally a manual re-implementation
> of a spinlock, just without mutual exclusion…

The problem is really to separate the push from the pop side so that as few cache lines as possible are transferred from one CPU to another. 

Regards,
Christian.

> 
> 
> And even if something like spsc_queue would make sense and be actually
> worth it, then it should be provided to the entire kernel as common
> infrastructure, like llist.h, not hidden somewhere in DRM.
> 
> P.

