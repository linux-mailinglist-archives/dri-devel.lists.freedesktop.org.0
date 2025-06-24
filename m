Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC43AE5BF7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006DA10E4DE;
	Tue, 24 Jun 2025 05:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WpEYPWK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068A10E4DE;
 Tue, 24 Jun 2025 05:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH03jSSVQFKB7LqyJ1ea0DPS4oDtGh6LW466//F656KNRHlZwClDc9Q06yq7HeQ9tqlRDI4WEaH1CqvbDB4kswgE1ZppM2GrgYNK7eSaccZ+MxKR+PTZWI4JCyJf8HP8PCl2qshijmuBqYgImvy4KxyMAj+b4OWMvJ9afxN/Wpf3DJTyxcbFI4V+IdTlw1/t9ClWFUjHEMRo8EQqeFi7YVTg/flOSGg6GMNm4tjN4coX9ivGt2TlygcVVaiOV6rw/kTxIglkYPaAi6Vg5iZGoCpchUqWl7vp7MDF/PolDGAXKi/Am4crwVRK9lofplbO7eJLPBQqwOM1ViQ6bgu8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfHvmrQ01hzsfdWJmhxHSklMrD7kEgv3kZJjsOET9jU=;
 b=H48vv+NgVxprJe2y6Ma6zDFWU6k/9/jYkgpAYSkifacC3JhvfDKoyP/ZVDevfxRDPBcfVnKT0579w0pE8DizVGwes3PS3e2YONmNW0aZJor/WiwUXbsm34Q9xT6aDOFkvktqM8Qxj0EFCNcUB2HVlMRXzxCH+9Svoy0QPRxxYtKlUmV1L40rAbo50u3P96b9AefVFNPYkrDxlL3AaTEjO1KjjCn26ZbhgJk88XY0P5M+WoVWm4PDsGnHXhzNy093aO+D2ik9O0HpuLdBghv3a/RS+s6Kq7c9371fyzPjSixe5HWOG4Itr5xOXMoC7tqU3OnH5DQvHnUYItUjTgJlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfHvmrQ01hzsfdWJmhxHSklMrD7kEgv3kZJjsOET9jU=;
 b=WpEYPWK16WhE+fjUdzt4rUiVudPU/B+MkZ9KPwDgAOnfGpqsl9mke/AHXn6wc0BlMmtCsMm8C1oBBxzwxRgoWhnnlsIMJ0pUtLclwpcKqfEXS04nT7sU63c85SmQDoE3/r8p5DnoD7naReMVPeQysMJUopEjAMMF1JlEe4V/uug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6154.namprd12.prod.outlook.com (2603:10b6:930:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 05:45:26 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:45:26 +0000
Message-ID: <2de286af-fcfe-414c-b951-384e1acae89f@amd.com>
Date: Tue, 24 Jun 2025 00:45:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type on
 some TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
 <20250409163029.130651-2-wse@tuxedocomputers.com>
 <08ceaa42-a12c-4bd4-bb75-b71126a60688@tuxedocomputers.com>
 <dnu7mbrw7fs4qvwi2alvgrqvonsrucrq7hgxgkqyyqn5djzkkj@c7grkpftjbw4>
 <8c048899-e307-4229-8165-fa70d001176e@amd.com>
 <293be5bc-11ad-49b8-a549-864ce4016f14@tuxedocomputers.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <293be5bc-11ad-49b8-a549-864ce4016f14@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:8:2b::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce81e92-877e-4710-76a2-08ddb2e251c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2xhbFRBSmZFOUQ1ek1TbExETjZnR25WaVdkTndLMzIyT1F5WWhLUnJSR3k1?=
 =?utf-8?B?eVhYOTRyQ1UxY1FmVE9JOVI1ZDhwdmM1bm1MbDg0ZDRaYXZraTNPV3VCekFE?=
 =?utf-8?B?dkp4ODNsalV4L21DYkJmNXVCOFlkV2ZaMGRaR1hvUXlKdGRoTDI1enRrTzBU?=
 =?utf-8?B?VnlLRTZXUUs0WjlVZHp3aGp0MGhHSHdXZGhPMnc1Vjl4RUJ4V3FCYXg1TUVy?=
 =?utf-8?B?SzJwWDNVRXFCZGpjVStsQ0lBVnVidFIrOVBxV0xIRGhZbmN4U25FdWxJQVJ5?=
 =?utf-8?B?S1RDM3hCb0UyeTlOQ0hIaUc0cWRlQjVxekFoUGswZVpvRW1NT2RiVk1sNmhh?=
 =?utf-8?B?ODJERnlHejk1WE5wbEVlRmk5ZnNpN2c2YzBITDN4L3B1bmtjUjN1elVGakZ2?=
 =?utf-8?B?c1pZUlVLOUw0WlEzNkN2ampkanZ3QkhFNDRmVFpkanlkd3UrUmM5dC9CL2RD?=
 =?utf-8?B?eUxBNkszc1I4Qk9mK2QxNUNhZVhEeHhLOHduYkJsNTJ6dTNLS2RUb3RjSGYz?=
 =?utf-8?B?cmd5aDRMLzlWcFpySzJqcjI5M0d5a1VZOVB3cUxKTU1MeDNmZ0JxTXNHcEdU?=
 =?utf-8?B?RkJnSFhyais1V2xkeXppQm5VUVo3SS9OdXo1emZOOHcxUkhlU0swR2htU3dO?=
 =?utf-8?B?aVpxME1mV0ZiaGVzN0dRdWs4RGdnOUlSZzBtS3QwSmpRTXQwT0hDY29FbEVj?=
 =?utf-8?B?b1lVeFlEaTl1RTh5L2N1N3dxYzRnRGxEc0F3Z2Y3eXFtdVBZSkcyci9yQ3pV?=
 =?utf-8?B?SThGbWRCbFBmdHEvaTJQZFZuck9vVXNwWTY4RVJVMldYVldzZElDbVliWURp?=
 =?utf-8?B?VjJEOE83S2grSXlqWHlSUTlGTHJmak1La0hvd0ZGR1MzQWZZZHBOWTcva05z?=
 =?utf-8?B?QUY3aGhaZ3FaeThhR2lDSE9RQmxLUG5RdEs1RlpLNjlySWN1QjdseW05WW1x?=
 =?utf-8?B?cXVFMXpValRodDFvTTdBczQwZEJ6em1DdWQ0eUFjZUVEM3g1RnM0N1hBckU4?=
 =?utf-8?B?dmkwMWlVSTBOOE9scDlYd2V0ZXo2MXh5WUpNak4xVERaS0pZUTl6STF0K1pu?=
 =?utf-8?B?UXJpNTBGbXN0NWRrRDM4eHlKMU9JY1lXekh1NEtFczRnUWxpbGFFZ01RUnFu?=
 =?utf-8?B?eGlicGkyMlZ4Zk1mbXZHdVg5ZG5SV295dzVFQm5HY0NDKy9KbGVEaEIzZ3ZK?=
 =?utf-8?B?dUFHaktGTHpnNU5VdGZKbWh5YlQvRW9JU2lZaUtQV0cxZGphVGhCT0dIdEpv?=
 =?utf-8?B?YVlDR3hmckdUejZvbGdLeWxEZWFRUjlyNU1yeUlpajFPZE04ZXhkeEVWMWEz?=
 =?utf-8?B?STNNUTRndDNyNklQRlU0ODhra3lUOE1oOXg2YU9wYzRCRm9uRE5rOWhuQVYv?=
 =?utf-8?B?UzBxSmR1bTl3bUZrWjFXTUI0OThwTDNVby9ITHlzeXVLVFdQU1R4N2NLN2R2?=
 =?utf-8?B?RDdEMzBEU21sdGd6d0xjUTkyb3R6alJ6S3U3Ynk1TjdLb0x6QlhPcXNhbUI3?=
 =?utf-8?B?bmIySXN0QXA4WGRGeDVnREZaU0E5WGVDVSt0Sm95YncyVFpZYzlxSTRZNWVw?=
 =?utf-8?B?Z1NaekJpZkVaTlcweEhYUERrV0FQdFN6MEEybHZzMWdPUEphODRpTG41ZE1X?=
 =?utf-8?B?Vnlhc21Nc29vSFcxRWVmWVI5bnhNQmQvMmpCTkRqOUgrV21ibGJoR2R0blRr?=
 =?utf-8?B?WmtkV09FZFJxSzcvVmg1eEZDNjRoR3F0UlIrWlZUYk5Nc2FwaENuZUhoRXVE?=
 =?utf-8?B?VUtrWjI1L1d2cTBaVkpCb01YRDZoTm5MOUNyT2RwejFPVytsRFpvMGYrS3ZV?=
 =?utf-8?B?SDdsOUw1TkJ1QjFJcFllNnVtME91VTdMajFXZTB1cENmNGJVL1Jrak9sMVdP?=
 =?utf-8?B?UlFHVng4UEdHM2RvNnV3WUE0MlFpVnI4VlZsZERaTjZQckxGRVN3MVhOMlp0?=
 =?utf-8?Q?ktKGEFbJcRs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW5RUlBLR1E3NkIwUVpmbVBBOUMxUEswSUQ0bHFKSEYxMmY1NXNCZDJKZVY3?=
 =?utf-8?B?UUpUZy9HcHlwcGlyWlg4NjBDeXB4bk1yWUREc1lPT20zdXk3Ym9YTmUzd2ZN?=
 =?utf-8?B?Vmtnc2t5alliMFRZNndublJwNFVDcmRmd2puOWxVY2hxSFBLU0MyVjVEMXcw?=
 =?utf-8?B?RjdWY1hhKzZOTEpJTTNhNmxpbVpWN3p1SXdXeHRxY1FHeWZLYndXazgrM2Ry?=
 =?utf-8?B?STZwZkFVa1B6YjRtZklHRk02OERMMlZKbE5GSDZKVlJFRTdUcnNzcVVBNnBZ?=
 =?utf-8?B?YXc1UDE4ZlgvekNYeDlzRUNjOGVSd1FZNUVMSmNLczVreTEwNEhhckVDaGs5?=
 =?utf-8?B?MG03NlJPYVAvNGtid0pSVm9OaUcxNVFnd0xaRm9wMW5xVGliOVFtUUh3NUpM?=
 =?utf-8?B?Y1hheUhEbkRNRDBBSFVQUC9UUGNYZWRYU1lmcUdDWGZZU2gvUld2eXZYMEtt?=
 =?utf-8?B?T0E0UjI5ZFE0Tk9oWjZLd1JIdkpWM0djUnNWYjZwdjdEREFqK3hjNmg1bjVY?=
 =?utf-8?B?cFRrd2pVY1lJSmFRbnZRRzc3S1RaWmYwcWZTNWRlS3h3SUhseUM3elFXbTFV?=
 =?utf-8?B?amhhbUM4bFNYU2xaQmRPNFo4TFYvRUM3YUMzUDY2RFkvdHNCQ0pmajBlVGUw?=
 =?utf-8?B?THJNTXdLOXJ1K2pncTh6S0NyUU9kYnpGT21kZFBPTSs5a0hvSWlxbjhjNzFa?=
 =?utf-8?B?bjlyaGpGMUswc2xRdytlTEF5M0dMclhlYmlZaktjb1hLbVhPM3hQajBqRmZn?=
 =?utf-8?B?WUg5eDh5TkFGT29QRDNkR3lrdTBvWDYxRmZLa2FFM3BPVWpZZE1rWHczZXJi?=
 =?utf-8?B?VDkzSjAxY21GWXJJT3RvczhpeVN6a3A3YkpCRXVpbS9weWJiM2hoRWFlQnl5?=
 =?utf-8?B?ZTNnV2FJZ0tVeWpGa3ZRaGs2czg5blVPOTVTSHFxaGU1ejJLK0kvRkFwTTl5?=
 =?utf-8?B?SVozU2x3eXpsV0JWMDd1dDhFQWF2YVYvRld6YmkxaWZIa3A3c0N3OGw5ZkhI?=
 =?utf-8?B?SlVoOG5IRU5DVFFQYk00cXh3MFNIL0d2RGkrdHoxZWYyN0MxUWtIdW5OTkRu?=
 =?utf-8?B?Nzg0L1hrTC8zSkF6MU0rRmJHTm9QWUlTUjlGNW1KdlRnRGFnUEh5cXJFRjhP?=
 =?utf-8?B?WE9ibzh6Q2FXek93Sk5vSUdoanB4ZCtFaXlsbVlubGJ5VzhHQUFseTA0QWJK?=
 =?utf-8?B?M0cxMlBCcUUrTXpLVUhzMmZRR2REVnN2WVRIem51LzRRK1ZNUDFsY05zUlhK?=
 =?utf-8?B?cFpEZHRFV2RhelJCTjBHTDBMcTNIR2hHNlQ1S1dpVWZBSkQ1RXlvV3lyNFNC?=
 =?utf-8?B?OWYrbmx2QS94M1lmZDVVcUhDUUNDT1JBb1pIaUxNRkZhL0RacTRveFFjTGdk?=
 =?utf-8?B?bVdEUXkxR0l5N085QzI2Q1FONnNzLzNyb1NBWTloVTlsNVNYbkgyRHk2WHZH?=
 =?utf-8?B?N1FFYzRSekx4Ymk4eTE0VERVbmtxS2krVWJaNWZzcEVSd2Q3cHpXWFRJdW9Q?=
 =?utf-8?B?bUFSOSsxcWxpZWhhajdqbXZDWkFvakRnbXE0UVFiR0YwOGZ6Tm0xL2pZeit5?=
 =?utf-8?B?d0dMNmFMRFlBSSs3cGVyWDQzQ25uYVR3VkF0NW1sTnVuaklBRzQ3Nk9QamJr?=
 =?utf-8?B?S2N1U2p4Zys2WGY1TTRvQThoQlR0UkxRbDY4b1Vza3hjdTcvc0Z5V0ZwUDVQ?=
 =?utf-8?B?ZkZXOG1yWDF0dERwaFJ1MGR1Tm92SDgzZVE5b1REVnd0eWdvM2hXZnFnMEl5?=
 =?utf-8?B?dWJPMDAybGFuUXZOQmN3SjUxNHNMVVp0UHV4Q3hxdzV4N0NGY0NsVUpwR0px?=
 =?utf-8?B?Z0JnVTEwRGo5SlZoT2htVFQvaVpNQmtPaG14dlBvYVowby9IaFg3TGpQeitK?=
 =?utf-8?B?am5RbUNuRkpWb1ZlWFZqOUltbnM0QTZoditPb3ovOFV3b1hnVmMzOWgyR2ZO?=
 =?utf-8?B?d21WU1l1elkwSndGUFRJSTl0clY3d28zNXB1Q1RFM0lFOERpQ2FhVEFmeTQ2?=
 =?utf-8?B?ZnQwVkJFc3NtVURvaFZ2TFNlZUZ1V3ZvTGpFYUUzcEEyY08zSGhlU0hmaUN6?=
 =?utf-8?B?SzczTzAzRWxaM293aFB0eWZmMzZkelJPVzBacjRyYU1tRFdnc21HUEVhZ2lr?=
 =?utf-8?Q?O7s3ubBxw53V7oOqRfLTUHr8f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce81e92-877e-4710-76a2-08ddb2e251c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:45:26.2268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLmxoQ1xlk30vL4O/O+U2EglDAUdz9BTGey1Mvh6qmalbeiiZuumHg20RdME4rb3BpULtrvI7AF2zyyT5n/XOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6154
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

On 6/24/2025 12:42 AM, Werner Sembach wrote:
> Hi Mario,
> 
> Am 23.06.25 um 21:42 schrieb Limonciello, Mario:
>> On 6/23/25 2:13 PM, Rodrigo Siqueira wrote:
>>> On 06/23, Werner Sembach wrote:
>>>> gentle bump
>>>>
>>>> Am 09.04.25 um 18:27 schrieb Werner Sembach:
>>>>> The display backlight on TUXEDO Polaris AMD Gen2 and Gen3 with panels
>>>>> BOE 2420 and BOE 2423 must be forced to pwn controlled to be able to
>>>>> control the brightness.
>>>>>
>>>>> This could already be archived via a module parameter, but this 
>>>>> patch adds
>>>>> a quirk to apply this by default on the mentioned device + panel
>>>>> combinations.
>>>>>
>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>> Cc: stable@vger.kernel.org
>>>>> ---
>>>>>     .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++ 
>>>>> ++++++-
>>>>>     1 file changed, 31 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> index 39df45f652b32..2bad6274ad8ff 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> @@ -1625,11 +1625,13 @@ static bool 
>>>>> dm_should_disable_stutter(struct pci_dev *pdev)
>>>>>     struct amdgpu_dm_quirks {
>>>>>         bool aux_hpd_discon;
>>>>>         bool support_edp0_on_dp1;
>>>>> +    bool boe_2420_2423_bl_force_pwm;
>>>>>     };
>>>>>     static struct amdgpu_dm_quirks quirk_entries = {
>>>>>         .aux_hpd_discon = false,
>>>>> -    .support_edp0_on_dp1 = false
>>>>> +    .support_edp0_on_dp1 = false,
>>>>> +    .boe_2420_2423_bl_force_pwm = false
>>>>>     };
>>>>>     static int edp0_on_dp1_callback(const struct dmi_system_id *id)
>>>>> @@ -1644,6 +1646,12 @@ static int aux_hpd_discon_callback(const 
>>>>> struct dmi_system_id *id)
>>>>>         return 0;
>>>>>     }
>>>>> +static int boe_2420_2423_bl_force_pwm_callback(const struct 
>>>>> dmi_system_id *id)
>>>>> +{
>>>>> +    quirk_entries.boe_2420_2423_bl_force_pwm = true;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>     static const struct dmi_system_id dmi_quirk_table[] = {
>>>>>         {
>>>>>             .callback = aux_hpd_discon_callback,
>>>>> @@ -1722,6 +1730,20 @@ static const struct dmi_system_id 
>>>>> dmi_quirk_table[] = {
>>>>>                 DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 665 16 
>>>>> inch G11 Notebook PC"),
>>>>>             },
>>>>>         },
>>>>> +    {
>>>>> +        // TUXEDO Polaris AMD Gen2
>>>>> +        .callback = boe_2420_2423_bl_force_pwm_callback,
>>>>> +        .matches = {
>>>>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>>>>> +        },
>>>>> +    },
>>>>> +    {
>>>>> +        // TUXEDO Polaris AMD Gen3
>>>>> +        .callback = boe_2420_2423_bl_force_pwm_callback,
>>>>> +        .matches = {
>>>>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>>>>> +        },
>>>>> +    },
>>>>>         {}
>>>>>         /* TODO: refactor this from a fixed table to a dynamic 
>>>>> option */
>>>>>     };
>>>>> @@ -3586,6 +3608,7 @@ static void update_connector_ext_caps(struct 
>>>>> amdgpu_dm_connector *aconnector)
>>>>>         struct amdgpu_device *adev;
>>>>>         struct drm_luminance_range_info *luminance_range;
>>>>>         int min_input_signal_override;
>>>>> +    u32 panel;
>>>>>         if (aconnector->bl_idx == -1 ||
>>>>>             aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>>>>> @@ -3610,6 +3633,13 @@ static void update_connector_ext_caps(struct 
>>>>> amdgpu_dm_connector *aconnector)
>>>>>             caps->aux_support = false;
>>>>>         else if (amdgpu_backlight == 1)
>>>>>             caps->aux_support = true;
>>>>> +    else if (amdgpu_backlight == -1 &&
>>>>> +         quirk_entries.boe_2420_2423_bl_force_pwm) {
>>>>> +        panel = drm_edid_get_panel_id(aconnector->drm_edid);
>>>>> +        if (panel == drm_edid_encode_panel_id('B', 'O', 'E', 
>>>>> 0x0974) ||
>>>>> +            panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0977))
>>>>> +            caps->aux_support = false;
>>>>> +    }
>>> It lgtm,
>>>
>>> Additionally, I believe this is safe to merge since it only affects a
>>> specific device. Perhaps display folks would like to include this as
>>> part of this week's promotion? Anyway, Cc other devs from the display.
>>>
>>> Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
>> That's a bit odd that aux based B/L control wouldn't work.  Are these
>> both OLED panels?  What debugging have you done thus far with them?
>> What kernel base?
>>
>> Could you repro on 6.16-rc3?
> 
> Sadly our archive is missing this panel + device combination. This patch 
> is based on our install script that sets this fix via boot parameters 
> since the release of these devices.
> 
> So the quirk is field proven, but I can't actively test it anymore.
> 
> Best regards,
> 
> Werner
> 

Do you recall what kernel version you were doing it with?  I'm just 
wondering if AUX brightness control had a bug with such a kernel.

Do you have this panel on some other hardware perhaps?  Or could you 
send a call out to get some testing done?

>>
>>>>>         if (caps->aux_support)
>>>>>             aconnector->dc_link->backlight_control_type = 
>>>>> BACKLIGHT_CONTROL_AMD_AUX;

