Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B09FC1B056
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 14:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAE610E1F5;
	Wed, 29 Oct 2025 13:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kq+f7d0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9644110E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSzdlK1UTUMBdolUUZddolBxNv6p+2Wtj7Usyd2YugAFUFm8WmD5T9vIfYRBktm6X0MtJLDagypsrB+n9RGAvo+3Fk1OZjRg09gPphTOPSRbyGGHNmkAB6W5vXH79rbE68j9WUpmCVOIVq0OPjl3FqSL8PVB6/soLIpAaNQHsrQEVbkrf0kbLJYgtzuv4ukY1MbQhjHoiEyKMWG5ZpyBxz9b6jhcXthzPmV37+jCKkoRzTjOBRUdKUgkTIfkAejZQFC7Amm4ZkB2I4WQ9UlV7WTfEZj42Zm15/IhmBGEJxD9GtJwVk8sMl3eePYt+ektWl2v8Uz8IDLG1F+tAJdCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/a+dItsXc79KSriKVYu2X3OEQt9PSe1hsacNlp1XtU=;
 b=YDqZ7YPdt5/r61j576zZSw0uxiHxtFXh9aOXD9CEQNx+Jq89Fnpn45MjmKA+M3LjEigfzdG0PWnZ5I9t+cQxQzCVdTZb43agCiw7Xs86kKbul4jfgz3bs6jn3mh7pq3EP3vjbaFlc5K0Sfs7HzllIto8TkavUnAImJQ3UiRQwgBgJFfVa2s4KLUsp1X0chvP4GRPEBlvu1/6/+PFRwdDWoMb+OB7nr0MVzSIjzK/6vneMfl8FBGCkO84DMCBanif3vqpAJCxzVBsyzSCb3GZmKW9o5feNHxs9uSmqaONo5w9CAqUUpTqmoWmI+bCMzZxKwrWPzS/GeNEhNaduNrCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/a+dItsXc79KSriKVYu2X3OEQt9PSe1hsacNlp1XtU=;
 b=Kq+f7d0aEMHCXoLNSBP+o3rb1qnNmRUggeLVBna9mc92cyKVa8XMTvrM5ILH1v4AL7WkmOrwlbwtcmrm/FuQ9kApX+9or9WQdgCbWTk/VPgY5DYxmvH/ZpWe0zVDRclGe6/lKvtEMhiJXaTuQzZ5WKPJH1L76BB7v7Pbqb6VVnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 13:57:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 13:57:52 +0000
Message-ID: <fa72946c-5b69-4f11-802a-0a4e5f9bb390@amd.com>
Date: Wed, 29 Oct 2025 14:57:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
To: phasta@kernel.org, Alex Deucher <alexdeucher@gmail.com>
Cc: dakr@kernel.org, matthew.brost@intel.com, dri-devel@lists.freedesktop.org
References: <20251015140128.1470-1-christian.koenig@amd.com>
 <f60185e4a4b8622c866965ec30c90edca0c53b40.camel@mailbox.org>
 <CADnq5_PUrPE8q8JD=pVZZYpxJuqovMbD5UcSR9m4E0nPTK=-ZA@mail.gmail.com>
 <ff3db8827921a5b92c3a5915684eee61d6fe74f5.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ff3db8827921a5b92c3a5915684eee61d6fe74f5.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0434.namprd03.prod.outlook.com
 (2603:10b6:408:113::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 19565874-a817-4952-d835-08de16f3273e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDMyYVhSSTNodytoUlFXQzg2alA5SFo1Y29QM3dDSWwzK0ZVSGNON2RjSStm?=
 =?utf-8?B?clAwOThtNzJkZzBpaG81MXFoekZvTEoxNXlxUVNrbFZSQ2ZvaWhwUmRydHdE?=
 =?utf-8?B?bW56eWR0OHBHM3lCWis1bzd4T3M3eURJVUtrcmVDbXZ1ZVJRcWgzSkFURDMy?=
 =?utf-8?B?WXZVVlh3SFR6azFSZXBYTXRNcW5zM20xTHhBMUNSUDA2V2U3KzhCMzBEYXN2?=
 =?utf-8?B?MWVtSnRrSGhNK0x2Y2pSTkk1R1RwNzY0OForS2xBLzFDUHpMWXd2czUydjFF?=
 =?utf-8?B?N2JEWmE2TlhOTXgyRmN6QngzaE94TXBuaFpVRzF3cDdUQklRbDI1SjBYYnVy?=
 =?utf-8?B?b2plTFFtZWZDK2hZTk1jMDk1dml6OFZ6amNwb2gyZXVmNmNsUGhIa1ZIS1gz?=
 =?utf-8?B?aGpqUkUzSnc0bWRGTE5oY2c0cjNWZ2JzcUR0MUhMeUE3SXpBZmMvb2FpVnln?=
 =?utf-8?B?bHVnb2VnbS9IUnZITDRaYkRtd2xCNS80dXdkQk5SdFRXRCtmNTYvR2dNOExL?=
 =?utf-8?B?aTJkWWs0K3dpQkU3UzZ2ZThEZklnb0h4NC9keTltMmQzNEM1UWpqcEp5ZWVQ?=
 =?utf-8?B?aE81d0xYMmk0V0dlelRiOG96OGVyRkxwV2lHWjZhM1h1NEJZV1BCdmhKQUVj?=
 =?utf-8?B?UElmMTBoNnNYYktZY2FhQ2FxVmhjZFB5Q0YzY1luMEp5S0s3UjlhdVd3cnRq?=
 =?utf-8?B?dDFVLzAyRHBJOFFXTmxIUGhNd3ZubWtYWWdwa2ZNVkRnZjh3bDZXVGpCN281?=
 =?utf-8?B?NXNtY29kS0x2QUwxV0hPNXp6bTY0OU5YY1oydEt3eHpsRlowdmZqTTljenRU?=
 =?utf-8?B?QXJ6djZtODU2SWZ6WU1zUVdsN0VDY0N0SS8wYnIva21hZXk3c1oweTBlU0dw?=
 =?utf-8?B?eDF1Q25Nd1hqVDVUaEpIVEpGSjNISnZoVlFKMVErSW45TlNiWi96UHg5OGdm?=
 =?utf-8?B?QmxQNlRVTjRSNVZ2d0FzeGgzWUhwQnE0Q1F2QUNaclNHK2NLMGJ4QWFMSlBl?=
 =?utf-8?B?ZFhoak9VU09NcE9QOXF0NWM0b212aGJFQTBKSUpwdUt5Q0hSQ0ZmelhTejFs?=
 =?utf-8?B?T0FXNkFrcHBJM2NYT0gvdkQvVDYzWlNqSFBvOHQ4SWZwRkhsTnFEVE4xMjdP?=
 =?utf-8?B?MEUza2tRNCtzR1d6YXJqemVYam9nWlVaWjJYK1NvbEdrUjlQL1laOXZ6anQr?=
 =?utf-8?B?UGQwYmNYR3cwOVJSK2F6WVE2M2xQRk00RWtER2s2YW1PdFlPaXVyZTlwaXZY?=
 =?utf-8?B?NUYyVUJDamJabHVGclhDQy9OdW5rVHhveHVXZmFOckQ1RjZKVUFzYzd1OXRk?=
 =?utf-8?B?cjJpakdYRnN6WEJVWHJ2NTBZYXNrSG1vUXdJWTRGRXd0Qnc1cnBRWXFEcktQ?=
 =?utf-8?B?SGNLbFNtbHNZWCtoYklNQnhDcWdWQjJETzh6VXJZaDVTQWtpL2x4V1haWHh1?=
 =?utf-8?B?aUc4a0pLT2ZEaWFlczdjRmlCQUlXd2ExcjQvMGsvb1g2ckZlSDVEN2dkUGlL?=
 =?utf-8?B?RWRTTU5qbHV4UDFhRm16eEkzejRodE9xdUYycVRPQUlndlQzS3dLdlhINjgx?=
 =?utf-8?B?dG4rMzI0aWdrODZnZkpQdjE2ZFZEYjB3VW8ydHJNUkRBWXVuM0pUUWgrWU1i?=
 =?utf-8?B?MlNnMktEL2ZLYlV0UytuU1VzWE92VmJ0YW5NYjhKVjRuWXVDT091K1RzSjFs?=
 =?utf-8?B?bnc1SS9rY0pMR2lZRldIWS94ZnE2RmtHMTRVdDcyckdITUE4bTAzNGZPanE0?=
 =?utf-8?B?ZlpiTUNGQlJMbXd3b05NRytFVTlaTXNWcndBd1g3L0xiWmRFTDd1QkZHbHJ4?=
 =?utf-8?B?ZWdvNFk0b29hUFZ1U2N0VFowbnRVOXpCUXBTdlpDZ1htRXVrVFBuWVVCeWJo?=
 =?utf-8?B?NzRlbDBKM1FNc1BJTmZWdkpUTUswOCt6aXJtOURzWHRmcFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU13bUgzTDMydlBiTi91VnhVUHpnRG1qdWlGRzZSV2ZVdlh5VG4vTWIxZkgy?=
 =?utf-8?B?Wm5hMUtiTUUrYWtjQVo2VS9Tbi9WeHp6NVlMSVY4TmNROGVpV1ZuTE5FT3hL?=
 =?utf-8?B?YzJKUHVETWVEckJQU3VEazNYbTBDL212MmdSYzdaWEhUNkw1UDN4L2NmSVpM?=
 =?utf-8?B?YmFhM1B5OGd4OCtZY2xVQU0vNnBEVXhvMHhMT0RrZVMvdFRoVVBBeFRMSlJh?=
 =?utf-8?B?MTg3TUIzVUR5dC9EWWc1OHIvaEZuMkcxUGJFTGVEMi9ORmdESk1mNzNMU09T?=
 =?utf-8?B?SERxald2RkxKdlcwWXlsdytVWHMyWG1IV2xnY1NMRW5kR0N3UWlJMCtLUFFL?=
 =?utf-8?B?dWFwcjlWeHZHcGRuTUE0Z2kyNGIwMVZpck1id0pUQmF1WUJwRUdRa1M3TmNj?=
 =?utf-8?B?TmNDcG1tWE5wOHRRazZTN2Z5VmY3c2hqakE1TVIvM0M5SkZ2d281bnhWZEhW?=
 =?utf-8?B?c1UzQWFaeHRlYTBucFZUN1dWZk9ZTC9zUzZ4U3JXb0c0OXRoKzhheEhLYlEr?=
 =?utf-8?B?WVZ6Y3Vwc014dGg5L1lycHY1WFU5UWJYL3hFSHJYVDhWbXpIdklZZVdJeTNk?=
 =?utf-8?B?YnBuQVJZR2NMSzBDRFE0NisrQjQvUThmdmp3Tjl4MTNWcGdQU0c1Um5iVllE?=
 =?utf-8?B?cFZlZ0tJWDFybTlJUU90OE5YN280Tjh6MXRrSGo1TlhxbUpIczZPYzlxWkhK?=
 =?utf-8?B?UHhBLy9SbVJiZHZIdVdGL3hVZ0tKaDBTM0hPRGRBMDZ6MFlLUkxwVWxIRTM2?=
 =?utf-8?B?QXgrb3c1S1l5SmVQUVo5c1hmeTY4VDEyZzhXMnBhNUtpenlZY1Z6SGVMczVk?=
 =?utf-8?B?ZUM2WDA4T25LVy96clEwendTK0hsM25DMnZvby83UEYwTEhHUWt0V2RHenMz?=
 =?utf-8?B?b3FxY29WSXhqZ25JbDRqMEdwdnJJQTlRL1NxVE0yRzl2K0owQ25yTjNWcEF3?=
 =?utf-8?B?MHdRZ2xUbE5kUnFPc01FYzlwQStmdTNvUmQrV2FoMkc2N1AvQzFYN0lyUDhw?=
 =?utf-8?B?TFNWMmpvWXJIVUxWODIvbWNQa3ZINkdTWHk4ZWdwRDI0SnhuRm1zRVpucXdn?=
 =?utf-8?B?NFJMVDhieTl6Zmo5UERobXc3Q3BpV0JUMURISnZCcmI4elFRMkhTNTJCTWxU?=
 =?utf-8?B?R3FYY1dwSFVReGdDdFRUemNUVmxGdW5Jemc4VE9Mb21VNis2M1NUTXcrOHhK?=
 =?utf-8?B?aXVKZnVyQ1BHWEtqaDF5TGpML2k2L3I0NTlPY09QdXhNZjgyYURKak5zdWs2?=
 =?utf-8?B?SGhramdaLy9nRWhYMTFKRE5RYkFLMzFhUkxGNjB1M3FpWkFxeUtIZ1VyazBl?=
 =?utf-8?B?dXdsQ0dXQ2RudUN4K0htNzRPTzYwWnYzSlBvU3huTGlyMzhtZXczcll1MlZM?=
 =?utf-8?B?dU1hT3hkY0d4c3ZPMUhmUEZCWkMwZjdwSmtNYXlQcGtJUm13Q09haDgzSm9C?=
 =?utf-8?B?dUUvUjFjNURJU0lSZjROMXJ6UmVuaDJFeEVzVS9PRFYzTnJwSUtQYlkyMlVQ?=
 =?utf-8?B?aGo1LzBxUTN5d3F5ZzAyVlVmNkhIZ2tvQjFpdEhFbTk0eUcycjU1ejhhOWo3?=
 =?utf-8?B?WHMwN09CWGxmRlNCTHdWQ1RmcDFLVEFxRTlqUExyampYY3p3NHo2V3dOaXJS?=
 =?utf-8?B?UVBuR0Z5NU5YbUNyQ3pPTi9Ya0UzRjA0RlVyQWhvYWFabzJ4dXFKWFJqclpk?=
 =?utf-8?B?RkRLNThsOElyc2UvZlROK2RxVmpmZ2tpY1IwUURmakk0Q01iR3g3NUNETWgv?=
 =?utf-8?B?ZVdGbjlsTUdYTFlsZHNZTGt3c2Z3OXhNcU8rbGJFTiszanlzakVLdWFadDFB?=
 =?utf-8?B?ZXNlUGpHK0RaYWJWR1FlQTlzSXgrYy82bWxtOWlwZVVCQWVBZEtySzl2SjNt?=
 =?utf-8?B?VXFISmFlU25aS2tETGxWUFJxUzYrL0x6T3VUSGd1ME8xUUlwRXg0OHRVUjdm?=
 =?utf-8?B?OWNydUlVRXBrcEhqTkozWTRwSFFtamZRNFNXdk5YM3pkUTlqNjFreEJva2lW?=
 =?utf-8?B?UVFzL010djJEa2NuZUdXcm8wdEpOOUlDRkp4QzNqamR5bDgwZGtic1BwTm9P?=
 =?utf-8?B?UFYyQWRLalU1VXg2Sm50TUVlendIMWNHVVIvOUpsZlhKOWM3ejJxczhDTTlT?=
 =?utf-8?Q?3ha2BnHnvNaxWNKDWOiPbIq4W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19565874-a817-4952-d835-08de16f3273e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 13:57:52.8302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIhR6sY5dIDOtQiq+WFCQXMGdAcwNWW7nZZ828AnuXv0mugyU5U5CQMjosCy+lbG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
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

On 10/28/25 14:13, Philipp Stanner wrote:
> On Tue, 2025-10-28 at 09:07 -0400, Alex Deucher wrote:
>> Looks like this hasn't landed yet.  Can someone push this?
> 
> Pushed it (with fixed commit message) to drm-misc-fixes.
> 
> I had Acked it for Christian but it seems that was lost.

Sorry, been on vacation last week and it took me till today to get through all my mails and back to this issue.

Thanks for taking care of it.

Christian.

> 
> Thx Alex
> 
> P.
> 
>>
>> Alex
>>
>> On Fri, Oct 17, 2025 at 2:18 AM Philipp Stanner <phasta@mailbox.org> wrote:
>>>
>>> On Wed, 2025-10-15 at 16:01 +0200, Christian König wrote:
>>>> From: David Rosca <david.rosca@amd.com>
>>>>
>>>> The DRM scheduler tracks who last uses an entity and when that process
>>>> is killed blocks all further submissions to that entity.
>>>>
>>>> The problem is that we didn't track who initially created an entity, so
>>>> when a process accidently leaked its file descriptor to a child and
>>>> that child got killed, we killed the parent's entities.
>>>>
>>>> Avoid that and instead initialize the entities last user on entity
>>>> creation. This also allows to drop the extra NULL check.
>>>>
>>>> v2: still use cmpxchg
>>>> v3: improve the commit message
>>>>
>>>> Signed-off-by: David Rosca <david.rosca@amd.com>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
>>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>> CC: stable@vger.kernel.org
>>>
>>> Acked-by: Philipp Stanner <phasta@kernel.org>
>>>
>>>
>>> Fire at will, Christian. Maybe optionally with the commit message nits
>>> twirked in we discussed before.
>>>
>>>
>>> P.

