Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA45AEDC21
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4510E42A;
	Mon, 30 Jun 2025 11:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Oow6qVdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5432910E42A;
 Mon, 30 Jun 2025 11:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/IlUS1PKQPnsxMQjHDJEOE7aONjdRic5m1ysLJbwitbou9hJ5iW/55FgLmBr6txDsINJVsFsaHbdW+1VZaUMauwyygEvab2+kTXh+cB6DyKsnDXoir8bjAL58zcfJtvl1VPgOKgOx0T7oh7LWc3MoflcBt9pAdJ8jscnWlgZuERJHVbEorUiJP2ozpACOzwo0AldG3OK/ZBnEkUD6xXwVZgg0lWa9o6iKqF5c6sg81kJ4lk30yk6d5gUp48VWZ8rKxAbm8d7JJok2pdvWq5E3XvzuCtZcqUFkElno0Su/SoHhvHePdeDoOo357zr7BwrYg+VRg8sNribrBz5Py2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXhW9lH2xrMO1zm/Hw2E0sOkTMT6BVtsQhFT0EQcM2w=;
 b=oBmJImP2I6qz8XZqSlVtloRadsfOHRku5XvXqcrWDGdD82UycIe/t5N48PGLvBiejjyTgppphGI7DCqtNI9vn0eBQH+lrVCt5MqDaO+w97RiVJ800Tvf/z82kO8XGR112VCjU0RgRVj+lOegCQPP7c97Gzdcj115VBBGalTAkp6tzP9rduTbos7i/QBl/3w5BjqkkJzyf6bH3iCp3pusm9iFgdjCQIlezkSuH515mHbBL1IjIJWZVG9bj9+pBvW7uvFCnssXrU3DD7NIA+VN28paI3sTBUaSsUjfZ3ulXuvk0YR4oeHOxb1QeIDsnrlSgEoPESN2VujlPHbR/eM/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXhW9lH2xrMO1zm/Hw2E0sOkTMT6BVtsQhFT0EQcM2w=;
 b=Oow6qVdAvbS8nCF2X7+chWkD7Dc2quvX7G5KhXBybqFWl2IStMU1TL9SKQrpIytjTmfOGxOeY65ztLsBEdU5EAkPRNRBheUC1iWBgJjKDNPZUfXuJ/szaVV+MY412z6MiYXFDAfKBzB97bI6xBCmLXlMniFwav/b8otVKSeS6io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 11:58:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:58:23 +0000
Message-ID: <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
Date: Mon, 30 Jun 2025 13:58:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: Samuel Zhang <guoqing.zhang@amd.com>, rafael@kernel.org,
 len.brown@intel.com, pavel@kernel.org, alexander.deucher@amd.com,
 mario.limonciello@amd.com, lijo.lazar@amd.com
Cc: victor.zhao@amd.com, haijun.chang@amd.com, Qing.Ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630104116.3050306-4-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5f9dcd-583d-4027-ad2d-08ddb7cd6a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXdaeVBHNTRBdzhQbHBPb0RydlRVMTliUmdUNlpPMEJCWXBnbk5PS2YvTG5m?=
 =?utf-8?B?VGIwOGpQaVJwOUsvVlE1RU9heTQzRWpDdE1wQ1RDWXNZeW0zbUhjR1hNREx5?=
 =?utf-8?B?NlMrTERFVUYzQU82L2gwa1NPekk3Y0srR2p0eFdCaGNTNFBIQ1puejgySk00?=
 =?utf-8?B?djlhNTRFK1A4VDcrQ0NJN2w1bSs1V3ZXZHQ3OXYvczl5TDhrZGNOcFBDOE9s?=
 =?utf-8?B?dGJSbVBRUllOaE9OUmRmclcvRnd2R1dEY0puaTNXQ2o0dDluTTl1bnA5N2Js?=
 =?utf-8?B?cTA1U2RzN3M3cDRIZ1VOUFY1b0RnNW5QUys2S2VsNEcyaTM2OG9hSEpRd251?=
 =?utf-8?B?enBwU1Juck40WUljZldvbHpwVGxRa2QyRGFKcVFyc3FiUGNRZjlxRko4cWhJ?=
 =?utf-8?B?VnE1MWJoZ0J2bTdyajJJMGZYUTlGRmU0U3lqSUpCNmhHRFpkSzRSelpZTXds?=
 =?utf-8?B?RzVZMmkyZS9BRmVVaUZZZ2MvUHhvYjBmeFVWVStuUkFXTlY5N2VZRGpNanZW?=
 =?utf-8?B?Vk5IcjdLalJVL2UxQ0hidGFGY0Q5Wld5cTdXOHFOa2xtNG9qR2F0S21Pdmk5?=
 =?utf-8?B?YXA0R1NwZ1ZBZGZBQmFFS0Z4Ti9PWmIvdFRadXFQOFFuakVwV09KeGtkbkcw?=
 =?utf-8?B?d0Y2b1ZIVFhzZ2RDczRucVZMNVRERXcwNGdxYU81SW1kV0doVFBZTzZsZnkx?=
 =?utf-8?B?WnIxYXRGM3VwUlAzc3lXdlo1SEdubGFLcmlZRE05dVJnM0w5MkppOUhDSXY3?=
 =?utf-8?B?alpCcFhzSkdLZUFjQkNVV3pCOVNDdE4wbWd4azY2VHdXVUlZaE1wUW5FMWJW?=
 =?utf-8?B?YkhuSGVndnZiOTJvaHZDUitiZHg4YW5TZDIrM1QvbHpXais4YXl6eGVzUmg5?=
 =?utf-8?B?Ui9Fbk5CR1JSaFhCN2lIc1d6TVFyZ1lWekMzOUJPVmJSeHQwVkFzRlBraWFG?=
 =?utf-8?B?NDB4VGROcm1yaU9lRDZSQm9DVG1yZHJ4Y1h1cnhrc3AwNE1KaGEwRWp2eWJ0?=
 =?utf-8?B?YTFFK2RFS3UwZGJFY2diaFM2bDNpODZSYklYYW9HODFrb0cyK1BOd2hDck1G?=
 =?utf-8?B?Z0U2MjJRMDBRdW9DUUw4NHBlRk55THRSZytkWG1ndW9ZV0FBSlE5eTBvNkVt?=
 =?utf-8?B?dUI5SUV1aXQweE9yM0NUUWoyQWY0eWkvNjVGNFM2UjZqTUZsQnFVVmZmVWl0?=
 =?utf-8?B?dWpkTitWR00vMDVFbVVqdlcyTThzd1JUMHFMWEF5REtVRTNBOG1keEtETDlE?=
 =?utf-8?B?cEkyaUNONTI4Vks5Mi8wcFplUDJyazFGdXpibkVkWFBMV1ZVTWxVMUwxZ3hs?=
 =?utf-8?B?WUozLzdPSEFiVDQyT2N6cTBOWTE4QmxsUStZZmVjdlVXd2xEeE8rS3YzOVRT?=
 =?utf-8?B?V29ERDhxQjVwbTBSbXZleEVMT0JjdHVTUHpESmxTeEg2amR4ODRCTThIbCtH?=
 =?utf-8?B?TDBxbEw1ekNGWXVjOVNRL1dTMDNMSzlZb2pFN1NpVnZmQVZIakpwaG5jUkNa?=
 =?utf-8?B?Z1RVWlZ1Q1VqeitDWnpFNVBmdnZXcEt4MXJKeFp1Qng1azUxNFIrVzlPTmRp?=
 =?utf-8?B?Yk1lNFhOdlVaNDNzNVRSTkg4eitSOTk1OUNldDNKODJtWkYrZ3lOVUF3Z1dr?=
 =?utf-8?B?ZHNvbkpYYUZoMCsrSWtQNzJaNXJuaVl2Wlowbm95MlBzN01pdmRGamt0UEEw?=
 =?utf-8?B?NVAzQnFJU2QzMWJpQ0pTSjR4NkF5aEc0NGdveTIxdmpRRXl1bzF0SjJIdG4v?=
 =?utf-8?B?V2JjQ0Z2UEFGRDJKOEZ3OXdiTGdEQ0tlRDk5Z0VYOGtWTnVwcFl1UEwxUEJt?=
 =?utf-8?B?Ujd6ZzJKcE9SdldtWGczc095emVjZ0I3WndWVTBUTFEwSE5NNmVjWm91WXVU?=
 =?utf-8?B?Q2VkY0cxVTZIMEZxeWh5NWNvL0NaK2h4TVNNSkxsRFZwNDRXUzRJOWJmbGhE?=
 =?utf-8?Q?1ETZfi4N/vI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXd3c1pFY0dDRlhHaG1VdDh3dGpJU002aFdBVllsa3pzMG9RM21HbEZDdEF3?=
 =?utf-8?B?Z3I2MlI0M28wRWpiZjN0VVc4V1N3R2tiTDRxNTA3NHFuQ0ZYcCtMeC9jVDM3?=
 =?utf-8?B?MmRucXVBNEZnVFhmRDYrUmphWkQ5b3VVOU4reXNKT3BYdUVxUDZwMXZ3Rjly?=
 =?utf-8?B?VzZMTFQ5T3haU1pBQitHK3V6UlB0N1JFUmVHQ0ZKYVY0RUx1UUZHUFNEMzdh?=
 =?utf-8?B?aW8vbjNpaUZyRER4VTZldmQwa0ZnVXNUVnRFaXlRNm1PbzVQMWllcDZycnhM?=
 =?utf-8?B?bkVnVVBUemhFSnk2ZnFuMTJEN1FQczNPa1k4dE0rbHkyZ0x1eTZEWFNxb2xH?=
 =?utf-8?B?VHVwdmVaeWluc25DdWFzakk4Q0hJWjlqZFFLRVQ3MmZZaTU2dXgwNkV5YUdq?=
 =?utf-8?B?MGVnNjd5aEJ4Nm9tL2xJZ0JCL1o5MkF6Y2xRbXFnc0ZiOWhKNUl4a1llTGZO?=
 =?utf-8?B?Wm0vRjU4YUxYRCs4TloyMGFaMC9pMG04cDd1ZUJGUzJ4UmQ2Wk5taGJaL0NC?=
 =?utf-8?B?YlhiL3N0TUNFMENEYjBoTjNQRDRGTkNkbnhEdTdrMnZTN1ZMUUY4cXBEYzYx?=
 =?utf-8?B?MC9EejNHS0V4V0NicnluVms4d20rQythMnN6Rmc2OFZtQW9IMGxtQ1J2YzdZ?=
 =?utf-8?B?TnNBUk91ak9xSVNKQmFRRDRGc01mNlVKanRxMkY4dlplaTE0QU5hQkhWdkZ5?=
 =?utf-8?B?ZUpOTTRtRzV0Q3REdkx1ZlFCUDdKYXduVWZkdUtFRk1jVE16VldQbURCMDFV?=
 =?utf-8?B?Y2Rxa0xVQkhBMmRLOEVOc01xbG9JR24yTkg0YnI4WDZXcnNXRTJGa2VKRVVH?=
 =?utf-8?B?TnJtNUN4bWxsYUhlVFZzTU0rS0NaOVpMSkFJMm5sZVFXUUF2Q0N0d2V2aHgy?=
 =?utf-8?B?aW11QU1XbGcxamtqVWEzcDZscDhRTzQ4SVVTa3ZoallCVC9oNG1ubElabXlD?=
 =?utf-8?B?a0Qrbk5wUm90ajl1NmNVeGF2d0ZBYXJhaE1sa1lldTJldk9NM0dWMXpoaEQv?=
 =?utf-8?B?clJnRFpVZDNLRXBUMkhoSHp5c1JXeDlIekMyL3VQM2EvV0ZzcHVhU1ZUU1lm?=
 =?utf-8?B?OTdvc2kzNEZub2NqZWluS2N3ODJtOHlLaE1paDdWYkhLYmg0b1hyN3pKb2xa?=
 =?utf-8?B?NmpyQmJBbjBtY3JyOGFzRkNKVWdNYk5zcjJleGd5cFRrZEUvMmVMSWE1U2oy?=
 =?utf-8?B?b3BZWlAyMmp2SG1BRXBiS3VBNktRbXB0YTlpTDllRFY5aGR0SFpGQm9DaVUr?=
 =?utf-8?B?RmxIVll0K3dDOGtPeStGS3ZpTnVRZ25UYkFYaitBUTFEQ0grcDYzWUk2dXM5?=
 =?utf-8?B?OHhJbnByU21UTDBic1RkNFpyb3QrcHJpSUkzSGlGMGE4ZE04Q3BLU2puMXRD?=
 =?utf-8?B?RGw4OTlNb25MTURWdFdQUlZrMHJ5ditBZkJlSDFYV0JnR1JmcmhKRXVBU1F2?=
 =?utf-8?B?bnBGQlhocjMvYXRSZ2taRGlwU0UrTlE4WkR3VHNyN3Q0cktOWEVwRGlYb1hE?=
 =?utf-8?B?SmJJbEJqa2E0c3R4eDJ3TmViMXJRS2NRc01LWlN0WEk0VHJsNDc5TFNIQ0dC?=
 =?utf-8?B?ZVBjNy9zRjV2VUNGZ2JLN3NHK1VNZDU2WldDODM4b21MTmlKMEF6N0ZYZ0xU?=
 =?utf-8?B?K3hNakNwMThjcW80ZUVudWhXa1kwSndjSXVZbTNtK2t0emNpckpPTHBZdFE1?=
 =?utf-8?B?TGdRMkYxdkxlZXlUN0I1SHhUcU9Vd1M3R05sdlNGbk5hdTZIN1JLODM2OWo1?=
 =?utf-8?B?bnRqMlBXbDI2SHBQc2FsVTRUUmdhdkY2WUd2SHlxWXEwNnE0M0JZdHliY3NC?=
 =?utf-8?B?RGRIQk5JcGd4VUFkUDdlRk4wMFowZ0ZGOGk2RW0xVEZpakZ6U0VHVXptZlBB?=
 =?utf-8?B?QTFtbE9ETFRLc2Z4RFhmbGx4SUFOQmU2Q3BaNm54aDFvK2ZvdExET3FDTCt0?=
 =?utf-8?B?UDdjaUd6ZGpScHRRbEZsOXpGVjIxUXo3NVV6WmJFOVNNNVNyVkQva0RxaVJB?=
 =?utf-8?B?M1ZRVHdUU1pjbk1FYWZtMmVlb0xPUXJTejZTNW81MHU4WnZMeW40YVFPcndh?=
 =?utf-8?B?QU4raitEOGJKY1RMSmNtRkNBdlgvcVczVnhtQXMyNnJMTUNBWEp3WllJV21s?=
 =?utf-8?Q?xYGPh+7c4FmBitllcgx1lq5IC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5f9dcd-583d-4027-ad2d-08ddb7cd6a34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:58:23.5688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8mFV2LdDPJATDiCoE6UnNnoyC2+nA03mG1QVC+st25KIXX64MP6Yp4VY0oBuFEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
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

On 30.06.25 12:41, Samuel Zhang wrote:
> The hibernation successful workflow:
> - prepare: evict VRAM and swapout GTT BOs
> - freeze
> - create the hibernation image in system memory
> - thaw: swapin and restore BOs

Why should a thaw happen here in between?

> - complete
> - write hibernation image to disk
> - amdgpu_pci_shutdown
> - goto S5, turn off the system.
> 
> During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
> shmem. Then in thaw stage, all BOs will be swapin and restored.

That's not correct. This is done by the application starting again and not during thaw.

> 
> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
> the swapin and restore BOs takes too long (50 minutes) and it is not
> necessary since the follow-up stages does not use GPU.
> 
> This patch is to skip BOs restore during thaw to reduce the hibernation
> time.

As far as I can see that doesn't make sense. The KFD processes need to be resumed here and that can't be skipped.

Regards,
Christian.

> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a8f4697deb1b..b550d07190a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  		amdgpu_virt_init_data_exchange(adev);
>  		amdgpu_virt_release_full_gpu(adev, true);
>  
> -		if (!adev->in_s0ix && !r && !adev->in_runpm)
> +		if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4)
>  			r = amdgpu_amdkfd_resume_process(adev);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 571b70da4562..23b76e8ac2fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
>  static int amdgpu_pmops_restore(struct device *dev)
>  {
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>  
> +	adev->in_s4 = false;
>  	return amdgpu_device_resume(drm_dev, true);
>  }
>  

