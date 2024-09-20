Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23F97DA54
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 23:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7010E874;
	Fri, 20 Sep 2024 21:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NPBVIvDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276A10E871;
 Fri, 20 Sep 2024 21:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmEPdYJ+NZ1C+MqU5LzTvnZrk4x4Jju6dOYenn30WdEd758SKiWvG+w4aQgmno05rbZKJ1zh8tyXZ0ufUPzDe3ZytD8kmmYrAdSdEVgGbrSy7kvs7pUx2RqRNva6fHnfHvw9aHKGFBjvTRvuVao1ltXAOleVwaVN3jtnBHtCjkry0XTfNoWa2jyY615Yvej7WbyIZHhGYn2IbgRklih8wtAWd5eZiei+xcQdDZFF3bZlRnfqT9kY8VH7fhB6y7P1QAPaOp6Qkm9pfLkUpcchmMb8kL01FylNrxEJcrGNeKIFXqgJ6405cOQaNjNZRGX/VfRDXWCF+rm88R8fXEZ+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENwN8hyspCjPplnPA8R/NipgeCEqeF78ghh9KtUkSYc=;
 b=UtMr8tuCuoptunrS+ujr/fq5g5z6UWGJqyD5HH8t4CyhGWXuKzTC1nrbMmDdw3y7R6GqYEuq8s3n8ckRmn/bc84E3yYGxbw/lfxCgIA8ESSgLfpou2nTZisM/mfWX5RV+vwXPDcvw1fIhM2qtRYNW20MXEM7aRS4PNIeio+zFPa8BohV7OXSfBb5HYmMD/WFNMgLKk/VVnxxJwlT9osIwseH6jNhoCEuGsLMEe9xMt7c01W4Ec9IFrBfomGDdyEwxaM5sABj3KCeGePAbl3cewY/WOsneD0CIUGeNcV+v/2Ir10W/qoeQEB/Qm3wdR4oga/s0AVNAPZ4C6peAP5KNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENwN8hyspCjPplnPA8R/NipgeCEqeF78ghh9KtUkSYc=;
 b=NPBVIvDBZX0jToqs2QvihZ2WZHrI08pXIxHMjTSN/7OqL9N7SewMEmEqF3S/m7N/VPlHUZCpnHDQ5AsasRgrKfoGNoNlFMMhAWoE+XhuzBaRpOLtJl1Db/Qei93K6RNP2CGUGuIcndIbQckunhSJbYgqFUqtHtORw+SZcjWLCgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB6747.namprd12.prod.outlook.com (2603:10b6:510:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 21:50:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%2]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 21:50:12 +0000
Message-ID: <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
Date: Fri, 20 Sep 2024 17:50:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
To: Matthew Brost <matthew.brost@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch, Philip.Yang@amd.com,
 akpm@linux-foundation.org, christian.koenig@amd.com
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c11b47f-f6aa-4805-9320-08dcd9be3476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RldVdkRyUlJxdkx1YnpWeG8vaDcrRThxeWtEbWtrSEFLLytsc1FVSFR2cjlZ?=
 =?utf-8?B?RkRBK0c2SHlBQWlVMkk4bzVndkRCTXlsRE1WYUJRd081UkJCbUgxUmVpbXZV?=
 =?utf-8?B?V3dteldESDlRUDRxMXF0VGo2ODNJV1lxZGhoYi9BOHNjeWQ1a051T2c0K1d4?=
 =?utf-8?B?T2o0VFJxVjE0Q0NnS3hXblVIcXpaK3Z6MVpwMDZlQUZQN21vYmU5VjdTWjlz?=
 =?utf-8?B?WU00L2V1TFBYaXlubndPUUpvWlM5QUZZcDc4REptVGpkd0swbVFGcXJmVTNz?=
 =?utf-8?B?czMzWnFrRWEwdEJETFJNeElBNDAwRjh2TEhoczJGWmc5UkEvaXMvbUpIN0F2?=
 =?utf-8?B?YjVwQ2JMaURwM0FWL3NBbEVMbDExYW9RWFpTV0JWQ2h2V09uL1hMNXJycVBG?=
 =?utf-8?B?dHdqZXhxM2xwdndldGhJSEJFLzRweTlzRkIrcFJzV0F6NmVjTzVXODZ4TFdW?=
 =?utf-8?B?OHZkUlJVMDYxTXgycXQ1enNsdUprWWdJZTlpOW5kWi9XVDJZeDg2S25LZThD?=
 =?utf-8?B?VEU2dWl3WFNjd1dLdE5ST1pnd3Z2NFhpZmk5bzVKd1Q4MXdUVENUYVdKT2Zy?=
 =?utf-8?B?ME1JbUI3R21QMmtzZktDYWRNa2tTRXFDZHFUTU8rU2F5YmVFVjJxV3VnWXVV?=
 =?utf-8?B?aG9DM2hiTHNDUG1MM2QvOFJlTE9zc3FmU0thb0FrOXd5TG5ibFQrZjg4MnY5?=
 =?utf-8?B?NCswUFViMXY0ZFNRcE5DeHFib3BGMDRzVWpKVU1FNnJKL2RVVjlVWG1BSklJ?=
 =?utf-8?B?RVRnWTRrdC9vL3BRdG9NUGY4eHZaN2Y3Y3dZRjhNbVZNaDAyUHA1TVBJMTFN?=
 =?utf-8?B?eFJXK1A2Q0JwSkpIV1VielhZWUY3NVZQNlY5Zk1FQldNYXBKS2lqWjNZc2Mx?=
 =?utf-8?B?SThkY2xpeEZyeUFPUDByWmN2bmFOUU91QTBtR0N4LzJIOTFtZGFOMnhLWkYr?=
 =?utf-8?B?Q0pmR1EwdlJXc29EU2FKMzVyQmtWWnBhaENIb0lHM3pYRGZmTmM4YzRKb01M?=
 =?utf-8?B?R1cyM3NWUG1LRXlrZ2VOTGV2d0FPVVRZQWVlSUZQM0hFOVd0OWhmdjVDNU8y?=
 =?utf-8?B?bHRZOVQ0R1kzNCtwejE2aEx3NURPNnlpUTduYnVHYW1lZzlBZTFnSStqV00x?=
 =?utf-8?B?YnVrMUhiK1pQMTFFZXoxbUt3bWxZYjUrSFZjTWptREROT1Z5RitHWHp2Zm5q?=
 =?utf-8?B?RVlTK0JlcFB2Zk9kVFBza0tKVjVYSFpYYTh0dmpqRUFrVHpHbEdiTVp4ZHBq?=
 =?utf-8?B?dllUZ0M3TklOZGoyOXFpTDBWY3MzYXBudDZ0L1gxcU5WMjkvWVNBb3luR3hM?=
 =?utf-8?B?U2E1aGppMDc4cUU0OStqV3ZpaXR3a3VaYW9LckJBU0NrM0ZwZnM3MkoxOFMr?=
 =?utf-8?B?TTNnNW9rWCszUTRZMCsvWWhkRi9kSnpDek4rU0thT2szNVg5NTNLdlhOSUJV?=
 =?utf-8?B?VlY5anZGcTZaU014NmlMWGo3Z0x4UlJiSkEweHUxSEM4MDBZTGJRSUpMRnJy?=
 =?utf-8?B?VlljcDl2KzJNTE9hd3BpYlpNSDNGUzdocHBDVUZFY21FRzZDekptSjRjMnRH?=
 =?utf-8?B?dTZDaysrUVlyU3o4ZG5OUGNja2t3Rm11emxwK3FlNFFDdHZmZ0RUdXoxRjBu?=
 =?utf-8?B?NzE0Tm13NjkvMDJzL1RFTnZyVVBUcUNlVVFQcEw4bzVhZy9mWDJBN3R3a1ls?=
 =?utf-8?B?K2lMYW1JZGptOWo2dEdQLzJyelRRMk51VmM1QWxmcUI2VXMyTDBSQ0dFTVA3?=
 =?utf-8?B?K3lWdnF4ckFBcUh5SkhWcGJxRzhvaTVvY1VJdWRETVY4V1pWRVJUM29nZ2pD?=
 =?utf-8?B?UlM4SVVjaHF4RERQRjFwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5lNFdBZGVrWDZUNlg0WTc4Y1d4dDRtTy9jM2dXNWd2YjVuNTJnbXJ0ZmpK?=
 =?utf-8?B?a2tXWGxGbHdXM1pTU0w5Qlg3cEVNZHREWk9zdHJab0hta29VbUliTjVsVGZO?=
 =?utf-8?B?V2pwMjlIdUdRY2NRNCtFVTNEY01JYjdqVWg1b2IvYVpST0c4ZElQOFlRR0c3?=
 =?utf-8?B?Y0FkWjdtVyt5aVVJVnBVcjVpaW9laWxoWHlIbk1teFpKNk15QXkzcGdoSlNp?=
 =?utf-8?B?WnZwZ0Zhamx0Mjg3Mnp1THhPdHRyMS9hb2FnYnVHZGVDUHJjY1JjYTU5RnRu?=
 =?utf-8?B?Q2tKWVo1WFpKUXhmOGQyN0lKQTFENVFJZ0dXQVowUGcxZExTSkZHdkpnczZh?=
 =?utf-8?B?ZGxGbkgzamhZZEZzaUpKZVYzTTN4TGhDdDhIdUg0UDJYQXZlU0diWncrZkND?=
 =?utf-8?B?YkRxQjRJQWE1c1p5TmhaL3FzeHNCSnZIMkkzd29wUXhXa1NGc0wxaWdNM3V2?=
 =?utf-8?B?dCtPRm5qWGZkQ2c5NitLbS8xUzV4b29kNkt4UDZXNTNzQ1BEdVdPQjdUSHFX?=
 =?utf-8?B?TUZiNU1BZkE1TnhFVmRhNVQ2WFladGFYNjQxVVNJcWkraHc3U0MvY1pUWWFJ?=
 =?utf-8?B?MkNNcHp1NHFEMmF2VXNpOTh1bWhjcittOVB6MVNxTTlTOUdKZXJaZ01NTm1I?=
 =?utf-8?B?cXp1TGsvNUNMS3YvRlFsYnl5ZWlXQkJ2am0xb3JMTWQ2Qk53cEtvOWRKbkZ6?=
 =?utf-8?B?ejBtYUJrSEV3V28zU0NjM1hMOU1IREwxZFQ5bDlyREJRSFhiZzJHeWpKc2JO?=
 =?utf-8?B?d21ha3VjdFkyWGxIUWhacFNudnJQUjZneFZtcVVEYlpwSkxjWlBLa0M2SnN6?=
 =?utf-8?B?cGRkMHYrdElUaE1wWEdaR1c3UTlBdzc1QTF1YzVvazRaL2E0QTVZWFhRL2Fz?=
 =?utf-8?B?WDFOdmdBb21hTVM4KzRVRG5jczZjVnRONTVENXFMZnllcXduVGhKWU4wOWRy?=
 =?utf-8?B?SnVDT3RSVUo4NVpHWVpTTUNGMXd0R0I2RktZQjZWb2JUL1lNVFBaU092VUZV?=
 =?utf-8?B?eG5uY0tBNjBldGNRK0Ixd2l1WkZzbGJaVlNiQTZoYW1HZjd1MGVtUGV1emto?=
 =?utf-8?B?Mnl5ZnBqcm53ZkN1K1ZtZEFGemhjS1hZcG1zdStFaGtMWTQvazdjd0NubStF?=
 =?utf-8?B?cnR0U0tGc2NGZWtJVHJEc0lKbjVwQlhKTXIzeit5MHcwMFoyZ0crcjRxSnU4?=
 =?utf-8?B?NWdBcU82cldFL1d4V2R3a29HNFRhQkozUkNCZWQwZTlpWUVTV011UUJNSHN2?=
 =?utf-8?B?UDJNVFVsNFh3OWQzR2RIM2hySzI4SkdDRHRkSXNmYytYYklLZ1pqaWRMUThv?=
 =?utf-8?B?bUtXYkJqL1JqV3IwVGR2aGpTTlJEeEl1ZnQxMEpWRnptNEo1bW53SXIvMDIx?=
 =?utf-8?B?eldYWUVsZXByT2hWRXl5d2tWSGcwUk5XREhibnVKZnBXYnhHdWZxTVZiVHU2?=
 =?utf-8?B?YnZDbTZZNkNZaHNzUDdUeHNCY3R0Mk1pNDl4WFBQeU1QczJrVEE5bTFJMFhp?=
 =?utf-8?B?bEVkOVF3b3ZzUGhGeU5UR1g2cTQ3TVlySXBObGdLNldLS251MWZndTl1bDlt?=
 =?utf-8?B?UDBrSzdGZkw0SWluL01vWWV3ZXI0Z2o1cmdlZUtuZVY4L2VsOGdQaTBXKytG?=
 =?utf-8?B?V085S3NkbWphR0EwaHJYRy9NMnBscGZIYlNxb3JwNVFwMFJ5elFUNVBwQS9T?=
 =?utf-8?B?THppVXQ4emJsUVVRNE94US9nSkJDSG94NDZVUVdBTHFCZWZ6U0ZtVGNiV1dp?=
 =?utf-8?B?Umw4enNjaDhhTUNEaG9Bck1iZTgzRmRZL1FQS1lDTHdpdWc4a0xpNURwUWFT?=
 =?utf-8?B?S1NwT1p4Nk41anFrWUJJZWpyRzQ1M3F2Nkp3cjltQm1kSDZTYm5DUGRJQ3lU?=
 =?utf-8?B?eWVOcnBKd3BpQ1hnYWxHOU1GMG4yWGdQcyt1SVd1Y0tzcFNBTzJOVUJZaUJk?=
 =?utf-8?B?TERRSXdjMFdxZHliWlZ2cG1UeUtqM1BCUHNjY3UrZzhXUE8vSytMb3N3bDZW?=
 =?utf-8?B?L0gxb1gxTnB1eDR5MmVaNUc2UWVZSUtMTnB1dHNMa3ZLUGRjVHNyYVdDMW5x?=
 =?utf-8?B?emNYa21Pamo2b0luVllxY3ovRnlxQW50WGdqRUhiUzhFd2wzak9USHZ6Z2gw?=
 =?utf-8?Q?YEvawMqVPhjeU2jAX+h6H4kmO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c11b47f-f6aa-4805-9320-08dcd9be3476
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 21:50:12.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKziZ8eK/UCYXFNO2o9Q7XsTFTDOoriQubEfjeobNso5ziWM8tcGN9ZhpuhQlGaMD0JCdjNHNS3Y2vTODhhOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747
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


On 2024-09-20 17:23, Matthew Brost wrote:
> On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
>> On 2024-09-18 11:10, Alistair Popple wrote:
>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>
>>>> On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>
>>>>> I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
>>>> Still a driver.
>>> Indeed, and I'm happy to answer any questions about our implementation.
>>>
>>>>> but theoretically it seems like it should be possible. However we
>>>>> serialize migrations of the same virtual address range to avoid these
>>>>> kind of issues as they can happen the other way too (ie. multiple
>>>>> threads trying to migrate to GPU).
>>>>>
>>>>> So I suspect what happens in UVM is that one thread wins and installs
>>>>> the migration entry while the others fail to get the driver migration
>>>>> lock and bail out sufficiently early in the fault path to avoid the
>>>>> live-lock.
>>>>>
>>>> I had to try hard to show this, doubt an actual user could trigger this.
>>>>
>>>> I wrote a test which kicked 8 threads, each thread did a pthread join,
>>>> and then tried to read the same page. This repeats in loop for like 512
>>>> pages or something. I needed an exclusive lock in migrate_to_ram vfunc
>>>> for it to livelock. Without an exclusive lock I think on average I saw
>>>> about 32k retries (i.e. migrate_to_ram calls on the same page) before a
>>>> thread won this race.
>>>>
>>>>   From reading UVM, pretty sure if you tried hard enough you could trigger
>>>> a livelock given it appears you take excluvise locks in migrate_to_ram.
>>> Yes, I suspect you're correct here and that we just haven't tried hard
>>> enough to trigger it.
>>>
>>>>>> Cc: Philip Yang <Philip.Yang@amd.com>
>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>> Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>    mm/memory.c         | 13 +++++++---
>>>>>>    mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
>>>>>>    2 files changed, 50 insertions(+), 23 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>>> index 3c01d68065be..bbd97d16a96a 100644
>>>>>> --- a/mm/memory.c
>>>>>> +++ b/mm/memory.c
>>>>>> @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>>>>>    			 * Get a page reference while we know the page can't be
>>>>>>    			 * freed.
>>>>>>    			 */
>>>>>> -			get_page(vmf->page);
>>>>>> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>>>> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>>>>> -			put_page(vmf->page);
>>>>>> +			if (trylock_page(vmf->page)) {
>>>>>> +				get_page(vmf->page);
>>>>>> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>>> This is all beginning to look a lot like migrate_vma_collect_pmd(). So
>>>>> rather than do this and then have to pass all this context
>>>>> (ie. fault_page) down to the migrate_vma_* functions could we instead
>>>>> just do what migrate_vma_collect_pmd() does here? Ie. we already have
>>>>> the PTL and the page lock so there's no reason we couldn't just setup
>>>>> the migration entry prior to calling migrate_to_ram().
>>>>>
>>>>> Obviously calling migrate_vma_setup() would show the page as not
>>>>> migrating, but drivers could easily just fill in the src_pfn info after
>>>>> calling migrate_vma_setup().
>>>>>
>>>>> This would eliminate the whole fault_page ugliness.
>>>>>
>>>> This seems like it would work and agree it likely be cleaner. Let me
>>>> play around with this and see what I come up with. Multi-tasking a bit
>>>> so expect a bit of delay here.
>>>>
>>>> Thanks for the input,
>>>> Matt
>> Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
>> Christian and myself in the loop with future patches in this area.
>>
> Will do. Already have another local patch set which helps drivers dma
> map 2M pages for migrations if SRAM is physically contiguous. Seems
> helpful for performance on Intel hardware. Probably post that soon for
> early feedack.

OK.


>
> Longer term I thinking 2M migration entries, 2M device pages, and being
> able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
> finding migrate_vma_* functions take up like 80-90% of the time in the
> CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
> ideal. Seems like 2M entries for everything would really help here. No
> idea how feasible this is as the core MM stuff gets confusing fast. Any
> input on this idea?

I agree with your observations. We found that the migrate_vma_* code was 
the bottle neck for migration performance as well, and not breaking 2M 
pages could reduce that overhead a lot. I don't have any specific ideas. 
I'm not familiar with the details of that code myself. Philip has looked 
at this (and some old NVidia patches from a few years ago) in the past 
but never had enough uninterrupted time to make it past prototyping.

Regards,
   Felix


>
> Matt
>
>> Regards,
>>    Felix
>>
>>
>>>>>> +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>>>>> +				put_page(vmf->page);
>>>>>> +				unlock_page(vmf->page);
>>>>>> +			} else {
>>>>>> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>>>> +			}
>>>>>>    		} else if (is_hwpoison_entry(entry)) {
>>>>>>    			ret = VM_FAULT_HWPOISON;
>>>>>>    		} else if (is_pte_marker_entry(entry)) {
>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>>> index 6d66dc1c6ffa..049893a5a179 100644
>>>>>> --- a/mm/migrate_device.c
>>>>>> +++ b/mm/migrate_device.c
>>>>>> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>    				   struct mm_walk *walk)
>>>>>>    {
>>>>>>    	struct migrate_vma *migrate = walk->private;
>>>>>> +	struct folio *fault_folio = migrate->fault_page ?
>>>>>> +		page_folio(migrate->fault_page) : NULL;
>>>>>>    	struct vm_area_struct *vma = walk->vma;
>>>>>>    	struct mm_struct *mm = vma->vm_mm;
>>>>>>    	unsigned long addr = start, unmapped = 0;
>>>>>> @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>    			folio_get(folio);
>>>>>>    			spin_unlock(ptl);
>>>>>> -			if (unlikely(!folio_trylock(folio)))
>>>>>> +			if (unlikely(fault_folio != folio &&
>>>>>> +				     !folio_trylock(folio)))
>>>>>>    				return migrate_vma_collect_skip(start, end,
>>>>>>    								walk);
>>>>>>    			ret = split_folio(folio);
>>>>>> -			folio_unlock(folio);
>>>>>> +			if (fault_folio != folio)
>>>>>> +				folio_unlock(folio);
>>>>>>    			folio_put(folio);
>>>>>>    			if (ret)
>>>>>>    				return migrate_vma_collect_skip(start, end,
>>>>>> @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>    		 * optimisation to avoid walking the rmap later with
>>>>>>    		 * try_to_migrate().
>>>>>>    		 */
>>>>>> -		if (folio_trylock(folio)) {
>>>>>> +		if (fault_folio == folio || folio_trylock(folio)) {
>>>>>>    			bool anon_exclusive;
>>>>>>    			pte_t swp_pte;
>>>>>> @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>    				if (folio_try_share_anon_rmap_pte(folio, page)) {
>>>>>>    					set_pte_at(mm, addr, ptep, pte);
>>>>>> -					folio_unlock(folio);
>>>>>> +					if (fault_folio != folio)
>>>>>> +						folio_unlock(folio);
>>>>>>    					folio_put(folio);
>>>>>>    					mpfn = 0;
>>>>>>    					goto next;
>>>>>> @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>>>>>>    					  unsigned long npages,
>>>>>>    					  struct page *fault_page)
>>>>>>    {
>>>>>> +	struct folio *fault_folio = fault_page ?
>>>>>> +		page_folio(fault_page) : NULL;
>>>>>>    	unsigned long i, restore = 0;
>>>>>>    	bool allow_drain = true;
>>>>>>    	unsigned long unmapped = 0;
>>>>>> @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>>>>>>    		remove_migration_ptes(folio, folio, false);
>>>>>>    		src_pfns[i] = 0;
>>>>>> -		folio_unlock(folio);
>>>>>> +		if (fault_folio != folio)
>>>>>> +			folio_unlock(folio);
>>>>>>    		folio_put(folio);
>>>>>>    		restore--;
>>>>>>    	}
>>>>>> @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>>>>    		return -EINVAL;
>>>>>>    	if (args->fault_page && !is_device_private_page(args->fault_page))
>>>>>>    		return -EINVAL;
>>>>>> +	if (args->fault_page && !PageLocked(args->fault_page))
>>>>>> +		return -EINVAL;
>>>>>>    	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>>>>>>    	args->cpages = 0;
>>>>>> @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(migrate_vma_pages);
>>>>>> -/*
>>>>>> - * migrate_device_finalize() - complete page migration
>>>>>> - * @src_pfns: src_pfns returned from migrate_device_range()
>>>>>> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
>>>>>> - * @npages: number of pages in the range
>>>>>> - *
>>>>>> - * Completes migration of the page by removing special migration entries.
>>>>>> - * Drivers must ensure copying of page data is complete and visible to the CPU
>>>>>> - * before calling this.
>>>>>> - */
>>>>>> -void migrate_device_finalize(unsigned long *src_pfns,
>>>>>> -			unsigned long *dst_pfns, unsigned long npages)
>>>>>> +static void __migrate_device_finalize(unsigned long *src_pfns,
>>>>>> +				      unsigned long *dst_pfns,
>>>>>> +				      unsigned long npages,
>>>>>> +				      struct page *fault_page)
>>>>>>    {
>>>>>> +	struct folio *fault_folio = fault_page ?
>>>>>> +		page_folio(fault_page) : NULL;
>>>>>>    	unsigned long i;
>>>>>>    	for (i = 0; i < npages; i++) {
>>>>>> @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>    		src = page_folio(page);
>>>>>>    		dst = page_folio(newpage);
>>>>>>    		remove_migration_ptes(src, dst, false);
>>>>>> -		folio_unlock(src);
>>>>>> +		if (fault_folio != src)
>>>>>> +			folio_unlock(src);
>>>>>>    		if (is_zone_device_page(page))
>>>>>>    			put_page(page);
>>>>>> @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>    		}
>>>>>>    	}
>>>>>>    }
>>>>>> +
>>>>>> +/*
>>>>>> + * migrate_device_finalize() - complete page migration
>>>>>> + * @src_pfns: src_pfns returned from migrate_device_range()
>>>>>> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
>>>>>> + * @npages: number of pages in the range
>>>>>> + *
>>>>>> + * Completes migration of the page by removing special migration entries.
>>>>>> + * Drivers must ensure copying of page data is complete and visible to the CPU
>>>>>> + * before calling this.
>>>>>> + */
>>>>>> +void migrate_device_finalize(unsigned long *src_pfns,
>>>>>> +			unsigned long *dst_pfns, unsigned long npages)
>>>>>> +{
>>>>>> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
>>>>>> +}
>>>>>>    EXPORT_SYMBOL(migrate_device_finalize);
>>>>>>    /**
>>>>>> @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>>>>>>     */
>>>>>>    void migrate_vma_finalize(struct migrate_vma *migrate)
>>>>>>    {
>>>>>> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
>>>>>> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
>>>>>> +				  migrate->fault_page);
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(migrate_vma_finalize);
