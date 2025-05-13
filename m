Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4548AB4A28
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 05:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4036D10E4CE;
	Tue, 13 May 2025 03:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n7dtZMoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF0A10E15A;
 Tue, 13 May 2025 03:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1gPDkEAsts5bE8ovsLnLhxhiB+Q8P4tEZgVmwUbrDl+PR3Wwp7LsnGvc2xb+zNu4B1Y5R3gUBXEs7yiGztTp2rGM+2HQsMqtQnbdJF5DGUPTf2DhOoXuZp/ncIjTgqM9wsfTR5WNAJGmE8UVrsgMAFoYO0IYUWHFyyhJDYJS5jIkQxHlx4KCnVp9rxFWWrzP4MsmaQdYMLRVwChkbCcUGz7KzqUHEfJeKrk88QE68OmA/6Ojp9FyMBSWDZnjNsHztQ/Yjz0O4Oe//SkQGqI+X5NduLUEgWttmMz1u9V4mlWuKaYwefa3cUsaTsT3dRIdZ6Obkm9hyZcUHYVexjKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47TONf6GaHISN/hnUbEBNwEYfIXkMHj4/n7koUpaI/c=;
 b=akAbPLY/BfXUPj0KPH6d10pY5qqEt4DnZRDvg0VNGxXpr6yMcnG+NWYMlkMgDxdm/Ew+sFZUePHjNiKgMAYuFwJR86ll2IDDbgZXkwjtXn+/sYGlLZagWTkxcSirYqMy32St8N3ZDg+mn1EhExJwlk5Kcv466p0LcbS6ODARyHZAZBa6hr30W/VmjdBhVBbi4Swy7UmYrzWJLMg7eXUsNP21i0wcUNVcvl+5dQF+ikVYKNr2zTrHqnCW8h4ohepSZzWxC13EJxQi1gPrTgw8vp6nIQkKQSB7O1/tsGz/Y5hD/IPiZjg6ltbfBt2wKVhwWrbORiw8VCKp0XeNk6sAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47TONf6GaHISN/hnUbEBNwEYfIXkMHj4/n7koUpaI/c=;
 b=n7dtZMoTEc+WFs5U7Osf513ytJUC8SNieq3WBwYcLRlAZkPPhqGzAMUNG3KVxbPnLO2qXHZsR7pEIfNsLaV2vIJzSa4o887PQYEXP/ZsCqQpTfs+qkrsZfzLU7f929dLuOC2fFQm25K2PGaNSLv++mRgLHZYRd5m6bCetL+f5Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 03:29:16 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 03:29:16 +0000
Message-ID: <9ba6b83c-6c29-4149-aa71-bc9f0ea51a7a@amd.com>
Date: Mon, 12 May 2025 21:29:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 42/43] drm/amd/display: add 3D LUT colorop
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-43-alex.hung@amd.com>
 <lyrpq2f7ypi7htircam6o4sd2yfxqnkn4zlre3lbh3ffsbtjcn@onpawcyobyvu>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <lyrpq2f7ypi7htircam6o4sd2yfxqnkn4zlre3lbh3ffsbtjcn@onpawcyobyvu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:907::32)
 To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9ae94a-c322-4528-ff8a-08dd91ce56c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MldJN0pMVSs3bXFjVCtadythSWxLa2ZXS0dlY3pickphc0VDZWJvR2Z6U3VE?=
 =?utf-8?B?ZXJhMzdlaGpCVVJsVEk4TkJtWGxPR2xHR2FaRnpzUEV2Q1h5S2hEcHgrK1Q0?=
 =?utf-8?B?b2ZacnJDdU5JNkdkNTNUbGM2bVZDQW5xQ3d3ZG5GMWVsWW9pWlYrWDkxZFZK?=
 =?utf-8?B?YTZWWnhIRFlrQm00aS9venV6UFJWOGFnWmN4TTdXUXVsWC9IRDg1QzNJSjVV?=
 =?utf-8?B?SzdKR0kveWlDRHhkcFg0cXRrbWIxbjlVMnpjZE5kL2twK1h4TVpDNHE2NGo0?=
 =?utf-8?B?S1BJNjBFL0Q0RFFESTJ0UXg1bWk2N3ErMmRsOHladk4wNGE5djl4ZUIyUWM5?=
 =?utf-8?B?VHVJUDhDY29TTXFpL3ZZNTFPbFpVNWhjYkE0K1ZTbXdmR28yL0JZTGNpazBs?=
 =?utf-8?B?YWpIOVVOM0xFU1JDRWtwR2xjejdWNGdlUzJJR0EzWGtNN0E1eFVUdjlWUEcx?=
 =?utf-8?B?eEdHenBPU3lIY1lvTU9JUGlrczYxRGVXUHpjQXRqWVFQYlBmemNESU5SdjhV?=
 =?utf-8?B?QVRaQWV1RjBHVjNMOFozN0lWSlJvWXFERkJxaWFTZlZPaUZmUkRUc1Z3c2RI?=
 =?utf-8?B?ZDIwallKQXIvY2t3TGpsbFFBY0FFemJQZU16VGEwVjZLY2dsbjEzaGFZNGhB?=
 =?utf-8?B?aGhCb1diVE04emwwVy9oZDFVTzBLNHRLZ2R6SFdWWld0M1h1SndUam9pdVVM?=
 =?utf-8?B?NGl0R21kVHpjRkZkSmkzY0R4L1J2WnNFSndsdExEbHlxRXVlSDRVVS83NDhp?=
 =?utf-8?B?aUcxRWlndWZ6WGE5Z3RjaU9QTU1GQjFxK2RvK0VzWXR1U2xqZ2hFZ1dhVDlI?=
 =?utf-8?B?Z2ZUYmhwV0Zxb1RUbDlxdms2bmZmb3ZKRzV3ejliRkdHRUZibkxZb2hLcTJL?=
 =?utf-8?B?TTVoOHZFanorcTJ5ODhkN0s1NzZUS2xlK3k4aGUzMEVJZDhDeGxDWEhMa2c2?=
 =?utf-8?B?L20xMUQyMG10MG9zZHprS3NsaWRhTEtPNTFocEJnZ014MUZNZ090bXlBQktR?=
 =?utf-8?B?MDM4RWNmU0p6dStSeVlJb3VuMGw2ajRtQmR2Tk9SUS9aODRlTVc4Tm5SaXlU?=
 =?utf-8?B?Yk8xd3FFZWZFUTFvbEd5MGpVZFVaL2VWeTJPeVBoTlEwMlFyNVJ4eTZCN1Vk?=
 =?utf-8?B?YU5qc3hpU2dCVHoxVVdLbXFmc1NRUmtHanBJcStxZXdPRXJzNHhOb0M4M051?=
 =?utf-8?B?c01YTVdEeDU5czdnVHY0eWhEVytUZXVNWGl4cnRza2xCdTAwc2hrZkp0US9o?=
 =?utf-8?B?eWY0anBtUlY4WWxxV2dzVFo2ejVUK05OR1VlWk9vdW1UMjV1bGdoTHFCN1ZX?=
 =?utf-8?B?UXRpekZIV0ttRnY2RUxVZzBsbUtSNHFmWlFPdGdVclVPQms3V3RFWEhhTDE3?=
 =?utf-8?B?Qkh6YzBxTStuRjV0aEYrOVo4VkRkaVp2OElISEdsV1FxWnN3R0s1VGIzMWtE?=
 =?utf-8?B?dHZHV2VjWTF0RUZOUU8weHpqTzN0d2N6a21UeDJPWGdacCtmd3cra2p1MGJP?=
 =?utf-8?B?MUtITTlSTjJZeXdHaFkzN1YvODErRlFWOWs1MWt2bW1oMUxFaUgzNWVISmoy?=
 =?utf-8?B?RCs1SmJla1d5QXA5MlkxTTdsUUlINGU0T3hxTnVPZmFnVVdLblBvQzBHdHUw?=
 =?utf-8?B?aTBnLzE0UUVBeUVzSkxMeVBibk15WU9zRUQvSkZobHFtTUJQc1dEWXdPNzMz?=
 =?utf-8?B?MXFQWERQeHdhL3RMVlZLOVg5OGQvay80UHB2WEx4R055Q2Yzd09SZDA1bmJG?=
 =?utf-8?B?WjUya295azRQbUpBTTBnUjdJR2VqbWJITnB4ay9KbGdPSDd3RGVoQk5hZjRi?=
 =?utf-8?B?UGdyNjNPZmhSMUV2bWpPcEdHUlJiV09LWlF4bndmbk9lVk04eGZKR2ZoKy96?=
 =?utf-8?B?a21JcUhyMytGdGlrb0xUNlFWTWJYQ28zNnd5V0hWS3Q3M09oVUdySXd4elpE?=
 =?utf-8?Q?zMwsO3/FSoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZqQzdnNllYUllWUSs3QnhRV0pEOXlJRWFYVUhoWUw3YVkyMWlCdnk3M0Rz?=
 =?utf-8?B?SDlIQ2p1cHJGUXFPVmhkV2Q3TTE4NE5hUzRGc2d6RjUxZGJkdWdtWFZYUktU?=
 =?utf-8?B?QUdZK2pENGVtcGxMeUF2emMyQ2lnZnBIa3pZdGh4b0N3dlRLL0NJbWlHWWtI?=
 =?utf-8?B?c3ZxTkVKM1lwK3JBK3gyV05MSDdrZFB0YTlzTU9oWnBFNGlRdkQ5T1VNVEx5?=
 =?utf-8?B?ZkVUMnhMV2lpemYvZWIrdEQ1VmYrMllhVFdtNXB6eDJ6WjNuOWVnVHJLa0U2?=
 =?utf-8?B?dlZ4N1psZ2xiTDZmNUFINXZrUHVXd0VnaHdZMDVQZDF5TVhjL0hBRVc4UVBi?=
 =?utf-8?B?M0lvaTdCSlJxVVdtRjZWTmFxZDBpVnl2VmU0dngrK3FET0ZmRUxRdUxTV2Fw?=
 =?utf-8?B?SG83dTkzZXFBWWdJRVZzdE03NkViajVPTmVkalp5NUZ2dFl4bFkvQ21CZGJB?=
 =?utf-8?B?RVEvOHp4Z3ppSWlrSU1VZWRZclZuL3IxS1VJRGtPQm8yNU05WjZ4MUh6U0F0?=
 =?utf-8?B?M08rWWJ3MnE3cVJzWWREd094bWZIZEl4cFkrN290SmV1K1VaS2pRVmd5TytB?=
 =?utf-8?B?NDZmRmN6czFlOVJNN2lDWUtTL2FEWUxtYmYwRlcxMWlaYmhMSVIycTZUbENj?=
 =?utf-8?B?TFgyeEVyOE1vYi9NMG52VzkxWnU5SmswMDNjVUpHS3lwTm9rZGphU3FLR3RM?=
 =?utf-8?B?WDMySWtJVmZRcC9hNjNhUTFMZURRcTJPbzF2UkhwUSs4aDJIYTVlS3FzdUN2?=
 =?utf-8?B?SEJQK2lsa1pGV09yVloxeFpnZkNQaGIzdVcxUkJGc0pqRVo4YVE5R2lncFp0?=
 =?utf-8?B?Y3MrMkt1ZXc0SzYzQ2QweS90Y2w0ejRmcU9aWjlvUzlpSDlMdW9leVpicWVT?=
 =?utf-8?B?cjhMZ3dyN2tvc1ZING1tSlUxaEp6VG44dHpGZGU2cmt0S3RaRkhjOFJocXMv?=
 =?utf-8?B?V2E3aGNMN0JBV29oQ1BpNDlreUptZ3BSclRaak5vbkZ0dUpjSXZReHBINWk4?=
 =?utf-8?B?OEVyRGNneGFmVWc0bEZWbFlBZFQrdVc1SVh2L0VZMXZmNi85M1JJd2ZUZnBw?=
 =?utf-8?B?M0VwQnVFY0JIV05wS1dhSGxYWnZtcUZ6cG9WT2k2Z1g2dTcxaFhlNjRpVkJm?=
 =?utf-8?B?RTAvMzB2dDNQUVFjb1NqYU1YTnRaa2xKaU1WTW12WGdQNnZCV093QU5mRmRJ?=
 =?utf-8?B?WnFaNnhOSlFUMmQ1VG9lVEF2cHBRTGJJczJOWk14QjBnWVRoV1diQmZDS1gx?=
 =?utf-8?B?UmF2T1BJNlNGdVNpWm9PQzEwdTBvaDJrK1lNN212RloyU1RaWUUyUkgrUUky?=
 =?utf-8?B?cmtBeWFtenBRVUFDbVRIVWQ0WGJmeWlaMjlYUzlsQm0wSFpaS0pZR085RXZZ?=
 =?utf-8?B?Rjg3M1FDVE1WVEFDNUpPR3BrS2I5d2czY0hJUDZTaE83WTg4bnVsM2VCaUk0?=
 =?utf-8?B?Z0RkcVpybjZVYUdJdElPOHMyQ05BbzBzdCtYL011ZlVtU0hBaFNOdkhUcitO?=
 =?utf-8?B?UkhWSXpwY2REazVhdXlpSTJPdUNtR1lFSzlMM3kvZ2J1ZitIelczMjFXK1Fk?=
 =?utf-8?B?eXlQYkFvUjY5YVgrNFFyZ2lIanBhTmI5UHV5cXgvY0FaMytGMmhBUXNQSXUy?=
 =?utf-8?B?R3VoZE00VDBKb3VLSEczN0I3eXowTk9GQjJBcllRTnE4YWlIVVE2eVUwWU45?=
 =?utf-8?B?ZGUzRjk3d1dYSEtlY1NpUU5rYWJtNExteDlvRS8vNGR6UU5hYXJMN2p4NFFn?=
 =?utf-8?B?ZFRIV1ZZVUVTM21MR2NyVmlHQU52d0oyZ1ZGOTR6ajdaOFVnbU9vemFXbUg4?=
 =?utf-8?B?QnAyNDg2TDVkeWRLd3dZd3FRTXdHSmRrMVpVZXBzbHV4L2xIODFIMERjY3ZV?=
 =?utf-8?B?SGZHQTBzb3VFcmlqc0VrY1EwczRNRW5IZUp3Y2R2cFpaaEdhWXk1alZqYnox?=
 =?utf-8?B?MGZnWEx4cGdGSEhYMUplb1dscXFjOWJKMkJzLzJ6NkVudmRBYi9WcHJ1eEpz?=
 =?utf-8?B?UFgwNERZK0xZaysyTHBFVzBXVHMrRWVrYnJ3NUVadzU2UnNvVlBDWjFJbVNE?=
 =?utf-8?B?SERJUnpGWmlSTGhCa1JBQkJnZWk1ZXJ0UUdpd0xIamtuYnFCc0YxMW5hMVpE?=
 =?utf-8?Q?7zWh2wuOA45xeaDMDUmh9yS4a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9ae94a-c322-4528-ff8a-08dd91ce56c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 03:29:16.4688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBuZ3pQ4C1zswq0r3xo9GuPSLByZcP5pO/XAbWYHjJo9MYQ4NCMsAuZsBP5h24lari2DLEgGBH99rDt+hA8qVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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



On 5/12/25 18:52, Melissa Wen wrote:
> On 04/29, Alex Hung wrote:
>> This adds support for a 3D LUT.
>>
>> The color pipeline now consists of the following colorops:
>> 1. 1D curve colorop
>> 2. Multiplier
>> 3. 3x4 CTM
>> 4. 1D curve colorop
>> 5. 1D LUT
>> 6. 3D LUT
>> 7. 1D curve colorop
>> 8. 1D LUT
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> ---
>> V9:
>>   - Return a value in __set_dm_plane_colorop_3dlut
>>
>> v8:
>>   - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
>>   - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)
>>
>> v7:
>>   - Simplify 3D LUT according to drm_colorop changes (Simon Ser)
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 94 +++++++++++++++++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 20 ++++
>>   2 files changed, 114 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index 313716f2003f..dfdd3f557570 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -1293,6 +1293,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>   	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>>   	const struct drm_color_lut *shaper_lut;
>>   	struct drm_device *dev = colorop->dev;
>> +	bool enabled = false;
>>   	uint32_t shaper_size;
>>   	int i = 0, ret = 0;
>>   
>> @@ -1314,6 +1315,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>   		ret = __set_output_tf(tf, 0, 0, false);
>>   		if (ret)
>>   			return ret;
>> +		enabled = true;
>>   	}
>>   
>>   	/* 1D LUT - SHAPER LUT */
>> @@ -1345,12 +1347,93 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>   			ret = __set_output_tf(tf, shaper_lut, shaper_size, false);
>>   			if (ret)
>>   				return ret;
>> +			enabled = true;
>>   		}
>>   	}
>>   
>> +	if (!enabled)
>> +		tf->type = TF_TYPE_BYPASS;
>> +
>>   	return 0;
>>   }
>>   
>> +/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
>> + * @drm_lut3d: user 3D LUT
>> + * @drm_lut3d_size: size of 3D LUT
>> + * @lut3d: DC 3D LUT
>> + *
>> + * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
>> + * on DCN accordingly.
>> + */
>> +static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
>> +				uint32_t drm_lut3d_size,
>> +				struct dc_3dlut *lut)
>> +{
>> +	if (!drm_lut3d_size) {
>> +		lut->state.bits.initialized = 0;
>> +		return;
>> +	}
>> +
>> +	/* Only supports 17x17x17 3D LUT (12-bit) now */
>> +	lut->lut_3d.use_12bits = true;
>> +	lut->lut_3d.use_tetrahedral_9 = false;
>> +
>> +	lut->state.bits.initialized = 1;
>> +	__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
>> +				lut->lut_3d.use_tetrahedral_9, 12);
>> +
>> +}
>> +
>> +static int
>> +__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
>> +			     struct dc_plane_state *dc_plane_state,
>> +			     struct drm_colorop *colorop)
>> +{
>> +	struct drm_colorop *old_colorop;
>> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>> +	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>> +	struct drm_atomic_state *state = plane_state->state;
>> +	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
>> +	const struct drm_device *dev = colorop->dev;
>> +	const struct drm_color_lut *lut3d;
>> +	uint32_t lut3d_size;
>> +	int i = 0, ret = 0;
>> +
>> +	/* 3D LUT */
>> +	old_colorop = colorop;
>> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>> +		if (new_colorop_state->colorop == old_colorop &&
>> +		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
>> +			colorop_state = new_colorop_state;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
>> +		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> 
> I wonder if this check is no longer accurate in DCN versions with MCM
> (MPC only) 3D LUT caps, such as DCN 3.2 and DCN 4.01.

The current goal is to validate on specific fixed platforms. We will add 
more platform-specific implemenation when we enable this on new DCN 
hardware.

In some case, new hardware may have a different color pipeline. For 
example, there can be no DRM_COLOROP_3D_LUT colorop in a color pipeline, 
and it is not necessary to check DCN versions. In other cases, we will 
need to check different DCN versions or different flags for sure.

> 
> Also, looking back those patches that introduced shaper and blnd tf and
> luts, I don't see similar validation, but IIRC shaper caps directly
> depends on 3d lut, for example. IIRC something around blnd func caps
> also changed in the above-mentioned DCN versions.
> 
> Melissa
 > >> +			drm_dbg(dev, "3D LUT is not supported by hardware\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
>> +		lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
>> +		lut3d_size = lut3d != NULL ? lut3d_size : 0;
>> +		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
>> +
>> +		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
>> +		 * with TRANSFER_FUNCTION_LINEAR
>> +		 */
>> +		if (tf->type == TF_TYPE_BYPASS) {
>> +			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> +			tf->tf = TRANSFER_FUNCTION_LINEAR;
>> +			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> +			ret = __set_output_tf(tf, NULL, 0, false);
>> +		}

shaper / 3dlut dependency is checked here.

>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int
>>   __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
>>   			     struct dc_plane_state *dc_plane_state,
>> @@ -1522,6 +1605,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>   	if (!colorop)
>>   		return -EINVAL;
>>   
>> +	/* 3D LUT */
>> +	colorop = colorop->next;
>> +	if (!colorop) {
>> +		drm_dbg(dev, "no 3D LUT colorop found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* 1D Curve & LUT - BLND TF & LUT */
>>   	colorop = colorop->next;
>>   	if (!colorop) {
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> index 10b3e3906461..e90774294971 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> @@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
>>   
>>   #define MAX_COLOR_PIPELINE_OPS 10
>>   
>> +#define LUT3D_SIZE		17
>> +
>>   int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>>   {
>>   	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>> @@ -145,6 +147,24 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>>   
>>   	i++;
>>   
>> +	/* 3D LUT */
>> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +	if (!ops[i]) {
>> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
>> +		ret = -ENOMEM;
>> +		goto cleanup;
>> +	}
>> +
>> +	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
>> +				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>> +				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +	if (ret)
>> +		goto cleanup;
>> +
>> +	drm_colorop_set_next_property(ops[i-1], ops[i]);
>> +
>> +	i++;
>> +
>>   	/* 1D curve - BLND TF */
>>   	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>>   	if (!ops[i]) {
>> -- 
>> 2.43.0
>>

