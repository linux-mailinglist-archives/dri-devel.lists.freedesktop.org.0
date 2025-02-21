Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A204A4014E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665DC10EB2C;
	Fri, 21 Feb 2025 20:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GFlDc3WJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C0910EB28;
 Fri, 21 Feb 2025 20:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwAsp0KmMHRu/U8/SgUSuFejoGwS86Kh7GCgzm0TBRcG3o6TnXc/UseIarVkRVPZcRXiCW/I4u8bjZwZLL3H8eSKlriTMOUMEUKQ+aud2Kz+LV1i4kjwPGSBL+NnMHN/9kjacuM0Ug4acgXfZGKRN1UivHo9sofImW/rNcvuJmuEMTpGlA1ywZFmISCxPXRKSzzReq2hTUT2msF+jUeQWGpJ+OE9rZm6vgnkkaJIKVTgE5J+mqTpQzs6p+Vj0GGAJ+bSNulgiU5IVcfuqdgPZNasMG0ZxQM7G3F+YHaXJ770hiuAVrFHHL7RSZKZnqFUJfp0/4qu0zglE0Cor29AsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijlWQDu+5E+7r0ky4bKdS7BDVkX4hD5PTHXgoPShTG0=;
 b=sGVLGruRSgbzwHNccaiT94MjnFyebGV1NoBX9gHF89rCpzUMyINiM8r47owrVdY3UgHdgvnbTLZfX/bNbpYKBFansRPD6gTh26GMs0GiDLKDDEotPFJF23qMMO0iLWHSWzYmYwan/xsGK/4uUgKQZPw7143NWFRazR8EPDS9B0rAehuqw/2jaU0vDQ6GAeTKIGjTgumC4386Ie1+3rfBBXdDCBqUrTTg8M1p3i7sShRlUdHExAp8YjL1QAFsabOR28bOmc8rjRMb937S2A0lh3q9wTYPfkrMfqlEeFLaQjzSBNYTZZ8eP9R/Hx0kzrk/sn0PwX6vePd138GlyblYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijlWQDu+5E+7r0ky4bKdS7BDVkX4hD5PTHXgoPShTG0=;
 b=GFlDc3WJ6mSRzj7Q9EhLX/xGXzLMUlrC2IfB/xBF8sqW3rPgQG40lElRCuuxF3tMbsLdLxi7hi+BEt76u8T4/Fz3+PlpsqfDRcd+ftyyqtNF3kiIs7VMOQoMRRhYTqYee0AHwJeXpFuEUWDrngjX/Jgen55snuDhdobtBttdem4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 20:47:45 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 20:47:45 +0000
Message-ID: <b6466238-42dd-4de4-9c95-ba3c019a6b21@amd.com>
Date: Fri, 21 Feb 2025 13:47:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: restore edid reading from a given i2c
 adapter
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mario.limonciello@amd.com
Cc: Roman Li <Roman.Li@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250215211549.79832-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250215211549.79832-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0252.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d33cb3d-9e75-41df-05a2-08dd52b8fe83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wmd5RVpickh2OG0vVDJTL0VmWFNmeDNzS3VYUUZxR0d6TzZOeVNNb044ZUdM?=
 =?utf-8?B?MExRM01UeGh4MWdIbTlMZExKVXlCUHNXZ2hlekRTRlVzTU1BcUlxZFJqMWdv?=
 =?utf-8?B?YmtwWVVobHRtOEVyYTNva2pWRzVMVFpxY210WHlzbmYzcndxRXRKbkJNVEw1?=
 =?utf-8?B?VFRhY3lDaWQvaGEvNTF5L0JweEtLZ3RGUzR5Ty9paEJqc0VSSjBrKzNlYkhv?=
 =?utf-8?B?QUFjSHg3Ky9UYjd2NjZsMmF6VGRXcCtvREhMRkthOUNlcGZuWnJvWk5Sd0da?=
 =?utf-8?B?MllzSnBFblAwOG5WWGp3RWd0emxCYnh2L3RJRURzTDR3Wnc1c2pmanhHR2Mv?=
 =?utf-8?B?SW9VQ2VESHZJRjVNMyt0N0srQ0V6MnBURWUraWtURjJjWHJuSTE0ZCsreXRx?=
 =?utf-8?B?MmdsMGxsM3NKdCtNSEx2L1E4eFE1SGR3Q0Q3RmZzYTRmY0RqQ0hVTUpWRk5s?=
 =?utf-8?B?TTMvSWxtRHhQZlo1VVFVU2JEZW9ld0d5WGdKWDAxSzI3bGNGcjdqN2Zxc2l5?=
 =?utf-8?B?dUphUWtsN1JQL2pJUzdxU3cxNDdqWVoxUUVHTzVCZTRkTU1lM2NWS08vd01J?=
 =?utf-8?B?SkZvUk12c21XWHZuRUUrb0s5aUlOZW1rby8zK2FRMkxBVm9ISU1XUW41Ukp0?=
 =?utf-8?B?VkNHZktnNm5nZGl0VjIxdWpYaFJNeCtOTUZIYUZOejE5Z0FtM3RldmNJZjVO?=
 =?utf-8?B?NHl3MmdGZUN6RTNoaXRVdUNZcHprUmRqY21LeU9nc2ttOXFDYXp2U0FiZmgy?=
 =?utf-8?B?SkVjRWRnKzRzbTBlalpqekJoZkxmWkhDVkVnY0wxY3d5L1FJSGhaSHl6N1dx?=
 =?utf-8?B?SDBNS1pjbXM3UkRNL0UzU0FRZFZaU2NrT2tkTmZuYjJzay9KaTBjN0hCS3pk?=
 =?utf-8?B?d3FGc2hjQkVnRTQ3Yzg0cDZaSEY5TVUyT0ZadWYzOWM4SlVFdmVaRXpPSEsx?=
 =?utf-8?B?T0NKWlR3dElsMmFmYXdaTDVjbDNsSC9nTEZ0dlNUcHlaNTE1S3B0K0dCK3pO?=
 =?utf-8?B?c3JiY0E5SDZHSytzWWg3ZGdpSUxlb2RSaXZYekdmbHNHcTV4WTlMYnI3d21w?=
 =?utf-8?B?MDIvOU85SzdjZGlRM080dmd1QktxYWc0dG9RbmtoUlpwUXZqcysrcmRvNk8w?=
 =?utf-8?B?UEZ2NEZKZEdzQU1vaGZCY0h1K2o4NHpIa2gyeUJha2tNcmxlN3REMU8xYzRj?=
 =?utf-8?B?UWp2ZVhqVllOdnlYa205ZFhla3AvU3FBZHpqMG1CWWtESnpoeGU0QXQzSUF5?=
 =?utf-8?B?eHVjQWdzZWhiL3NCT2NVUUZLaFNidjNyT3lsMHpJTXlRNERqOXZpNnNwVWN2?=
 =?utf-8?B?VEVpdnBpRXc2TXRCS3NOTG40dldqek5DamxrSEliVC9ia1JRRlZ1U2ZxSnhx?=
 =?utf-8?B?SWdLYXk3ZmMvbHlPWmZUMjNNRnh1M3NUZWl3OXo0SnBkbUVrK2dzT0RBUW52?=
 =?utf-8?B?WGhYSnhia1BmZTlFZExONHRkaXFqT0orU3EyUnNuRWVjZGZZNmo3RWpadGoz?=
 =?utf-8?B?V1h1eVpJSWJNSy9uZDZ0QXlNbWtvRGFQODhnaFZ2YzFUbEpUQ1gvME5hVEpU?=
 =?utf-8?B?NVdzckZBL1VCVmxuODBWbkRKUi9jdk9ham5WUVMrOE1LTXI3ZmVrd0lRTVFn?=
 =?utf-8?B?N0ZNMk8zNzh2SXNLd214UllGTVlRVnk5RmpuZ1hGSG9LeU5hSC9WRWw2d0Vt?=
 =?utf-8?B?dkxadHZpUldzODFCbkpMbG5palk0QklUZ2c3NVNBWVRBR202L2V1MU9nTHhU?=
 =?utf-8?B?NHJXWk4ySEhDOUZ1MUlqWjUxSjYyQ3B4eG5na0ovOFBWdzNaSm14UUxpWkFC?=
 =?utf-8?B?d2ZGS0Q5YkZldHVhM1hZTTB2ZTF5ZnRLazg4akVoYUZ6RHlGMEUreW94bVhO?=
 =?utf-8?B?RHdPTTkrYWdNWVYwOUE0RXZEVUdiR3BLTDNuaFRUMmV1YUowWm4rRUhyQ0hO?=
 =?utf-8?Q?TzmclaG8n4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWo3THM5aDd5bkkyOTYzbFY3MVJSYnFuTVdTcGc0UmNvY29jSUEwQVpQT29F?=
 =?utf-8?B?UThPS2EwMHZxS2RiVk55TjdESXdPaW1XazZLWmFDdTRDS2ZQS0k1TUQ1czIv?=
 =?utf-8?B?b2xWS0JPVkJka1pwd3Y0WWRKYUV2Q3pocFdWSDhHaDlkWCtjTG5NdWROUjQr?=
 =?utf-8?B?MjFHd0JVZnhuL29nY2pidHZRN0NpdWpYR01WdXNQajV5Rks5SWE5OHdZRDJ4?=
 =?utf-8?B?bXpwVnpKWCtza2pzNkNKeE5uVnAwU0pkV0VPeXNIbmI5QXJvQ1QvWlNINmdH?=
 =?utf-8?B?ZDhkMXNUaDlrcDVvZEVzekJ0ZEZndUloUkNvcFNxbFVia2lvUjRmc2Z3NXRS?=
 =?utf-8?B?UWpzNWdzYk9Pc003a2g5cEFOUlpoM1p3RTV1NS9ib0gzVlRGTmxFcEhMUW81?=
 =?utf-8?B?SHp4bWFSdG5QNWdtTFJKdlJIRndLQi96TURFMDNraDZ3enZ3TDFaMXZ0NThh?=
 =?utf-8?B?YjhwVElEa0JpbFV3M1lDYVcvdnhReHlvVSt4Q2pXTk5DODJmeU9CaHMvYVU0?=
 =?utf-8?B?Q09NUDZZdjlBMWdNMGlPTjBmcnJGUVZoNEFvVlFOVjVtQ0dQME9IanVNN1Ba?=
 =?utf-8?B?NDVlbFJEY0crRDQvSlh4NndkOE5EQjhYM0wwWU1QSlhnenZyTmxYZkZTeHZZ?=
 =?utf-8?B?U3Ruc0laRCtpUjVCZFRTNzhoRzhaNkhnTEtDcndlN1JVM0d0Tm1CWm5tZFZJ?=
 =?utf-8?B?M0hhWXFFdEtrdTE4M0o5WHZSV3ZGcVhpRlREUE81OTEvMUtTaXdMdzRDaGF2?=
 =?utf-8?B?eEtya1ZJQnVDb3VHcWhsREVjeWV4a2xTNE5GNldQRUY5RjNMZVIxeVd4YjYv?=
 =?utf-8?B?ZFJiNmdNWnMxYURmQktTTksxek5taFFwR0c2MmloWEVHTUUvSTRWelFPVnNJ?=
 =?utf-8?B?SmVhTGFqNmJ4QjZRVXFISWMzSmp1RVo4bTAwSlVCUUVRTTNDZE9JcVpydmw1?=
 =?utf-8?B?TEFhU3dQTG16aWhsYzF1YjF5a2RnbERIY3QzMjNGMVVibnptQ1NVU0tUbXBz?=
 =?utf-8?B?Zy85WWtSSVlleEYybEFma1ZFVGVuNkRKZm9TclVJdURxWWJua3NGbWJObVhW?=
 =?utf-8?B?aEZwN2lSVG1RS1EwanVXMVlrWndRcER2QVNvVDVaa3dKSEJ0Tlg5MldxSUcx?=
 =?utf-8?B?QWpSOXpGRG1nVGM4SmU3TnVTVzZWS0w1dFp2Z0JHeXk5Nmw2ajN4a3EyMnNP?=
 =?utf-8?B?MEZkVWs1SXVVRG1VMXJNSlB4bGhKN2tQcGJvdmYxUld6QW5BRThtUlgwVk9h?=
 =?utf-8?B?Z1VXcFVRQ0VISFZXTEorQndkbFAvL2JTYWdPWll6b3VmT3ZLbXlIWHRQYUNy?=
 =?utf-8?B?TFpPakNkbzQrajRqdnRnOEFhaWZlcDdXbjNvQTJURnRMR3FlbFdSQXpnY01D?=
 =?utf-8?B?YzRQZ1lkTVRHaVRGRVJLVVhMNUNMUHFJUGZkcCsyYnV0TFpCVFNTRnNQeU42?=
 =?utf-8?B?QS9KUVpXZ0VWQk1jYnpIUHRsTnB0ZmhPK29DZTQyRWREUmxVRG5BMklzVEVU?=
 =?utf-8?B?MVBRZUQ3d1BHMzZqWk5LamMzVU0xdGJzVHlLb0xsY1JlTkR5OVhrcC9vNHAv?=
 =?utf-8?B?VHZac25JQmx5Z3c4WE9KRWlscGZ5YlhxWEFUa3pBVllGVXVQYVFScTRnSks2?=
 =?utf-8?B?ejFBQWdLSDBCdFo0S2htc2E4NWpyclpkeVE1MlF3eFJWNnY1aWhUT2lpMTRz?=
 =?utf-8?B?VkhiQW9wc0pEM0I3UzNwR1NSYjB5dDd1MURKblhUL09PbEI3YXlTdElpWnhY?=
 =?utf-8?B?TVRiTEFjcUhWQU5oT2w2WU5EODZ3ZmtSTzJZaU9hbGQyYWZrZUxZSzV6cnNw?=
 =?utf-8?B?ZXBmTDdUeWtGUEFwL2UvM2p3UHpWazNUVDQ5MC92NUJJZ1Z4VklmTk52WFZ2?=
 =?utf-8?B?V2lHQ3RBYkkvZk11K09qS0RVVk1jTUFPZmZDNml2U01yK0FRZ0o5RzVmWUFP?=
 =?utf-8?B?OU1VM2VkWk1DdTV2azNGRk1RcWRXQVJCOXlzVFRlYUgwdkhUSDRQOHNoTHdS?=
 =?utf-8?B?V3AvMUJEbEJSbFBFVEtmeHdWZFdRWW13cU5ZQnJqYitoc2RZYXRhU2V4cWVl?=
 =?utf-8?B?VWl1RjA2cFBkWmszTFNHWmo3a1pzbTZUVlFZdW8vZW93T1RrL3JLbTNVRC9u?=
 =?utf-8?Q?QdztZ64Vvl7vsq7bRS1uajEVi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d33cb3d-9e75-41df-05a2-08dd52b8fe83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 20:47:45.5419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heLOk3f9jsUTeCsj5aE5uKjcP4YRhG/LitK92IA4euutFiJWpGbTFE3nKqJEIXameiM3HDfIr2D1LAvv391e1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2/15/25 14:15, Melissa Wen wrote:
> When switching to drm_edid, we slightly changed how to get edid by
> removing the possibility of getting them from dc_link when in aux
> transaction mode. As MST doesn't initialize the connector with
> `drm_connector_init_with_ddc()`, restore the original behavior to avoid
> functional changes.
> 
> v2:
> - Fix build warning of unchecked dereference (kernel test bot)
> 
> CC: Alex Hung <alex.hung@amd.com>
> CC: Mario Limonciello <mario.limonciello@amd.com>
> CC: Roman Li <Roman.Li@amd.com>
> CC: Aurabindo Pillai <Aurabindo.Pillai@amd.com>
> Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a8421c07b160..142d366e3347 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7269,8 +7269,14 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>   	const struct drm_edid *drm_edid;
> +	struct i2c_adapter *ddc;
>   
> -	drm_edid = drm_edid_read(connector);
> +	if (dc_link && dc_link->aux_mode)
> +		ddc = &aconnector->dm_dp_aux.aux.ddc;
> +	else
> +		ddc = &aconnector->i2c->base;
> +
> +	drm_edid = drm_edid_read_ddc(connector, ddc);
>   	drm_edid_connector_update(connector, drm_edid);
>   	if (!drm_edid) {
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
> @@ -7315,14 +7321,21 @@ static int get_modes(struct drm_connector *connector)
>   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   {
>   	struct drm_connector *connector = &aconnector->base;
> +	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink_init_data init_params = {
>   			.link = aconnector->dc_link,
>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>   	};
>   	const struct drm_edid *drm_edid;
>   	const struct edid *edid;
> +	struct i2c_adapter *ddc;
>   
> -	drm_edid = drm_edid_read(connector);
> +	if (dc_link && dc_link->aux_mode)
> +		ddc = &aconnector->dm_dp_aux.aux.ddc;
> +	else
> +		ddc = &aconnector->i2c->base;
> +
> +	drm_edid = drm_edid_read_ddc(connector, ddc);
>   	drm_edid_connector_update(connector, drm_edid);
>   	if (!drm_edid) {
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);

