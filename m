Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F383E9F3D28
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6169310E2DE;
	Mon, 16 Dec 2024 22:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dkb4yC7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0C010E7D2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s364J4v5zNDZ/sHNClYWupQEvCvrtKim76B1V3+1IIDWsuzF6iMy/40anDGNQSdAOrpCa9Nl9zgZM074sRCj6gpFTDlCpBa82qn8LDCAjEs9O7zuXKFg8hscQD7OrH73VYOupYtj/B2+0XL2485tXQcc+PP8Fsi9wkH9ChsUi1HV9kLxjFWA1Td9YdUdn2ouq9KHGuqEGx+c/AIW74Zcc/SDU3esFW5yZaIbekQTdV1lwcXu2V2YKLdmgTaC98ZUPw7Xn0z1fd++iX9xbBczxRED2L42qd020QvZ2BidZwA1apcPM0/VU6iZsU1EbdQ1TKY19zKciSSsQwimwtI6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRefCsgTzia3YcHQgDY08FXO9sXR5r8McxdSHx4RiQ8=;
 b=Ycuknq2huD0eMqkDDTx2XCBONVaex6PPEluRzJE31aqvE7M8u13LxI5QEvoSjv8czv8xcgo31hsWs1FXvxEnlX41CGJ2fdPvt+aXkqIhA4y+ikbe468OU1/0p3YiyPuV8jBuKmuHWVUpteQz+V97ZqM1/ZaiDMwCTQuXs5XuprGULWI4JgyN4IyoTwyf9YBvGHQs747LMNje/iIJ+L9ahGrixlxpQdhNrd0zDiUGDs+YWm83R1PF97ueQKlVPp5K2OmuVDYYtcv9o5c3sqS6aWUQPApI3eBtfegj77vBlY8Y7f9CWnD9dqqOrVJbkrKmBim6iQxIm9HZVLJYl0R5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRefCsgTzia3YcHQgDY08FXO9sXR5r8McxdSHx4RiQ8=;
 b=dkb4yC7tXjmyUbCYo8ALdKC9Xd3lCJr/oFfwBP+jymGmqqrcl3CWpWJ8DY7MRfgnCWHmoQeEk729p3k/MUXYjeIfWRJm+VM64IvseRH8ds22JYxUErAWiTcmxyyqvGiDA9suVv+mEUge3HawkhikGEXp1AgPXLKDo1JCSc6gAlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 22:00:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 22:00:41 +0000
Message-ID: <1d3c8249-2b2f-465e-810b-848968de9abd@amd.com>
Date: Mon, 16 Dec 2024 16:00:39 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] accel/amdxdna: Add zero check for pad in ioctl
 input structures
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
 <20241213232933.1545388-6-lizhi.hou@amd.com>
 <050b7fac-1ebd-46a0-840e-2df8c82136ae@amd.com>
 <cf132e81-524b-3b13-aa18-4f542f7ca480@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <cf132e81-524b-3b13-aa18-4f542f7ca480@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:806:127::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: c529e1a9-87b2-4af3-fad8-08dd1e1d14ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d21YSVRWcWlob2N5R0JxSXJRWkJCUmhUaEwyY1ZSQ2s1UUVicWcrQWVxNFM0?=
 =?utf-8?B?cWp2TmF6VzlNd0dudXIyUFZCRk0vWkxLNVBlbFF0ZkluQk1lWnF1R1ZHMnFu?=
 =?utf-8?B?VVRBS1B2TjR3emhQUFlEZS9VVng3MHJyYVBLUldWeEhSSnpVb0pzbkdFT0pF?=
 =?utf-8?B?U0t0QkZuTWV6YVMwOThMMENYVVRWaE1GbStCVFZMZmM3dGtITmM3QVhFaURl?=
 =?utf-8?B?clNITUFTQ3FsZjFWSDRNMWhRaVNrdGg1SmZWTGd5ZG54bms0N25SaENPeWpC?=
 =?utf-8?B?cmd5RDk0cjFJYktnYlRzTVR1dDI3bHNpNXdCWXUzMFhuZStzZGJudzE3L0ZN?=
 =?utf-8?B?WWdFSDdVU01HTExLdVlMZERGaUtRUEdoT1loNU5iQkVaSWpUbEdpWW1jZDhR?=
 =?utf-8?B?Zm8yWGlNWWk4Sm1iL1d2bVZYcW9pVFh1Zmp2U0lJTXNtZFNpVGJOdHNGRUJv?=
 =?utf-8?B?eXNFUXVOV0tuUWJ2UXNqMUVCVHRqR1JuMVZsQ2d5allCZlZqMGZ2MHhTQmxw?=
 =?utf-8?B?TU0zd0tOa3l4bFVETHpDMWRWWWp0ZklYdU4zdnk0N1pscVhlSlpPblRPa1Ay?=
 =?utf-8?B?RGZORjVmeXlhMDJpcFg5am9XNldnU1FiWWFLRGNzbTEvekxxTU0vUno4ZFRF?=
 =?utf-8?B?QjZoL3o5ZU1XS1R0YW9LbFJMbEVrcnppVUdBNXVSbVFraElhQ3ZybFBKZC8w?=
 =?utf-8?B?cmJYa24zWXlqazlQeENKSTFzUHpSdFA0SlIveC9lMWhSNDkreHo1bE9oTlZW?=
 =?utf-8?B?YTdwa0ZNOU9uclVOUnkzNWVjRDFXbmFBK1MyUTVzSFh0MjNxUGR4Vm5xS0FF?=
 =?utf-8?B?eGhQQW5iSjN5NDh4TUVkRGtYMmhrdHZmbXk5aUplQ21mWUFJQlpGMDJkdzkr?=
 =?utf-8?B?MCsvWS9TVWdkcGVlVDZRbXEwWnlhY0RuNUFTUE9JUGdqY05POHZzUHVUVHhH?=
 =?utf-8?B?bllpV1pDNzlTbG5iZ2E3Qm5WWllKTWFkRVc3S256UXlTVzBVOFdpSzZ1cHE5?=
 =?utf-8?B?a2habTJSMXlYZHk3dllRTVE4ZmZES3hYWVFlQklyakd0Nm9wM0FqdGtValo3?=
 =?utf-8?B?UVJhZTFVOUdUc3I3ZDBrYldkY1MwckZLS1VYWjlaZTQzTlNOTWcrdmJoZnd2?=
 =?utf-8?B?NUNyOExwTTd0NER2NHZ3N2xIVGpFeTRJYitBbDM4bVF0TnhYTDJLRE8xR21J?=
 =?utf-8?B?MStXNUFSNzUvK1llQWRJMW04ZGlnb3IxdGZTeUExZlRqNVYwYTh2bTRubnBq?=
 =?utf-8?B?UDRWZ2tEb003R2E4NFNuYXZLRnJUMEhDdEVzY1ErTkp3MFVURDdoRXNZWndJ?=
 =?utf-8?B?dnNySGcyMWRpTTMwRi9VSUFRVnpuZ1VUTkN1ZStlczlNaFhUNjR1UFI2SGx3?=
 =?utf-8?B?NG1qYWRxS2dIaFhFNkQ5S3NuSHlkS1JFQWVaaXNQUW9Kai9QVmtucHRrRXNH?=
 =?utf-8?B?bk9sVmppRFNEWjhLWXR5c1NuODVJN0lUWnUwYTVBMFRLSVRxWndabmsxUDlX?=
 =?utf-8?B?aVJ4Y01McXhjUExCYkVVa1RzN2VISDVIRXJYandTdFV5UUdJbUQ3ZWR6MnF5?=
 =?utf-8?B?SE9xN1hJMFJSRHkwbjMvbEU3bktEcW4vNlE5VkdVT1ptYmxiSlBialFyM0tF?=
 =?utf-8?B?emVONXBTVWlZRFhIVzJqYkY5YXRBcEVBdVQ5Z0ZuYlZVdjdTREFPbFdmK05y?=
 =?utf-8?B?dTl6enhPWlZaMTZOSG1RWEhZS2IvVXFYRHpZSGZIcnYwc2RDRVJoU3l2M2Rt?=
 =?utf-8?B?UTZLQ3ZqeGhTZUU2QlRIcWZBQ0ZnRmlhendNSHJDaGNJYzFsU0k5d2FlNXJS?=
 =?utf-8?B?RUlwRTlNMmROaW1QQXN0WVVBOHh6VmlGWUxtYWdXaUlRQ1FBZi9tVkt3czVz?=
 =?utf-8?Q?Ms4knu91/RdgZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUpSQS85UWlxUXgwQlJYejFnUHRsRmNFMGRvUGcvd09taHRjWC9tOXphd1dV?=
 =?utf-8?B?OEgvQjRVNGF6bm5CMmlZRFUzQWVPVytyVjFpSDlHR2p6ZkNEcE01eXVVMnc0?=
 =?utf-8?B?a0tuWC83MzZXMlArSzdaT21hK0pQdHlKS1V6Y3E5K2Q2S1Ezd2NUSW1qNGJo?=
 =?utf-8?B?VjkxODZJVkkxUkVGMGtUTHpaV2JiL0hFTElzYk81SC85U014TytzWnh0MWdK?=
 =?utf-8?B?bFc0anBWZ3RWMkJ0aE9oN1FkYS9rcy9MYTFzL2cvVjhTWWwzaTFqZGJsUm9r?=
 =?utf-8?B?Si9ON2F5Sk1Mb3gvSjF6anYyc25OYjNPb2tzYk8rUkwrUlRtU3FqbHBnOEZH?=
 =?utf-8?B?WDkzbVhlZmovbGZTQmtzdVhTRU52akRlcXNXWW1mclZIUGU1NUQxYWpIN28x?=
 =?utf-8?B?c21KcUZrNVFGaVdJYy9vT0tQS1l3LzJpRWlsa1dBLzJFT1RHYmNuSXlXbDU0?=
 =?utf-8?B?S09mZ1RPMWpNMXpGcVgvdE5UTzIvQUJzTHpWZjUrUnRNYXUvYWgzVDRQK0FT?=
 =?utf-8?B?cmJodnYyZGpBRERxTXVVYmd2cHFsQXBGc1Z4eWJtSUhUMWExYnZySm10bmx3?=
 =?utf-8?B?empBSEhEblNqYXd0K3o5NGhxQ3FyOU1MeWlMalM1ZzhyMm1YOHZVNlA3Nlpu?=
 =?utf-8?B?aG82ZnVWOVhoR3c2RUdTa1RTVi9nWkorK2U0Q1FaelVRaUFLZTA5Ym1kcVVR?=
 =?utf-8?B?YTAvQzJteDlmRU5WWGdJOE1DMDFRL0loZm5oMDZMT3hXODNZc3JJQkNEL1hy?=
 =?utf-8?B?YjllUjNoZEtRTlYzU3BZeS9ua05idlhwZ2FqblNPSjUwaWRUdGFmVFRoa1kv?=
 =?utf-8?B?S2VBRTdRMU5YUGxUTTlnelFSaU9HZUZ5Z0VzTVUzczZOWVc5SStvTDR6cUdP?=
 =?utf-8?B?bkloSy9VdE1ta1l5MGZtYXd6MjlCdmw4ZW1IZlZ0YTJ1L2YzTTdwcUxVU0tX?=
 =?utf-8?B?WGZJR0p0YWloNWdTVk5vOG1YWXVQMmd1VFVvSmhaeVFtelhMMk9WRGZYbE1J?=
 =?utf-8?B?Zi9IRjAvNW80a00rL2NHYnJLQ3VEQndsaXZaRHJsOUYyb0tmMHFyWkFZNGRR?=
 =?utf-8?B?alhVMGVqL0pFeXVDYVdwU3FpNlJlTmxneG5PdUZ6YWIzbHU4LzVTL2ZXaURV?=
 =?utf-8?B?dzk1QkVSM2xMWERSTEU5bjh5TVdtRlI4bXdpQjlZb2swbWRDZmZLdEJjc3Rq?=
 =?utf-8?B?SW9yVjV6Ulg4YVQ4TlREYlQzVDN2dXQ4YVZONkp1SDFOWm12UVNRYVJWd1ZB?=
 =?utf-8?B?MHBoelFWcHkyQnQzMVkxM21vOG5jSXdEY2c4U0JZZ3E3M3hLZHhxTE1CYWd5?=
 =?utf-8?B?R0JPbnpHWTZwUXFHTEpJU0NlcDVKeUpIQnJJbTVZMTN4amRaZldaSXRJbTVC?=
 =?utf-8?B?eUlqTUtiN1dmTUgvNUJXVlIrYkRiNXlkTUlkYjZWVWZFaUJUOHEzRk1sdzY5?=
 =?utf-8?B?dzJ3UnlBVUgvUUM2bEsyVHhxYnB3NHlncDVIS1pETGloM0Q5aWs2UVhEb25r?=
 =?utf-8?B?ODlQR09Wb3VBaWk0Y2tGSm1aNUwvQnFMOTNXN3R5bGhLVFF1aWhhUkhHQjEv?=
 =?utf-8?B?VjRERjJWMzZIQjRqejdMbHBJekdlTllDWE9wSTZqb3Q3VEN5OWpGZ1BYdXc4?=
 =?utf-8?B?VXpna2ZRQ1E4S3FVaWtmdjV6bU1vUFNuejFuNFZPd0pabWJISU1sQzI4Wlgy?=
 =?utf-8?B?b3lOYnl4UmRSekJMUGFtWFJYOEJVT05xekhJS2tIK2xVT0Z5THZQMXZhRmRv?=
 =?utf-8?B?OEJjS0hhblN3ZUVseDA2VUQxcDI4UXh4QUJjWmMxTzlmYkNPb0xrZGZSSHIz?=
 =?utf-8?B?NVUyYkh6amcwN1ZPVlAyWkRjNzc2UWhqQ0dOZG11MmtyM0hiN09BNmxxdGhS?=
 =?utf-8?B?cGlBSWhScU5VV0lVNTAzZnNoOGtzbnIvMEZONW51anM1elRuNGtmWTRVbElO?=
 =?utf-8?B?d3dHTU9OTXhrV3ZnZHlWdERGdUsrWFRIL1poWWdoSExkUjNlQ3RaOUdETFF2?=
 =?utf-8?B?eW9UcjVVS0RTMW1hYytIL0FENEZXNWdocmpUUEZIdjIxU0tsbG9vRVZGUTFy?=
 =?utf-8?B?ZndNUFZJZ1RXR1J3eXA2dEVnYjVuWG12ZHI3YjRWYlFBOGx6WEtwQ281MXhq?=
 =?utf-8?Q?1fTUgXhkkkoJIeNf5djz38hMD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c529e1a9-87b2-4af3-fad8-08dd1e1d14ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 22:00:41.2283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT+G07ojP3oNAXbvvfqknEk2FeC3nPVDykRh+lPRdEMmCh08+Ps1wlrDoygJaTt5JW1s0xEQU3b/YqrN1e0ayA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411
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

>> This change actually meant here?  It seems like it should be it's own 
>> change.
> 
> Agree. Hopefully, the patch 1 - 4 are good to go and I do not need to 
> resend them. :)
> 
> 

Yeah those are fine at this point.  They've gotten good feedback, no 
complaints from LKP robot.  I think you can just send the fixed up patch 
5 separately.

I've just added 1-4 to drm-misc-next.  Here are the hashes.

b1dcfe620574b accel/amdxdna: Read firmware interface version from registers
f4d7b8a6bc8c9 accel/amdxdna: Enhance power management settings
a37d78470bcc8 accel/amdxdna: Replace idr api with xarray
273b5176ac178 accel/amdxdna: Add RyzenAI-npu6 support 
  
  

