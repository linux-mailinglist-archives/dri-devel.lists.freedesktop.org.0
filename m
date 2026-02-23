Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGeaIIGrnGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:33:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3556517C6C5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562E10E435;
	Mon, 23 Feb 2026 19:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uuFR5YiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9F810E2C6;
 Mon, 23 Feb 2026 19:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPD4eBIWuT2TeATqfz5Tu8pGb7haYAuTCN7RO0cngOTfqAhfrJUdL5rIE38Yvon3YWWtawfGw5aFx1MWm33ycWzVVKWVb8U2mYUpp/wikph8pnpUD5nUZQ/44+yGOf8wgKcEbSyVurwQNEQrl2GvcmsGPHMQsHibUuY3Las+jSeFB0hAaO/JEXtgCNNgxDriX5KBNuBHnwCwEeQXy5/q8tWmCOzNm5C1NiYntZuzXbfR5LBPlcV8TJTefipTZ1rxZ884J1RVrbJEgXKrCklSQUUa85R6IUBr+RC4ofuNH1AdbLAqq+2iblORittNs8KPFyZDTnYDtFiu/3cso8cKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY89LgWOuvije5Gy3YO5UQoGZ1P2EZ0Son91nXj6YCw=;
 b=xkxuiV2E+Zbg2vyr+HIQhPqvIfcfF09pQNXrdVgMGmJnGKeykqMTSTJtfaRqZigK4zDfkGNbDYLE/IlZjRSXpVjC9/4QKH4cQNcve+91i8xzW/y25SMOXJ5/DuDRAx4uAf4sJx+bYA0kovNvVFwN+AA43toUFFwuRx5lR3pgYgRBNVCcJHyhDJiYYBUBCPdo1Eu5ac/zvACej1Msw5Nb3rQo6P+LOM+PjQ0945ypFYBHMkjq7jNpJ5acY0PjX+d0PX7zEEWHHR4t0JnaNKnwriACjoWTr14DJERhhtW89B4T+gUcg87pGIeHQ6fT0aRWcwK8fR4Tyv0PHvpixtVr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xY89LgWOuvije5Gy3YO5UQoGZ1P2EZ0Son91nXj6YCw=;
 b=uuFR5YiAr8MmaSBWkS2V4DXC6HncSzuK3LIilseyDthDFrh5aoy0Ie1uhpRMIi0/rCJi4XRBs0olU9tsXcJbUzNjD+6eKQ+pmovgxhYFLLDl6AMEr9KQLDgi+lAkB+J5Yxt4C8ucXPQ2yVtaQkl9hq3AW8yTKWWtEc3lTO3XN54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:33:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:33:09 +0000
Message-ID: <7b3811c5-1086-42a6-8324-b7ec927a74a5@amd.com>
Date: Mon, 23 Feb 2026 20:33:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20260223172553.1663749-1-matthew.brost@intel.com>
 <af898ec2-c373-45ce-b78d-2002f43e3dd9@amd.com>
 <aZyodmAdQgWRX95Z@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aZyodmAdQgWRX95Z@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:408:f7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: be87eeb2-05c7-472a-3445-08de73126054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkw2YWo5dlMwQ3lET3pMSkQyenk1Q2doVjU5WVFFU1JNdWE0QUV1NVN3aVcz?=
 =?utf-8?B?Q2FyZUhsbGRJNTJ5b01LTzhmamRnemhVVE5XcmVpakZtMFhDOHpKSWZGSHN5?=
 =?utf-8?B?Q1RIVmY1U3NnZGdVM0Fpa2o2WTkzTUpvczdoWmdmQ05WTGtQY2FycXBaNHBQ?=
 =?utf-8?B?NkxHdlBCeU1Wcjl2eUk3djVVWEdNc1NDclNaSU5CQTY3WjZvcXg0c3pjYndm?=
 =?utf-8?B?ZVZ4azZwbjQwZWNzODR2elcya1JjY2FIQnN3TGNZYXVHZkVSWU11SGRRcVk4?=
 =?utf-8?B?WXFnNHdFR09MTk1IVnp4VE9VVVNJbUVDYVJuRHFadTVuclJ5MC9XSWxOR0Fr?=
 =?utf-8?B?OFVzYUZCT0pwUEFpa2VFdHFSdDJkVVNsWUsycnRwelpoUzQ0a2VLRnhVRG02?=
 =?utf-8?B?QVBsOGx2Y0E5Rm8zZEYzVVh5NlRsVFN0Yzg5SXNkZmdRNC85T0ZwZDF0UXly?=
 =?utf-8?B?eVhwbDRiWGp6NEwwcTZyZkRMQkkxOFZHSmhjODBMOEJ3M1BiSXZtd3lVU0M5?=
 =?utf-8?B?UDJzTjE1V09lTmU1aG5kelNFN1ozcytWS0xyNmRPY2haL1ByOU1kbmdZNks3?=
 =?utf-8?B?ZkNHUzk1bGswRHJtUUNqSWZlMDY0ci9sL0V0TnI4dk9QM3UweUZOYUY4Ny9a?=
 =?utf-8?B?aDBDQ1lRM1pGSnlnRXFzYzBwekxaQ21IbVpLN1RVdEFRbUhOMEJWR0czN1VS?=
 =?utf-8?B?TXptUkwrU2ZvNENaL2F5VjljNGJ1NmxjKys4dGNsS2xsZmlwMEZtS01GWElO?=
 =?utf-8?B?aXgyUVFIVExZcGNKNGxvV3llZnZiQmJyZThoQm1HMVFlSVFvZFpKRG5Qd1Nn?=
 =?utf-8?B?RVdEeE92bHd3eDZhV01CNDBNSlp4VFYzK01EbysxZWM4ZVc0OGtDNmorRzQ3?=
 =?utf-8?B?U0VCWk9VVnF4TEx6Y1puTjZsTEcvZmVNb1AvYzMyMDkvMnNIbHZEbTNLYXVY?=
 =?utf-8?B?SHdJcTE3WndoY0VTeG5RdnlyMHN5eEtJWXRMcDhzaVl0c2hFWmZ6Z1lCRndW?=
 =?utf-8?B?a3RpNUoxZFNpTnJVM241SzZkNks4YWNmVkdPS1NpNVlZVERsUnErdm54Vjho?=
 =?utf-8?B?NVVWMmg0RmtjekJOcG1tV0p1WlBFeE9lSzhjSlNHc2QwNXFBZmhiZW94TnNm?=
 =?utf-8?B?bno0L21jdGdod1MrMDZKaWR4TWZSM2JJRGNDUEt5V1JNeWhLK0xzbGI4N0JP?=
 =?utf-8?B?blJRcDNCL0xaWWJza0lCb0dCdjV4S2RyektUVEJsK1Bkd2ZLV3RTY0s2eitI?=
 =?utf-8?B?ak5aVVc3RXNLck5sbHNNekp1K1dNbzFlL2JZUTh5dCt2ZjFlVHlIUVE4QSt3?=
 =?utf-8?B?VDg5aDFWRGpwSW9qWFFPVXZYbHFSMWZKbHhST3BBdE45RWlRQ3E2WXdIZHhq?=
 =?utf-8?B?Rkt2bkdtcmkwZmcwa0RrcXpURU92VGNpYVlSQWdBS0QwcmJYdWRQMndTaGNH?=
 =?utf-8?B?VXpZR3JPTmNySm9BRmFnZEVpUFZwMlg2bFUvczdQTFFlc0lQMzNCeUFKMjV2?=
 =?utf-8?B?WHhQNGVMWk13VjJIWm4wNWMwVkVRcG1GeFZUQzFCbjg3R3RqdUFRSjlrbDZv?=
 =?utf-8?B?MCs0Znc1UHhEazRPTG5KTFIvdzhBZGJETENDVlcwRzlGNGRzUVRiR29lcHZ3?=
 =?utf-8?B?cmQ4UlJJMVdDNW5IeFFDcE15UlJYR3prYUJTWi9yY3JINVFCemxXUWpMUjNj?=
 =?utf-8?B?dUs0VDA5VDJUK21VRE1RRXFFZmZkUnlwN3hubUxSNHlpTGwrd3Bqa0N1SldB?=
 =?utf-8?B?aUJDRWxrWE1rc1g2QzJqbWZ6MlZhOXZxNVVodlVTbEFoWGhrTkNGMUI1L3pO?=
 =?utf-8?B?SUVUZTJ4NGN0NDVrekt4ZGFxbjFaR2pvTVpvOG5hdzR0TGNIVitvbDd5MWpZ?=
 =?utf-8?B?K3JUVWRyWDNxK2NtUkUrSW9zZUw0UldLYmU0QjEySXdEN3plVFQ0OGRuRzRx?=
 =?utf-8?B?eXczK2wvOG92Q0NjNHl5TlRta0tHODhoR2ZqckJTOXRJenJPMHFMeVREb3Ju?=
 =?utf-8?B?RkNNcjluQTNZTE1SZkVjdnBvZ1BHVW1zY2pwdWRDOHAyNEFYN2hLWmFCejhn?=
 =?utf-8?Q?68w8Ir?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVlvNnhmck9QYkdnL2tnemxYdlRQSmFJOFhrWENRMW82Sk9ROUlDZEdpTnhT?=
 =?utf-8?B?Qm5XMW9EQmxIeFAzaFNXejl0QThZTFV0ZmFyY240Z0R4OUhZWjB1M3Joc0ta?=
 =?utf-8?B?U1pHdFFEWmRCdlRFZkRlWHZFWm9CR2RtZWZhRFJydEVMckVRdFkxaWhaWW14?=
 =?utf-8?B?Q2QzTHh2dmkwMHN0NSs4eXJRdUkvMFUyU1ZvblpPMHRwVFBUeng3eFhQSTRL?=
 =?utf-8?B?ZFUyU3dCRTJsVVBKL2Q1SHJNekc2Yk1tQStjWkNJUzFUSWZzdWQzNzRMRjlS?=
 =?utf-8?B?a3Z0NUpBWnZlMmhmQ3NWN1dWaXpXSCtTWGdnNEhVSllJNlovLytKYzdFVGFL?=
 =?utf-8?B?OWZCbTJQbW9pZDVNdFoyeGdGN0VXR1hXOHhrbVdZYTRWb0tsUHNRSU0vRzlh?=
 =?utf-8?B?Nm80dnBkNzNmKzFEcHlHUjRGcnVqNDkyM1luL0xVQmRpMkl3NDBQQm53cjJU?=
 =?utf-8?B?WkV0cjV2UVRBa3lDNy90RC9BSGkxVzV1R0lpQkR1Y0JONWxFVTEwUk9RSGxk?=
 =?utf-8?B?bVNOWlQrcHJjUGJjRTdvemtVSTkyQlF0Q3FHMlJUVGlhVkFXdlFGWGx2a2R5?=
 =?utf-8?B?OVpxSzhPa3BlUnJnWFZKd002VTU1L1ljTWVVcmR6VnNld3JNWkVacVpYTExE?=
 =?utf-8?B?NVhVMkQ0K0VIVzYyMlYxRXdFajRENGF3NjM5dFhSUGRYY21WMGZRZC9XcUl6?=
 =?utf-8?B?RGN1MG9wcTRLaUhFY1dzQThUZWV4R3NoTWE4UzVFK0F4dDV3OFRURzloUlF4?=
 =?utf-8?B?VXp5ci9IYkFIWHRVdGtJa3ZlSy9vTGJLVTZSOEpQdC9rbkdTNlZUcHY1L2tK?=
 =?utf-8?B?QWY4KzM1cjZSL2h3MXZZNmllNFEvblh2S2doaFZRbVNVTW1PYmk5a0VPYzdw?=
 =?utf-8?B?ZW1qTXduaHlsVm1CeGF5VzU4WEZJYnUwZG12MUVaQzY5TWlvUFRhR0o2b2Zo?=
 =?utf-8?B?MGErN2NDNm1EY044M3lBNnBmQ08zbXVsbFVxNjNQcEYxU2hrSXpDTFU0VURv?=
 =?utf-8?B?OWg1bkd6M3BlcHQ0YVRhZTVvbGEyekdHSDh0bHZ1cHBuMGdqWjc3OGg4aHVY?=
 =?utf-8?B?YVRKQzA2Y09xNFZQZFRrc1R1dnpQSG5XWW5KZXpvYUQweWtsMFQwMnRUdEwv?=
 =?utf-8?B?aDgwT3dQR0QyYnJCc1ZyZjUzQTQ0YW5wYzltaVBRMWo0dmVRZnJtcWJxNUky?=
 =?utf-8?B?dWxrRVJSK0ZScjdDWUFoMEtWQmx4SnJ5eUVaQk9GNjFacEFwUUR4VWc3QTdq?=
 =?utf-8?B?dGYrUlRHbmtSR01EM3RHZ0E4NVVGeWszdlVCT1NTVFoveUhDWHFSSVhvYVR6?=
 =?utf-8?B?V2tiemdBWUR4dzJ5emV4VmdsbDd4dWI4Q2JaT1hOcTl1bnl1VUIwV1FFb2J6?=
 =?utf-8?B?UU5YRHh6UFZFdFc1MW92RENKU0NqbGw5dHp3Z2tLRk1ua2Q5NnBEUjgyOXJv?=
 =?utf-8?B?dmVQZEFsVVdqZ0FlZzFVeS9PMFBxWno0aUVLY2lmNjlQMU80Ym4wWjhMZVRt?=
 =?utf-8?B?YUtzdDk0SXVndHJndFJpaGJSWTNPZ3kxNFpLSkVmSmc2RkdCNjhXMVNiTFpi?=
 =?utf-8?B?N1BXd29lekZad0E5UStPNU5lRDdibmU2WVp6YjBySkwxdW5saVNhd3piYkF6?=
 =?utf-8?B?RWdzQksrMis3enhqTFVGVCtpZzM3QXkyZTE5alpvNjh0dzlkNFBnRlE5WU1B?=
 =?utf-8?B?SjBnYXlkWWlwM3dYLzlXRWoweUNyWUFEenZLbWV2cVlvUlUxZHFTRklRRUY5?=
 =?utf-8?B?ZjBPT3RCaUJlMFJ6MjVzdDdzN1V0Ykl6dEplNHdhMFFMbmVTK3FleklHTVk4?=
 =?utf-8?B?L3ZYU2xOZ3FXTXl2clFORldwNW5tL1BKeEhwb1YrY2xDV0QyZXdscUx3aGpj?=
 =?utf-8?B?SmtvYzRuNzNsMnpwZVpDOXgzSlppd1Nld0tkVngwSzUyZVBHSEhrKzdMYVJt?=
 =?utf-8?B?b0dhZXVqQmg5ZEh2dXI3dklyU2RqYXBFZWJoM2R2cHdsYkZGVlUzVEhzclVC?=
 =?utf-8?B?WHgwZnZ0aWNKcjVTQjVzUmI1RVNBaGFDdUp0R2VPSEhYQUJPOEttazhURFVs?=
 =?utf-8?B?Uk9rdW1KZHE3ZXZyYVJMK2RHVjUyY2ttU0VlUWhjQlY4WGp5VDR3L3pUZVI3?=
 =?utf-8?B?eGtsYlBPRVBPYjY3YlpxWHpVeGVVUEpmbEtrTWhUQnozditSbGRtMVNHTW9W?=
 =?utf-8?B?WHBBRjlBcjBqQ3kvQmJPTllRK0FJOWV4c1BEUGlSMUZDNUVnd2xJeDhhc1ZQ?=
 =?utf-8?B?Lzd6ZzdMRmdyVERuRmhrMUZaSDhLRU9XNTNSV2laM0M3WCtlYmovK2N6b1oy?=
 =?utf-8?Q?y6B6Uz2yVsorXq+zKc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be87eeb2-05c7-472a-3445-08de73126054
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 19:33:09.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKvQ0XjwOP11ekYJD1I2bDhOPsuAadWuqvvoVqMMOkw/iT3yFzYvmuIEyoYn0Rts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 3556517C6C5
X-Rspamd-Action: no action

On 2/23/26 20:20, Matthew Brost wrote:
> On Mon, Feb 23, 2026 at 08:13:34PM +0100, Christian König wrote:
>> On 2/23/26 18:25, Matthew Brost wrote:
>>> The i915_active selftest no longer builds after the dma-fence locking
>>> rework because it directly accessed the fence’s spinlock. The helper
>>> dma_fence_spinlock() must now be used to obtain the spinlock. Update the
>>> selftest to use dma_fence_spinlock() accordingly.
>>>
>>> Fixes: 1f32f310a13c ("dma-buf: inline spinlock for fence protection v5")
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Thanks for the patch and sorry for the noise, just one more question below.
>>
>>> ---
>>>  drivers/gpu/drm/i915/selftests/i915_active.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
>>> index 52345073b409..9fea2fabeac4 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
>>> @@ -323,9 +323,9 @@ static void active_flush(struct i915_active *ref,
>>>  	if (!fence)
>>>  		return;
>>>  
>>> -	spin_lock_irq(fence->lock);
>>> +	spin_lock_irq(dma_fence_spinlock(fence));
>>
>> Is it guaranteed that this is called from interrupt context? E.g. why is spin_lock_irq() instead of spin_lock_irqsafe() used here?
>>
> 
> Idk, this i915 stuff I’ve long intentionally tried to forget to avoid nightmares.
> 
>> That's basically the reason why I missed this.
>>
> 
> Also, please include the intel-xe list for CI — that will catch issues as well.
> 
> We’re making it a bit further now, but we’re hitting a lockdep splat [1].

^^ that actually looks like a bug in dma_fence_chain_enable_signaling() which was there before the patch set and now just get bubbled up because lockdep can finally check on it.

Just reverting "dma-buf: use inline lock for the dma-fence-chain" should silence that again, but it is clearly not the right fix.

> I can dig into it now; hopefully it’s an easy fix. If not, I may ask for
> a revert. Give me an hour or so to look into it and I’ll report back.
> But again, please include the intel-xe list for CI on risky DRM common
> or dma-buf patches — if the patches apply to drm-tip, CI will run. You
> should have permission to trigger this; I believe all AMD emails do.

I did that on an older version of the patch set but never got a report back. My assumption was that it's working but could be that this actually never ran.

Regards,
Christian.

> 
> Matt  
> 
> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-1/igt@xe_compute@compute-square.html
> 
>> Regards,
>> Christian.
>>
>>>  	__list_del_entry(&active->cb.node);
>>> -	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
>>> +	spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
>>>  	atomic_dec(&ref->count);
>>>  
>>>  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
>>

