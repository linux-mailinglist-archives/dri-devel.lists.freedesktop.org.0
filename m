Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A7D38A6C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 00:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D00510E19A;
	Fri, 16 Jan 2026 23:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yTN7GzeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013025.outbound.protection.outlook.com
 [40.93.196.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BBB10E116;
 Fri, 16 Jan 2026 23:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7GoGr+qwFy71oAqd78SsDXkMkvTnZ7Dj+1wG5GhTS3sUIA+iMr6kUKSSafY3p69LiLwOnG2qfG1vsYkMeuloNbkd6nbd7Ns7zNP2mFk0liP30PHtOcNMMeL9us2KuJwvF5M0LSE3viYUJRz06UsGW4LokZz6dlBwJDyql2V7M1VDCLm3m36HdrGfnhCksEkMm89lld/vvuVBsBbtDTOg+dNxVtI9r+1IMSY3d+kpCWPEh1rTc84W05hyMC98wiCy57tA5u+N8i6Ajlhf8elMMdRYd76p9miiQ2+A85aNNrbPhvbD1FB1hxgSzzvqmjUD/TFzahYppbfjfd1mtiV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvpSgevukmcvJhvHSvn5q3SadPXYaYWkUz9Tb8y3DyE=;
 b=x+BD0iqk+O90ylvha3RQVD9aZLLLbY/Ml7b+4ONjWneU9x+3203YV77jAlgfKhoAeB2cHIA4Z0mf1yjZvLjPST1MG8aN0f8pdOrSuvmX0pPNlyKx3aH+btni6Fzi4qq4byiLF69ZFeCqpVXzVHQM1EJsFTtMVhBQtpo1LGcPvuoVqqGB/PTmOoWGdVVWksGO5syEQsqtq3sG8UKNWaCzULSFV2pEBZxAmh6KE9fUY2ldN/ICI3hWqhe1K/eNQsik8mmxjjs1xuwqUPJefRBD44085H6+0FXqW4TCy6TRLreVv1i48uB9YVYZRB/iiaZc4xOfYDTPmFPEr7FzUlNd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvpSgevukmcvJhvHSvn5q3SadPXYaYWkUz9Tb8y3DyE=;
 b=yTN7GzeDxS468OrYrY96C2QgpsPJmFW/HGu5t4LsqdYhkkeoL8YuuMshMjEIqY9VKZH/yNWEu72b+FIrQWnNkpeGvfcHmzU6yyZvnL7H8eufiWGWIzcFmP2BkR6ATtoSoi3Rw87z4EgVsmgiQ/ap63GBTmI8Tc3aWfiNUH20JHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB5880.namprd12.prod.outlook.com (2603:10b6:510:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 23:54:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 23:54:19 +0000
Message-ID: <033ffa30-23b5-4453-accf-512f8ab4a57c@amd.com>
Date: Fri, 16 Jan 2026 16:54:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/amd/display: fix wrong color value mapping on
 DCN32 shaper LUT
To: Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251208234741.293037-1-mwen@igalia.com>
 <20251208234741.293037-2-mwen@igalia.com>
 <81f336dc-3450-4ffb-9682-5098950c28f9@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <81f336dc-3450-4ffb-9682-5098950c28f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 34889048-5dd9-4687-ea1e-08de555a90ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEhLQmZraTk4NVhSamlYc2Fsd053SlZkM1ZnMWhGRlFSQzUxdVU5WFNGS0U0?=
 =?utf-8?B?MUtwME1GRGhYYStRcHhwRmppemRxVGM2c3J3YjZzNmh5RHpiZkM4WE91RnF0?=
 =?utf-8?B?Y2xHSHFSdDVLY3NtVGNXQ2VWQWFNMDYxUnJzdDlOeGVDL1Zta241c1JkanVz?=
 =?utf-8?B?Rm9GUjByZTRLQ2dRZWVEMG5JaDQrMjlObHA4R1FGanQzbTdjV0dOTDlsYStn?=
 =?utf-8?B?ZDlvWEhKanE1cVR5OTVPNFAwdHlDMUEyanJEQi9Id1Y0NDQwcW9jbDd4WHdx?=
 =?utf-8?B?aUl4cTlWdkZJNFRnK3ZVK2NlY0g5a0dCMVhuc2cyNTAzaUdVV2hRQXpPMkRH?=
 =?utf-8?B?b1JqTzYyMEl5Q3Q3Z2lPWnYyL3lnZHNXUXZnMWVVc1QxSS9JbFRVVURETWFH?=
 =?utf-8?B?MjRFdmFNb1VRc21UdUIya0h0dURGcldXbDk1TjFRL2ZUSVh1UHdDNVRrVzRQ?=
 =?utf-8?B?bGtmT2J5T2xjbk9RZTBrb2s3ZUI0THhxMkxFbGoyc2Z5MDM5M3pWdVdVWWpW?=
 =?utf-8?B?RW9tWU9KckhQQnBkQmZkOFNaYjFXZGJsRS8xZUtKRlR4M0owS25vTHZMNUdm?=
 =?utf-8?B?QkZOTytidUNMcmltMnRxVEVqdnlZSTBDaHJkT1oxVjRURUZVN21CdTlFaGp0?=
 =?utf-8?B?QlNYZGtBbTRHdlNUWjBqb1ZYb0NVR0xtWnZtTDlnS2gxWHZMeVlhYVVibVF2?=
 =?utf-8?B?QTIyMjRCNFd1RTJEQ0VkdVZNQWtrK2pKVVk0VTZnT3VMZDlzSzAydGxFNzBR?=
 =?utf-8?B?a0RFL2VOSmRUcTVkZU1TSS9IV251dzVIUi9zTS9KT0IxSWxDUjVaaTVhQTZ6?=
 =?utf-8?B?aGp5QjVWR3hDT09oSTF2SENnSlEvam9pTXRydHUzN0Z3dCtzdVIxdUluYWx0?=
 =?utf-8?B?RUZtRHZYMzlCLzZXZ3pIYUFLTWlFdEt6d0VuTVpXU2g2d3hSTFdrZ3c2ZC9P?=
 =?utf-8?B?OVJyWEJvdUk5MWhobGE3U2lFc3FmQ1NjQVAvdTRpYldpcG9uR1ROSEY1ODNo?=
 =?utf-8?B?d3R4dSs3RGFTeXBMUEhuMFV6cklRaWJEZ1F6cU9RNzZHWC9wZndOUUJNTmNH?=
 =?utf-8?B?dmpTUDBtcmZ4cHNLZlg4akd6L2R3dnJmZEJ4ZStNZ2djYmt5ZzRoRElxVmVU?=
 =?utf-8?B?dElrYVRpZkU2QWJIa2RUVURMdkt3SlVvOWJpNzF4N3cxdlRjVzdhbndlNVI0?=
 =?utf-8?B?RUErenR5UUpUUzdLcEVsWXRPVSs3Q09OZndsM0xreURhTnc2MEsrY3FqRGNp?=
 =?utf-8?B?UUJkYjdVb1RvWVVuOEM2NDV3S0NuQ3lHdjBCNkVHR1FmQ3JDdTdVcjlUVE9U?=
 =?utf-8?B?dWZLc1o1SzRoUFZEejhSRS9DN1YwL2NpNStvN2hVT24yUVdzSE9SOGU4cjRJ?=
 =?utf-8?B?cmZEZkJ2b3BNVUhOSkFwTnlVb2tMUHRjS2VWMEpuY2wvajBQTUV0QlI1NVAy?=
 =?utf-8?B?ZGlqbVFRRjAvVDBlcHkxMXRvdWRKb1ZwL3ZGWFVEUkNBT3JuS2lzUnU2Y0kr?=
 =?utf-8?B?eEtmT0RyMFJ6cGVETGgyVFNLQjZNQmtoZlAyTmFlZGtobndvaGhZdHVmRmNP?=
 =?utf-8?B?R1NVSXcvbU9ZWEtJNGIweEQvTXllSEFuamFhTTA3SzF6dDAxMXcrWnZGUG5o?=
 =?utf-8?B?MDkrcVdrUHIrakwvSEpZckJ3d2Q4WWlyUEdZNk1EOGQrUkpGY0FGMWR4Z3Zn?=
 =?utf-8?B?b3JrejZVNElsNTB3SWpiVlBabENxRlIzVzg2Nml3VHYyMXBweGZScEV0cWpG?=
 =?utf-8?B?RVFoQXRaOEpmeHZCRUtSRDRLMzIxSU1HUTE1eHovOUppcjJ0VVY2bFMyNlJJ?=
 =?utf-8?B?WGZHSkJaaVU2cWpmcGxaM2tGL2VUemdRb0x0ZHgrODhzMU1MYWxMa2d6M2Nt?=
 =?utf-8?B?cHNlUzE0Mit5a3hGcVNrcFVYZFp5eVA0bDBwellwSTRVYXBYYkp0dzAwRlo0?=
 =?utf-8?B?QXdCY1U0K2pKZHBPTFZFbTZEUWNuc1NkMlZ6MW5UbXFzcmdSZThOazN5QXlC?=
 =?utf-8?B?UXRreFJBbGZVNFBCWVhTK0tqMjNla2tKWUpLeUlHUHpiUUExY3ArSDNMNUVI?=
 =?utf-8?B?bHFMOW1vMjhUa0VjcUFIZmRyTS92eDFpUkt0dHZ3cCszMGUyb3dOQk4wd0Z5?=
 =?utf-8?Q?uTBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1o5amxPaFFJMm1uTk14NmVNejJkbHI0YzB3RHJabmhpZlZGWDNra1MxcFBU?=
 =?utf-8?B?OGZiZGhXZ1hYK2I4YklEUE1md2s0NUsybEtPRjJsWnQxSG5URTlWbGxtblow?=
 =?utf-8?B?MmpTZVFUYklaNDkwTmNWOEJKOFV3eUJIVGQxZE9EZkJwTXFiM2xERWtoL2I3?=
 =?utf-8?B?WmRIeEc5RWJnQW91SHJPVGFnSjNhRmtwUkpINUdKZ2orUjFJSjh5WXo2Y2Va?=
 =?utf-8?B?Z3ZUZFBaR2hFQ0lEMGQ1a2FXWHVjMmFvUkg0OTZiNnNVT3JZaWRaUE1iVTQ4?=
 =?utf-8?B?a3NPR3hQeTlZc1pNT1R0R1BmLzBpRVhTdjUySVhmc2NnT2JSa1pUY3R2N2xj?=
 =?utf-8?B?Z0REaDhUWDduUk1KUEczRmlxNFFIdURzYTlPZWNxZWU5c2RweThpTVBFRmpy?=
 =?utf-8?B?dllaOXdQMTd1UzFaVWlCaFNXWjg5QXBSWHBWb3Q5K2dCeFd1YTlNaEFJaVFu?=
 =?utf-8?B?UmxQQnFhNmZOZE5xaE9PaVBUUjQ2WEgreDA5QmVUeHRQSWs2elJ1YlZZTlA3?=
 =?utf-8?B?WmVBYitjYVMxNDdVYzRmZlFNbzNZMFBuaFRtOHkyUCtRd1VvcVdYbDBReHJ3?=
 =?utf-8?B?eUhUV1JYYVlrYzVDcHEyK1o0aGN2aElYMkNXSW9kaFJDZmI5UHkreVRFWTRw?=
 =?utf-8?B?Q2E0cG9QY3NxT0tlT2s3aXRwd3JsR1hVVVRMRDNXYlRUNURrQWsvQmVQL2ZN?=
 =?utf-8?B?WjVPRnV0RGR0ei82aXlyK2NHdTd2WUpzbStoSGxwenR2RWtQckZsVnZYU3FX?=
 =?utf-8?B?bjFkNzh5a3RoMlFUR3krN2RZV1dWWG4vNmRVbS9jQkwwaFlGYXpaVHN1WjRW?=
 =?utf-8?B?aldtRHYrTWwxaW5QbERkVFhXWDI2c3NIU0MvT01WMTU5RjZmZC9BZVFJbThS?=
 =?utf-8?B?a2pUdUlXVzVsSzFBVjM0Mzh6b29QRUp4cXpPNk5URUV5SklGcEEzZGNNNGlF?=
 =?utf-8?B?K1VYVDF4c2g1ckRiYk5ORUtVcVNzNWc2K2haRE8ra1hIclBQM0FxeWd0ZGRO?=
 =?utf-8?B?cDBvb2F4ODRaSnFNeVJuU1JaNmNrNW9Tc1VkY3BKYTBHTk95Q0Z0di9tTnpY?=
 =?utf-8?B?LzJ2MW1vZ1RZdVUwOFhieWxXWERsbU1NcTVJREdEc29yWUw2U0J4cVZHcWgx?=
 =?utf-8?B?bCtTWVErUUYrZlBrN0Y2eW55NFYyMXpvZWxIbVdWYjRYclBQK2IrS09ET0tK?=
 =?utf-8?B?M2l2cEFSR3U4M3RoVFgxblhhSlBqakp6bytoS2pyVnJseHRMWTBJZUwrWnU0?=
 =?utf-8?B?UUlsM2VNZ2YvOGZMVzlTQml1VEUvZk9nN09YenRlV2k4NzRpSlpEeXdzc2hv?=
 =?utf-8?B?RmFzclVYdXFudkhRSzU2ZlpvakpTdi92NTgweWJ0TXFjVkRnUG1lOFRIbTZl?=
 =?utf-8?B?SVE3WVBoOXJLVFI4Y0w3cTdXVlFkSTFobzRDbjgydndDSFFwdGc0TDNvM2tt?=
 =?utf-8?B?dkkvQ05CSEh4WXdCWWNIeDk5c3N2SXVVOFpEVFFTRzI0aGJyMWZ1TGlRMndU?=
 =?utf-8?B?L0xrS0ZLdjNoelBueS9ySXl4MTRvQmsyT0FsUXd4WU5xaWtTWnM2T295T2g1?=
 =?utf-8?B?TjNMQ2wydFZLanRDMHd4S0NsRWVrK0RWbzRERGZBcU1nLzlDaTA5SVlnRmN6?=
 =?utf-8?B?NjMwT0lUS3dKWDI4M1MrOXBYTUZFYk5IY0ZleVNHU1I5UFZPM3Eyd1czdXVh?=
 =?utf-8?B?ZWJCUlRpZmt4aUtjOEgvZ0FZeS83YkdPZTB1VmZ0N2JYY3ozbmVDUHVaV3Fw?=
 =?utf-8?B?ZzZXM0tQM3JrUzlTNTZDT2V0c1RFNFBuZ0krNnpYZjBZbFJVUG8xRy8zTjRj?=
 =?utf-8?B?M01WQlljaU52aXFhWlltaXphcVpLTVBGRG5kSkUvTWlSMFI1SkczNVJwRGFa?=
 =?utf-8?B?MG5lYk1xdTNIOXVhUzhzRkcxY3JvZjJzaVo1RnE4alh4dzlLdkNrNjRMRUgx?=
 =?utf-8?B?UzlzUUFJTXpjRk82c1VXZWNRbUh6U3h1WExKQWNTVlVLOThMN3NNVHFRdlFH?=
 =?utf-8?B?NnZrdDc1eVZBdXV0a0tteFVLZmUvM2JXbjM0U2xadmRjU3pMa2ROR2NtSE9h?=
 =?utf-8?B?cW1VTHhaNG43dHJ1WmhGa2s1QUU0N2hNK0hHNHVDa2dJTkV3ZkpsSFZ6MWU5?=
 =?utf-8?B?bmFUNE5ZVForY2RSbDY3VE4xUzlETnlmN000SzkzejFRaktyRHVicmVOZ0Vu?=
 =?utf-8?B?VmZXemJ0d0x4ZENKdWJBWk9lSUV3VEZ0c0JlMFBGbFQrejlqZFdnVERhRFFB?=
 =?utf-8?B?NzNnU0dCZ1cyV1FKVnlQTGtkazIwaE5SOS9SSVFLRGllQjJEZDB1eVoxbVdx?=
 =?utf-8?B?ZWtwaUxab1R3S1Y1RDZMb014cGxiS09JTlhISFdRZ0h6Y3I3VU4xdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34889048-5dd9-4687-ea1e-08de555a90ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:54:19.7424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Kxh2zhphlxMO9L5B0D7yAwK4wZlIh8G0FAtLzVZYsYvPs8nfqGrfEkkKSLZIuf/9Rd0occNebDxSIJp6dqQXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5880
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



On 1/16/26 13:29, Harry Wentland wrote:
> 
> 
> On 2025-12-08 18:44, Melissa Wen wrote:
>> We've seen some shimmer points on DCN32 when using the steamOS color
>> pipeline for HDR on gaming. Looks like black values being wrongly mapped
>> to red/blue/green values. Fiz that by using the exact number of
>> hw_points computed in the LUT segmentation. Probably the whole logic
>> that adds +1 to the latest points should be revisited.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> I haven't had a chance to trace the hw_points logic but am
> inclined to take the patch if it fixes things. My only concern
> is that it reverts part of Kruno's change to increase the points
> by 1 so I wonder if it could break something else subtly.
> 
> Alex Hung will follow up and get back on it.

I will check with Kruno and forward this to next week's promotion test.

> 
> Harry
> 
>> ---
>>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
>> index 0690c346f2c5..ba20575be214 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
>> @@ -225,7 +225,7 @@ bool cm3_helper_translate_curve_to_hw_format(
>>   
>>   	// DCN3+ have 257 pts in lieu of no separate slope registers
>>   	// Prior HW had 256 base+slope pairs
>> -	lut_params->hw_points_num = hw_points + 1;
>> +	lut_params->hw_points_num = hw_points;
>>   
>>   	k = 0;
>>   	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {
> 

