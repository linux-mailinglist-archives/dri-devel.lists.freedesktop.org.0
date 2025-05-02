Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C705AA754C
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 16:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149C410E94D;
	Fri,  2 May 2025 14:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q0IDJ6QT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758610E947;
 Fri,  2 May 2025 14:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF1zdvu86d1yXePmrSBjwndFtibrRRZMLazquZt+AqykbYck/w+YBPGPl7Dxprwb36ifmuwoOhfzmAIgWJXNHuE0Ce9xB7iyHFCNsa9/cxCvuPRDHRScZuUkRudnDBoDKZ8CYwKd69sXIrPQiZLt+gLeJkZDENuW/JL1MtH2HmD+Y7OrGuVBiZxvmFBTFa5G1RUBI0sJ1AggpgKnSH/SgryppiOlk4JPygvxdz7S5WMqm+dqpAY7L5cyy7G46PpoB7mcLaxeVOAUUOhktcwXd/3anxegAhYl6XOyuNTuquK+TAfMZo4gY6JVTysvlPpWbkO2mAsIQXUwVoZt2WXnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkum6hfArGg/3GbExY482sp3keD+gk/VrY+aQIHoDzU=;
 b=tX5DpYGYJ938FNasf8/TDQyg7o1MfsKBdFHs9h6wg1LSHZjz4b48fYjxFH7nryb9/0FR1jNPp3e2kKqiCQimeXhkVyQMLmHVb5hW9I6/8t5nWSg9oy3sNjYUhG9G21w7iMmFNSzZUHXAvBjEVjopNQHzIoM4+mwP7bc1J8E7KRkjCIKN/lJjwna8EtmXmd9SJS0UuB7XIcTzScSWC39ydi0O0bbNwIj4KIYugQc/v7hYR/2uqnT7cs0lllju8DCPs6+C0Am6XJmsdqJP2h6X25lJIFNc1jS9616duAWahCA0vUOEAW7g7E3PLP5X/Tdhi80b2sRee0v5KC6nfJXLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkum6hfArGg/3GbExY482sp3keD+gk/VrY+aQIHoDzU=;
 b=q0IDJ6QT1kbrcFq2wC7vgjeqTyhB0t2VRcT1Mr1NKBif4D8PIUoMbLtg/d/udICau+tRPZDg7LOdxp2A91srahFxminaBQawewW5mMXW6DqsFGLKvZJ1duv0QFrV62W3eiO1Cb04UdBFSyHImJ3zT5sqvcgcYAtfTpYheXQhDt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 14:47:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 14:47:47 +0000
Message-ID: <0c097223-ff2f-4f1a-843d-5feb94ce3c40@amd.com>
Date: Fri, 2 May 2025 16:47:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/2] Evict VRAM after processes are frozen
To: Mario Limonciello <superm1@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
References: <20250501211734.2434369-1-superm1@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250501211734.2434369-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:208:2be::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 907bbe95-20a0-4d27-39b5-08dd89884dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE1hZ2xaeURGckgyUXJnTkM3Z0Q3SUVWUWk3UWlDN0dHYkVlcWFDa3dKb0xZ?=
 =?utf-8?B?bEIvUXpBTUpsUVA3cE5YRCtlaGlvUk1jOGRyUzF0L2ZsZ0FHeVNYTzBrRFJK?=
 =?utf-8?B?ZVB3RXU0cXhqRlhJTy9MZm16V3dSd0RFSklKLzNmTk5UdXJlTmRwYlBDUnl0?=
 =?utf-8?B?MHowUGhYWk1UWTFOQnE1RHpUNmFCVE5BNmlLejROYUZsa3RxSnNCUkxKSTJW?=
 =?utf-8?B?NVFXeGFRcytBWWUvQmdIS2RSajZ2RElkbDlaelhiZFVtY2lqcFFOaithOHEy?=
 =?utf-8?B?cWkzaW9OQWFrVXU0c0tIZnZZYStWNFNqcVFFSGRLMmxDRVBteDVOYnFJVXJ2?=
 =?utf-8?B?clJOVHBjeERYSU5NbkxUeGJZSk1OMUJBYVQrb2tHU3k3YzVqVlgwQnpyR04y?=
 =?utf-8?B?T2hKdS9TQXd6OERoRFlwaDlwTHVJVSthZXBteXNWenRNU2xwNEZQUnVPRlll?=
 =?utf-8?B?Wm5sVWlDMEd2eFBhdnIvcFB4UkU1SmZ5SWNZdnZ4ZDhnRjA5NklnMEc3RWZG?=
 =?utf-8?B?TDJYeHZXN2JlMFFJRGM0NXhuYldyQzBFRTlSeXFyVW1HMnlZZGZITDU3ai9v?=
 =?utf-8?B?UmlrUUNjNmxPZWZJbkpsQnJlY2hUeWJ0eEZDbDFxNllsQUpVU0I1aVZUU2dB?=
 =?utf-8?B?QmVMM0YrRWpCc1lpaUFwSHlSZ2tCTFIvdmRSaFRXVTRoRU5mbVNHZnZWV0dJ?=
 =?utf-8?B?MXVHeW1YMUhMaCtWVXg3Y1V4RHkzSWtJWU1uS3M4NU9vcldMNFJXbWNDQXRa?=
 =?utf-8?B?ZTVzdVVlV2dYYnhISFF5aE9LYUhmblhQVzJhcFRYWmFaUFA1Q3pwbkovV1c3?=
 =?utf-8?B?U29LWXVqejhGRWxQVVFTbDVFZWZ6T000dEdLS0hxZUxLaVpnbDJjQXZSa3hR?=
 =?utf-8?B?amRYbEM5K3dRMFNlRTZkUUpLbmlkR1Z2b3R3enUycmZDdnF5QmI1N3lvcVFu?=
 =?utf-8?B?U2s0YktuaVhPZWFWVUsxTU95Nml5bUplcHpzclFyYno0cnhsK1BIWjMzbzEx?=
 =?utf-8?B?Z292VzQ4b0lhdnA4bmlWL3ZCckNMa2JXQUdFWFQ1aUd4MVpNYzlud3BwejZV?=
 =?utf-8?B?YnVZNU5rb2NRZTZqS0ZvVXhQdXNZTUJjc3hhRVVwMlhkT2xsTUhmbnNhdHFW?=
 =?utf-8?B?emhndG03MTJCeUNNdTZDN1JlZDkzSnd4UmxqdytuZnRQVUlRZkxHYXZZVFNR?=
 =?utf-8?B?WHJEMHd3NjJReGVUSnBQNHYvT2Nucm9TV3FqMHhwZjlXS1NGd24yV0NlSERC?=
 =?utf-8?B?UXltVmxjUVRzY09DVURZVGd1MUI3RSt1VTNrVFFUSWhYL0JYd09QeDhRSy9P?=
 =?utf-8?B?bWg3RVUwSlB3UmNzMTh6akV1cndjN1lONjl3aENuRHRlQnBvL3M2K0dLTlNF?=
 =?utf-8?B?eERkdW9WZ0RzTXNkbVRHdU11SlpyMEhpSExBQlhOYjVwWTh4MVRjQWsvZGZw?=
 =?utf-8?B?cmUyemxFVzhoWXpHU1JhcDZhWnhCSmJmSVc1d1E2YkhGbnRoY3VHbzhiaE9T?=
 =?utf-8?B?WENNcWlmQUQ3NXFibytOVXZjcFZCcVByVVlRK0I5U1pKbzNPODVDNlp4WW9I?=
 =?utf-8?B?NjVRSStpekdMc3hHVk0xa3l4dHFZa2JldkpsWVMvRE1UbExKbDU5OGFUNFhP?=
 =?utf-8?B?TldIQjJLY3ZGMHlQMFk1VnFRWDRURzMzdnA2aTRQbE5XQ0VwbG9Odk1GVFQ0?=
 =?utf-8?B?N0ZiZUFwN0x2ZExRNG14aXNSWlRuVjhNRm44V3BqS3Z2b1dXcDdwc2JvbG11?=
 =?utf-8?B?ODJqSUF6T2tsc3QzK3k4Wlc2ekU4TzZSRk83SHFFcFJtMUVSTzRlRUZwNGpH?=
 =?utf-8?B?ZzFuaXVDeUMxSjJoSjVnU3MrL0VaY3FnYXpEOE9xbENVNFYvMTJ6aTA2RmR3?=
 =?utf-8?B?cjFVY3FTZW1JczN2Yk1sL29kbzBoNnZ1dWxrampqSzgvZTNHKzlLdWdkSndN?=
 =?utf-8?Q?EVSDyQjWal8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1VhSHNuTEFrdnk4UlgwTDMweFBpeU1yWXEydmNmeW9Wbkl5U25PM0pZMmF6?=
 =?utf-8?B?RkRDc2xzblByQjE0RHI5NU8xc0lCaXpqVW1OdHY2ZjB6YUxhYUIyU0Ywcjgy?=
 =?utf-8?B?WGZuNldJQmRqVkhsRGZ2QlAzUW56ZnFxYmMrWVpOaU1aRkVYRFNhMG5zNHdm?=
 =?utf-8?B?bXVCKytFckRBSVpPRWRRM2xwaE1reHYxRHM3cithZ1Z0dldLbGg0U01ReXpy?=
 =?utf-8?B?NEN6SkpKRW0wZGxRd2pjeHgxcnAvb2F1N2YwbEFQSjQ0Q3BhWm9ZOVo5NnVB?=
 =?utf-8?B?eUtBZnROZ0VIYThVZG1vcHRsMHQ0dzdsNHZJSkpEVCtKSStXUFoxQ1B0Z2RN?=
 =?utf-8?B?Wkl6cTNNcmR2TG4vbmhmUTRDKzd2eUxyNk5xQ1psU0tEOUd6S1ZrM01MUEFO?=
 =?utf-8?B?anRCZmRyMytIN2t3ME15SU43MWdoOUFZYnFoL3JKYktRRDYyTzJKY015eFJM?=
 =?utf-8?B?M0tGVWp2Ti90bDByaVFNYjVGVWYxMElYMUwxZ0ZjNEQzQ0FxcEU3dnYvUjRB?=
 =?utf-8?B?TGNxZHNEblI3ZlB4WmJ4dWRiTXN4VUFHbmVxRVZJVDBydTJaaHNjZHFRQW1D?=
 =?utf-8?B?MllQaTJuRHhPd3owMjA3eE1mZ1R5bUJyOWNYSWloSTRxbStRdXFFN3BKclBU?=
 =?utf-8?B?Umh0VWF4OHV3NTFZN3hjL2V0VUs1TzZnREVxVGlsVlYxbnZseU5RTjdyVi93?=
 =?utf-8?B?NHI5MVhORFFaTVdPQllSZzFwSk9ES1RnZC9NZU90Q0dVaFF4N083UEZmcGJs?=
 =?utf-8?B?K29NcDllWG81b0d3MFg0OUlCbi9vZ0FBdmJ4T0RQSFh5L2NuZW1iSXJ0OUww?=
 =?utf-8?B?WWRjbFRVNVJKYy85dDNOK3Z6VzAzekh4UU9zZUdqa1htZFd2cGVyRS9UNWZm?=
 =?utf-8?B?am5Bb3lFM29nZGlxN2Q1T09XVHhuYXh3bkNKTUZtempPQjBmQUNkbGN2M2Ns?=
 =?utf-8?B?M3luNjc1L1dtaHpoTStvUngwVS9qa0lUOC8vMjlEckFVWDk2N1BBREZqV2ZJ?=
 =?utf-8?B?VTVsMnljbkdmWU1hMTljd29sSHc3VEd2N2lFTG8zWmdHNitaNnJmQ295Mm9u?=
 =?utf-8?B?Tk5wcFM0Tll0c1F3Qis4Yno2NEhUdFNtNDQwdjZCYmVPa2E0b3V6NnIrZ0JD?=
 =?utf-8?B?a2U0OEwrM2ZScFVadUtrZGhFUDFzN3VZSG9PUFZkQkJpZnlWRnRNMGpPcGw4?=
 =?utf-8?B?M3lBLzZ0eU5pYWNkTUtkcDQwVk5XSC9RcmJkLzQ4WUJiMW9QVFJ0QUZvMGZ6?=
 =?utf-8?B?ZHZXdXhMYkNxSXRQOGdtN3VpZzI2cURMN091WWovdTBXOEQ4bGJUR3lyOVAx?=
 =?utf-8?B?K0xRMDlDcFlORWpQNlZ0UURSM3BsS2hUcnExUlhXaUlRcXVoajh0L3dWQ09K?=
 =?utf-8?B?NW5SVjhzamNOOHk2UWEvQmpJUlI2VTRJdVBkMXBheVJseENnZmsvbjk1Y0N5?=
 =?utf-8?B?V1Y0aXp0czlQclJ1d1FSZTJ3SHF5dXJuNStWaEhZOTZ6NjJNVnVKOHZCc3U0?=
 =?utf-8?B?WTRJTldseW5tcjI0WFhqU0o0ZFh1N0ZOUE1DNDUrT3loSDBYbC9oUXVPcGE2?=
 =?utf-8?B?ekl1dkRYZVdjQWlyMVlZM20yVmZaVXlLbkRRU3pIMVVXS3dJekZFUjVKRGpY?=
 =?utf-8?B?cSs4eVpnRlNXQzJIcmJpS1UvS3IrbzVrRm5SYllKSEk2WjJOTHpKRzArWW8v?=
 =?utf-8?B?d2F6aGJxcVdZZzJrdUpiRk50VzBOcUpxTjI5ZnpHeEVhU1kzaGZ6a1B3L09r?=
 =?utf-8?B?SGh0Y1pHRmt1ZnFjZnRzYzJKbTljWmwxQ3hCRmhQK0NTcnJQVmdFN3A0UkZo?=
 =?utf-8?B?SXN6cW5nQjV1K3BDdS9pd2RlMzk2RFNCVFBzcmxKZi9VVmp5N2Fybm5mZ203?=
 =?utf-8?B?S1JiNDRhUWQ0c2VDdndmVDBEdlNQdUNnVUJFcTQ1UW1zNzYwYzF1a2FkOTZO?=
 =?utf-8?B?WDdjakZZRjV0OXVUS3lJYVlOR3hZMlRNeDVuYTFnRWs5Q2d6c0lCNGQxaFIr?=
 =?utf-8?B?Q1hSWHR2YkZncFBFKzBXSFdXOGhXdjZGMmlEMS9wTTJyaDhDZlMzbXY5ZGVV?=
 =?utf-8?B?UGFqM1hKZFpQaWQwV1lhQW4xcXp0V0t5TG1XWHQ0aFRIYU02eWxvV0ZOenNa?=
 =?utf-8?Q?dXWIY4cC+egBA/s9ja/o47NA1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907bbe95-20a0-4d27-39b5-08dd89884dcf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:47:47.2289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2+mN5u8GHOulrc7ZFi79XNDvfixDZFoep1hGkuyQiHoQAGn0cpKALYax/SqFQdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483
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

On 5/1/25 23:17, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> As part of the suspend and hibernate sequences devices supported
> by amdgpu will have VRAM evicted.  This has been littered with problems
> in the past, and now it is called strategically at multiple times
> during power management sequences.
> 
> Most recently there were a number of issues reported that were root caused
> to physical memory pressure at suspend time where VRAM couldn't be evicted.
> A new call was introduced using a PM notifier before swap was turned off
> so that even if there are physical memory pressures VRAM could still be
> evicted into swap.
> 
> This helped, but users using older systemd noted that this could lead to a
> deadlock.  This is because user processes aren't frozen by older versions
> of systemd and thus if a game is running it could potentially be creating
> BOs during the eviction thus preventing eviction from ever completing.
> 
> This isn't an issue with newer systemd because it uses cgroup freezing
> to freeze user processes. Nonetheless this isn't a good behavior to rely
> upon for userspace, so this series aims to solve the problem in another way.
> 
> Introduce new PM notifier calls after "prepare" notifier is done AND after
> tasks have been frozen.  amdgpu listens to these PM notifier calls and
> will run the first eviction at this time.

Sounds totally sane to me, but I'm really not deep enough in the PM code to fully judge the implementation.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the patches.

Regards,
Christian.

> 
> Mario Limonciello (2):
>   PM: Add suspend and hibernate notifications for after freeze
>   drm/amd: Use suspend and hibernate post freeze notifications
> 
>  Documentation/driver-api/pm/notifiers.rst  | 19 ++++++++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
>  include/linux/suspend.h                    | 14 ++++++++------
>  kernel/power/hibernate.c                   |  9 +++++++--
>  kernel/power/suspend.c                     | 13 +++++++++----
>  5 files changed, 42 insertions(+), 17 deletions(-)
> 

