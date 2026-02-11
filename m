Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNYVLkv9jGn4wgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 23:06:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC01127F42
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 23:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F110E662;
	Wed, 11 Feb 2026 22:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UEgtEYbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6DD10E662
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 22:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcxVEjmKNkIj/smY04d936h6UeNtPMN3CnSmdAT1bZVnG0IhYiIHVNJ2u0g4c4PsdpAz3YSC/DpZJYigMDtJNP1eiLjKdFxY82r5bOv9+a0h370BembHZf88JRpM/uYsMSXpDN/G7LIvcKo2cYccGmecc2UfeAc0bT3puPjPTAz9+Jposv90QrrdYYS5KWqcHK/F2UkttgYow6iA0II1S12jaSfsIHfZnqQp58LGFyeHYM9TnZdgQafujDWquVaZHIEIq3FmaJCiknZOJekdCYC8XK/tttERQnN1y5A1pEEqgManduUYw0Es5URcmxmhyJPQkDXEUuSbu53jDVYwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsG2tTb6y1hj4elsUO/WdWu67fHkAWdpNbHqV4qXpbY=;
 b=wZx2GqUDXSi6WqfpdAH/Bk+EuchJXquk8VxrIFBxbGNez27uGZeM4ZfWlwI2j9BYSlHaJsmspEPIkeL6I54NUXmqab/j2TyGJHOt4n6QJpNGTMpNF4zXJyG7V0Wd7pN3YgRv08h2QTn9EAq5D8+RDmq0TuBo3Lfsb/27y8bvSwZJte6VG30/ghAwqMY8crcVMDzfbQ+8hgkT8cK0o17APn+SNd6UoskDgYhAjkgO9WevXC74iLJevt+kap1qQngq1minUiXBPjFgjBCIzK9eoX01fGtw+i5HSgKQbXnQl8mDctIHOaKntB3xmxD+dAwccaYVtmPw45yPa+iWv9gPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsG2tTb6y1hj4elsUO/WdWu67fHkAWdpNbHqV4qXpbY=;
 b=UEgtEYbNIQ4UDsfym4zSBNfT6xIa3V9uEisOonI158dcBta/8C7WBAZpRCnuUEOAx0y+UbWQyMoREPy5qR+yty97ALptJaGmOoQ/MkbrZOA1zCZ5t2rQvEZGniPvLzJC5+khg3pltjnmQbh0O5kxasLeGydJ3N2CBNoBAD895kM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 22:05:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 22:05:53 +0000
Message-ID: <20cdfe29-403c-4093-9aad-55639a53a0c5@amd.com>
Date: Wed, 11 Feb 2026 16:05:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix dead lock for suspend and resume
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260211204644.722758-1-lizhi.hou@amd.com>
 <5fae036f-1ce6-4276-9376-b26209d2a67f@amd.com>
 <ade9f2b8-3bec-77e2-d5ab-6850a7ee3f9b@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ade9f2b8-3bec-77e2-d5ab-6850a7ee3f9b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0159.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5dea04-5000-4041-bd38-08de69b9b941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDQ2cGxZdlRNdHM1dkh2OS92ZU9ObnJ0ZDJmNThkU3NQKzBSTW8yTFZRVTEx?=
 =?utf-8?B?OW5YVThIajNtZVExYmtGNVBTZ0hweXI1VnpCbmpwR3R5QkNHNjNRWk96UUVj?=
 =?utf-8?B?aUJKeEd1UmZOTWNlTUgzVUlXY0htc3hOUDdRUjlna2lZTUZ0VStDSFlYdVM2?=
 =?utf-8?B?a05XVmpxaGFPZG1UdXJlank0VmZOMW9ObFE5dHJwTzdhN0cvTFI0S2lRbEpV?=
 =?utf-8?B?TWJmNWUyK2R3NEhnTUkwVExad1hxZG5BaW5KS0ZjYUhGMTVwK25zMEV1cE94?=
 =?utf-8?B?cjlQQk0vZDZxSVgzSHpxa0d6THBPMDN0N3NabUJMNGxIZXorLzE0eFBSOEN5?=
 =?utf-8?B?WmwyclRlenp4ejhKaC9vNFlIOEM2T3RUeU91M2JyL0RFQm1nQlZ1bjZIOWlQ?=
 =?utf-8?B?aHVYc3ZiQ1ZoQ3MyK2NZaCtXQjBRUVBVZmY3ZllhUXJnMm9ScHNtWXA2OHd5?=
 =?utf-8?B?b0IyMXBxY0IySWVkeDJqVWhGenZvZGdHSkRxNHBKNlZvQTFrd0lRd2FnaGRL?=
 =?utf-8?B?ckRUdGtvRzdJMXVha1RRNTJvczV3TFV1ZjM2RkxkSENERnZhekV6ZS9MN1Rm?=
 =?utf-8?B?VlBXQklVb1UxZjZsUHhoUVpsOVo3bU5uMDFBYjF3dW96eEhMdzB5MXVBZDd6?=
 =?utf-8?B?dGViaG9zYko2c2hDbldOVjRVZjBvbjJtK1JwdnpkQm1DY0NVa29aVzNBTGgr?=
 =?utf-8?B?TjR4YTFIekoyTFZKQTJzdjdGZUJjbnNGSUMxaUFmQmgxUWtONXJnempmdjBr?=
 =?utf-8?B?MHlMS3lYMEYvSmw5RDdBOVVDZHBvQy9mczkrYnlvc2NvUHBLTmNwNkpEUXMy?=
 =?utf-8?B?RkxncVlNZDNlbE5HS2JVQ3puaGZFMUYrbUV0bTlWRk44dTdWemdYVTJweGdq?=
 =?utf-8?B?Vm9Pb2lGdml0R0xBRVo0bTNxQlZVQW93Ums5UHRyM0RGaWtCNE9KZlZqN3Q5?=
 =?utf-8?B?VnNobXRNMElaQ1JudHRjS3daVVNpREs0NEU5ZEtRVkFINmVBeXZYaVc5MFF4?=
 =?utf-8?B?cGdXYzZ5dzRmTFBTR3JUaVZzYWpJOWdsSndwVXBoZElrVHlWS2tUMFkzVHh6?=
 =?utf-8?B?V0tIbWxnV2J6MUVBbmVMTEhOL3J5bFlGUXRueDF3OEpMYmtjSmtISENiS08x?=
 =?utf-8?B?azlrMlZnWnFqU3JXOXhuZFNQeWRzaU5wa1hiSXQrdDJzYXdUcGFrOVBqU204?=
 =?utf-8?B?bXp2T0wwUnNPblFLaGUrbnhvWCs3aldwT2djSmVVVm51eVdGalZHWkFXRnRV?=
 =?utf-8?B?bnVwSmNKMHljSE9xZW03NUlGZmxxcnJnWkQ4emZWeXlMVmRjZGs3ci9PNGxE?=
 =?utf-8?B?aENJVWV5RFhnZGpKbXdROWFySWpkWEJrZUZERUlyclNZRXRZVWhJTStxMjcr?=
 =?utf-8?B?cXU1MjlpTXgvQlRoS1l4UDZVU0U0elNRcXdmSXBQa0pwWTV6SW1NT0svNnBP?=
 =?utf-8?B?dUxIOWxCY201Z2dVUzhYUkpaY09mWmRtcHJwclNQcklCMnE1VGUxWVlQMXNt?=
 =?utf-8?B?ZVhPRVBMZmpsTEhLWERFUWhmRUg3d1V0clZzQmxPdlkxUnZqYlNCYjY3SXJs?=
 =?utf-8?B?eHlEY3lHYVJOaTNscDBVaU1va2hUaXc3UlJIeUpzNEZEV1VYRFp5Y0ZKRVRV?=
 =?utf-8?B?R2dXUkNyUGhGZFZzaytlV1Y3SC9tTmhVS1lKR0lhZ1FSYzR2STFVbmsrMmFH?=
 =?utf-8?B?K0s5SVRxN0tWRUx4eHJrdEpGdE1DakRhVWEzbjA1NkxqR1k4TmVjZG54Wngv?=
 =?utf-8?B?WEZleHR5NHZFVFNWWTZhRzNLZnNFTXNBbU9sY2FCUUh4dCtKdStJZzNqRWJl?=
 =?utf-8?B?b1gwVWZvSkRQMW5QUFREQklJMjhwY0VRRHJkNkJ5aTlzTlZ0WTlrQ1dtcjJI?=
 =?utf-8?B?RkVmVzhOcW1Gd29LU1hFSmw5bVNHUWtUVFVtMXV2Z0NRa0hGMkNzSm9hMkVv?=
 =?utf-8?B?d09QRWl5c0xONzZaWGhTTWZXQ29Pejc5NG0wRlFLUWpaamVPUlJSVDlmNHRw?=
 =?utf-8?B?MjExSUhsM1ZQVDcvTVdSWTdmY0FqSkN0NXJPL3hEM1FLM3VjYUEyZEVYT1VN?=
 =?utf-8?B?OGsva1RRLzhhZ3JhSWFSQXFBaFhzaVNlazhQaFJuajhQQURYVE5IeVY0VmVl?=
 =?utf-8?Q?X1LY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ano2ZUs4by9FVDRaYzdrY04wQnpyQWlpNEsrT3FZN2pib3BMSkdOTFhPc3lq?=
 =?utf-8?B?OWFsS083eVJNNzhIWk1nYTNreWpWQWZTS3E2R2txMzZNUlRvUjJZd3JhdmdM?=
 =?utf-8?B?bXcyYkNkTW5ZSlREaDJYbG1RUVFVbkh6Z1RTdDdibUN2am1NSzV0ZHFRQW45?=
 =?utf-8?B?MDlacE9ySStYd2JJL0MyZnVqcnZTR3ZkRlRJbisrOEZJWVVBMHdXZEFTeU5s?=
 =?utf-8?B?UEt4ZUNNVEovLzZkdHhPUEYxekxJY2VQNVBUMXFJMnVUZmh6NUY5d0ZVK0Ir?=
 =?utf-8?B?RERwRjlDSU5mOFoyU3ZzaDhMT1NMeDRmL0QrdlNBTWNwQ0NBeEx6Zjg2Z0Q1?=
 =?utf-8?B?L3ZkTHB5cTVZZUlQc3pZWjNod0wyekF4eE1xVEFJUkdBSWZtN2p0YlhtaFpO?=
 =?utf-8?B?ODRKMHQzUjQ3Vm4vOHI5ejBGK1cxa29yMUJiZkNPMTFZYTltWGdUV3VnMm1k?=
 =?utf-8?B?TVpMNzZZZnU5RzF0NnpnRnhKWTFCd2xQREwzTElxMW44QVNvS0FmMG9LZDZl?=
 =?utf-8?B?cnNZK2J4cXVkU0haTmQ5UE1vcHoxM0xtMCtKTG51d0hqN0hRWGR1UUh4R04x?=
 =?utf-8?B?ekVvMGdvMWo0YnFWY01UN0s4RkdTeVdiaXZ2alNLZW5ITDVXZ0Flb09BOXM2?=
 =?utf-8?B?Z0MzYkI3L3l6ak1xZzU1R1lUUGFWUXE3c21xcUw3VEdaQ1hOT2hiYmIyL3d5?=
 =?utf-8?B?K0dML1NRMTZZUWE3OVF2ZHQwdzlDM1l2Y2lFWUZhdTNqNjZqNGlwcFZ5dENF?=
 =?utf-8?B?YXRjTE0rYTJvbk11bmMrZU51T3VwWDRtcU9ubm5nQnZyK2J3WldXTW5JamhK?=
 =?utf-8?B?NlNTbG9QUERtblBDNU5jT3Q1c050bVFtbGE1SkxaWDhMZWJYKzB4V3kyR2dV?=
 =?utf-8?B?VWl6dHgzY3UxZCtjUnhDYU4rMHpsaExDREwzQ2poNEd4cWF6VlJwNkxpMWhp?=
 =?utf-8?B?VkFjMU10bXZicVpNWGZ4RVlGend3Tlh0dUNWbWJad2pWS0pQTHpHYWNrUFpQ?=
 =?utf-8?B?dWl2TGVIWkkxM09TUGZISlJvc05OTXhreThBaVlFayt5VGllcjJYcEsvL1A2?=
 =?utf-8?B?UWRncXpJWXZQWThWNkFWUmhjSTZ3bCtWUFhGamFBYmhoL2srRHRNRkpnN2RN?=
 =?utf-8?B?WGZuTzIxckJ4cmoyZ3JkSkUyUzhuVERUZ3JjU1RIRW1NWm9FZFVHNWVnZE4v?=
 =?utf-8?B?Ty9SUTI0NDlOd1UvTmpreHVSNVVhOFkvZUtFWDZxQUd0WFlWdnF6eE5ZMkpp?=
 =?utf-8?B?OVZBMDVPdVN2QWRKSi93cUZUK1MyRDFqVlY2QS9laEpSRkFtd0Z5ZVkwOGls?=
 =?utf-8?B?Wll1UVJBd0VWS2ZadXl2ekFGc2dsWnlxTkVwOTVvWFNqUXY5UGRmeW45K0ZM?=
 =?utf-8?B?WnNwZlA2dnVGbnAxN0w1ODg0bndWekhseUwxenJ6RGtuWGc1M0dXSkJDblFE?=
 =?utf-8?B?NVRDV2pGWHp6bGExdm1SMVVNaXNTNWNVS0EvdUlvV2V5eEpFQlIxYVlmSlNM?=
 =?utf-8?B?NVlPa3JSdmdQU1B2M2IxblUzWGlBSzVWcVl2Q2VMNTNZN1lpb21menlJNlFC?=
 =?utf-8?B?YXo4SWxVNjlvbXpTRCtzakhNRzJ4V1diM0NaKzMwSEE1N0ZhcERWUnpiT0pq?=
 =?utf-8?B?a3h5WU5PTlZOZU9FVlYvSXNsQVZJbWI1V3NqUW1jNUVoK1MyekU1YXlnYWFY?=
 =?utf-8?B?bUJqWktmMldJeFBQM09EWXBGZHFTNUttQWVLcHUrYlZMZTZETlZMU0JuSXYr?=
 =?utf-8?B?ZlJmaUNYMkJYRTZoOUwxamgvdVBhWEc2ODJNTG03ZGVNRjI1bjN5M2s4SkZ5?=
 =?utf-8?B?OFFSb2h1bi83ZGp2U2ZXWEk0RHAwMXY0Z2tDM1p4bHp4MCtRb0tWTCtuZk0x?=
 =?utf-8?B?cmV3Z2ZUekVlWFdOTzNBU0FvU2xnVDVMeHlXTk5UMnNncXFhaXU0QXNOQzQ3?=
 =?utf-8?B?Sk8yRy9GSk5nOWh0dXE3VGtDNUlHTU9wMGUzemVDVGxlTEc0YWY5dW1PNFJZ?=
 =?utf-8?B?MVZqbGtXTlp1cm50LzM1TTBXTTZmRE5TZ2NZbGVGOGpDd0NVWUdoaUJqMVNJ?=
 =?utf-8?B?RnFlK2twZ243RVZxSWwvOWVJV0h4d29RSWV4Z2pEcHpZQ0ZEbUdmb0VDcGxD?=
 =?utf-8?B?emFIeFJmaXBmRFh0UElVNlNUVGZONTRjQXFZSXhDYnpkd1RScW0rTEZVK1VH?=
 =?utf-8?B?ZG9UbE1Va0p0NU9rSFJzeDY0OFdlenR3djZ4M3U5MHllSHlUQzZweXZ5QUUw?=
 =?utf-8?B?M3FYaDZBOHZYbG5tNjZNMnBKNWNXRVJaVXVFWHYyV0Zla2w2cTc1eXNnVEp6?=
 =?utf-8?B?Y0VIZHd3dTJPRCtKOVhnSFQ3d2cwakVTQjBXS0tJUHB5WDV3elJ5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5dea04-5000-4041-bd38-08de69b9b941
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 22:05:53.2884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKRnmPwBrVeExerni/mJnf1sGU7l2FW8ccPMEflggCUWcGkS0/wbuf6p9caP1Og/C6z35JG4IrO7NF2iHu5qJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 0BC01127F42
X-Rspamd-Action: no action

On 2/11/26 3:59 PM, Lizhi Hou wrote:
> 
> On 2/11/26 13:54, Mario Limonciello wrote:
>> On 2/11/26 2:46 PM, Lizhi Hou wrote:
>>> When an application issues a query IOCTL while auto suspend is running,
>>> a deadlock can occur. The query path holds dev_lock and then calls
>>> pm_runtime_resume_and_get(), which waits for the ongoing suspend to
>>> complete. Meanwhile, the suspend callback attempts to acquire dev_lock
>>> and blocks, resulting in a deadlock.
>>>
>>> Fix this by releasing dev_lock before calling 
>>> pm_runtime_resume_and_get()
>>> and reacquiring it after the call completes. Also acquire dev_lock in 
>>> the
>>> resume callback to keep the locking consistent.
>>>
>>> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>> ---
>>>   drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
>>>   drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
>>>   drivers/accel/amdxdna/aie2_pm.c     |  2 +-
>>>   drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
>>>   drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
>>>   drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
>>>   6 files changed, 26 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/ 
>>> amdxdna/aie2_ctx.c
>>> index 37d05f2e986f..58e146172b61 100644
>>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>>> @@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>>           goto free_entity;
>>>       }
>>>   -    ret = amdxdna_pm_resume_get(xdna);
>>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>>       if (ret)
>>>           goto free_col_list;
>>>   @@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct 
>>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>>       if (!hwctx->cus)
>>>           return -ENOMEM;
>>>   -    ret = amdxdna_pm_resume_get(xdna);
>>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>>       if (ret)
>>>           goto free_cus;
>>>   diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>> amdxdna/aie2_pci.c
>>> index f70ccf0f3c01..5b326e4610e6 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>> @@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>>>   {
>>>       struct amdxdna_client *client;
>>>   -    guard(mutex)(&xdna->dev_lock);
>>>       list_for_each_entry(client, &xdna->client_list, node)
>>>           aie2_hwctx_suspend(client);
>>>   @@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client 
>>> *client, struct amdxdna_drm_get_i
>>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>           return -ENODEV;
>>>   -    ret = amdxdna_pm_resume_get(xdna);
>>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>>       if (ret)
>>>           goto dev_exit;
>>>   @@ -1044,7 +1043,7 @@ static int aie2_get_array(struct 
>>> amdxdna_client *client,
>>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>           return -ENODEV;
>>>   -    ret = amdxdna_pm_resume_get(xdna);
>>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>>       if (ret)
>>>           goto dev_exit;
>>>   @@ -1134,7 +1133,7 @@ static int aie2_set_state(struct 
>>> amdxdna_client *client,
>>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>           return -ENODEV;
>>>   -    ret = amdxdna_pm_resume_get(xdna);
>>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>>       if (ret)
>>>           goto dev_exit;
>>>   diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/ 
>>> amdxdna/aie2_pm.c
>>> index 579b8be13b18..29bd4403a94d 100644
>>> --- a/drivers/accel/amdxdna/aie2_pm.c
>>> +++ b/drivers/accel/amdxdna/aie2_pm.c
>>> @@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, 
>>> u32 dpm_level)
>>>   {
>>>       int ret;
>>>   -    ret = amdxdna_pm_resume_get(ndev->xdna);
>>> +    ret = amdxdna_pm_resume_get_locked(ndev->xdna);
>>>       if (ret)
>>>           return ret;
>>>   diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/ 
>>> amdxdna/amdxdna_ctx.c
>>> index d17aef89a0ad..db3aa26fb55f 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>>> @@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>>> drm_device *dev, void *data, struct dr
>>>       struct amdxdna_drm_config_hwctx *args = data;
>>>       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>>       struct amdxdna_hwctx *hwctx;
>>> -    int ret, idx;
>>>       u32 buf_size;
>>>       void *buf;
>>> +    int ret;
>>>       u64 val;
>>>         if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
>>> @@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>>> drm_device *dev, void *data, struct dr
>>>           return -EINVAL;
>>>       }
>>>   -    mutex_lock(&xdna->dev_lock);
>>> -    idx = srcu_read_lock(&client->hwctx_srcu);
>>> +    guard(mutex)(&xdna->dev_lock);
>>>       hwctx = xa_load(&client->hwctx_xa, args->handle);
>>>       if (!hwctx) {
>>>           XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client- 
>>> >pid, args->handle);
>>>           ret = -EINVAL;
>>> -        goto unlock_srcu;
>>> +        goto free_buf;
>>>       }
>>>         ret = xdna->dev_info->ops->hwctx_config(hwctx, args- 
>>> >param_type, val, buf, buf_size);
>>>   -unlock_srcu:
>>> -    srcu_read_unlock(&client->hwctx_srcu, idx);
>>> -    mutex_unlock(&xdna->dev_lock);
>>> +free_buf:
>>>       kfree(buf);
>>>       return ret;
>>>   }
>>> @@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct 
>>> amdxdna_client *client, u32 debug_bo_hdl)
>>>       struct amdxdna_hwctx *hwctx;
>>>       struct amdxdna_gem_obj *abo;
>>>       struct drm_gem_object *gobj;
>>> -    int ret, idx;
>>> +    int ret;
>>>         if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>>>           return -EOPNOTSUPP;
>>> @@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct 
>>> amdxdna_client *client, u32 debug_bo_hdl)
>>>         abo = to_xdna_obj(gobj);
>>>       guard(mutex)(&xdna->dev_lock);
>>> -    idx = srcu_read_lock(&client->hwctx_srcu);
>>>       hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>>>       if (!hwctx) {
>>>           ret = -EINVAL;
>>> -        goto unlock_srcu;
>>> +        goto put_obj;
>>>       }
>>>         ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, 
>>> debug_bo_hdl);
>>>   -unlock_srcu:
>>> -    srcu_read_unlock(&client->hwctx_srcu, idx);
>>> +put_obj:
>>>       drm_gem_object_put(gobj);
>>>       return ret;
>>>   }
>>> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/ 
>>> amdxdna/amdxdna_pm.c
>>> index d024d480521c..b1fafddd7ad5 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_pm.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
>>> @@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
>>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>>       int ret = -EOPNOTSUPP;
>>>   +    guard(mutex)(&xdna->dev_lock);
>>>       if (xdna->dev_info->ops->suspend)
>>>           ret = xdna->dev_info->ops->suspend(xdna);
>>>   @@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
>>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>>       int ret = -EOPNOTSUPP;
>>>   +    guard(mutex)(&xdna->dev_lock);
>>>       if (xdna->dev_info->ops->resume)
>>>           ret = xdna->dev_info->ops->resume(xdna);
>>>   diff --git a/drivers/accel/amdxdna/amdxdna_pm.h b/drivers/accel/ 
>>> amdxdna/amdxdna_pm.h
>>> index 77b2d6e45570..3d26b973e0e3 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_pm.h
>>> +++ b/drivers/accel/amdxdna/amdxdna_pm.h
>>> @@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev 
>>> *xdna);
>>>   void amdxdna_pm_init(struct amdxdna_dev *xdna);
>>>   void amdxdna_pm_fini(struct amdxdna_dev *xdna);
>>>   +static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev 
>>> *xdna)
>>> +{
>>> +    int ret;
>>> +
>>> +    mutex_unlock(&xdna->dev_lock);
>>> +    ret = amdxdna_pm_resume_get(xdna);
>>> +    mutex_lock(&xdna->dev_lock);
>>> +
>>> +    return ret;
>>
>> Like the other code you added in this patch, couldn't this be 
>> simplified with a guard(mutex)?
> 
> This is unlock before resume_get, then lock after. guard(mutex) might 
> not help here.
> 
Oh right; it's reversed.  Agreed!

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> Lizhi
> 
>>
>>> +}
>>> +
>>>   #endif /* _AMDXDNA_PM_H_ */
>>

