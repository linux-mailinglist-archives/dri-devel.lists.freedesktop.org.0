Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00889C14D21
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A9510E5D6;
	Tue, 28 Oct 2025 13:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gN/LyQvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9934B10E5CE;
 Tue, 28 Oct 2025 13:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tH/otfuz1DjRLZ3p75QXTA1+voxOWhBq5GuInX/WQdJ5wIvp+6gKUhgbiwNGPoNNQ1m80V3xhzcuffcyJz17ooaGQs+17LV5+ve5tE18HEDi+u6bw7JwB5CDkcjlHE+AM/S//FLPsjsIAfynrLPJrFWNIvV32ALaG3Qdzp4iXyhCli2CmW6t/tesMILiMaFaR0FHXaUlUHw8/HF/DCxHvcKMu4aKkSU7ADPiXkuZfWFbo7+5mT772UgPz48j318S2R7PRv9TtQFxl0925JUPWCg4OLpyHJyyiAsP1itFMQRpwO+Z4+TB1UfL66QUXuELA7TlrbuCcefa66FE5KlIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jn9O5hbEwUxIEuqEaXP+G8MeLRXUCadplNgGVSlV8U=;
 b=lnPsN+L91ydbzkialq7k6n0p+lQiyf3pOmNyxwRqRoaeF/ZBKk7wwhIZOmffIhzQ6Hapv8nhQRDI8y81rJ5kM/3pjPl3u9cWu2FWe6/sH7iEXbxZfPXaJSHMgfAtUtNLPevJMawNbCfctZ0f9IlTFH9xCEC7YGeUWwqZZle0z+Wc9r04NWdxYBihS5AGn5/LZXnM4pDW+gd/8ErtqE+SttXy3E9f6vyc/60L/xhKmTE41zDk0by0IApqzyHwMHQMhzx7mmajAj4Gjcs+Z2Ozi+Pt39Q813OkOaZgO2PsZerdH4LBCwMRj+szQxn7kyET9jP94bzkO/LPCeISEHYt8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jn9O5hbEwUxIEuqEaXP+G8MeLRXUCadplNgGVSlV8U=;
 b=gN/LyQvr+od/qE3q4WALs3Sb/mIvrCfFopgoUERpGzjZ2zkxYMAEiqI3XN7TUanZPVECih+qaNBGfb+jf5spxuuB1XkvG2Y/KPF8t9TG4mSEmX/Buh0EtZ6c/sfUDKMti6KhIVTC5+R14ZJp3OlXAlmDLEsOjlFMGZGpLDQi4cs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6756.namprd12.prod.outlook.com (2603:10b6:303:1e9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 13:26:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 13:26:32 +0000
Message-ID: <6c619ad7-5502-42bc-8de8-8bf2af2e9566@amd.com>
Date: Tue, 28 Oct 2025 14:26:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: lock bo before calling
 amdgpu_vm_bo_update_shared
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251028130906.6029-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251028130906.6029-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0958.namprd03.prod.outlook.com
 (2603:10b6:408:108::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: d309a8ac-67f8-4eb1-4ded-08de16259bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0lIUnBZNkZyT2QrMlNSMitYdWxQME5wOUxTYTVCNzJzUDdmMityTldJSzNq?=
 =?utf-8?B?UzFlMmpIZDNPVGhHbUJpc25TNzJRRUVNMGZlSkFBeVVMN0hENThCc3IyMSt3?=
 =?utf-8?B?YVYrVjFENThEVDdUM1YwdkEvVDNiRC9lUXVGRWxZK0dUQnhKR0ZoSmFpcGUy?=
 =?utf-8?B?blgwclJCVEJOUHdQcFlJb3ZsMS9XOXB4MzRCR09VaFMrRUNZYXlGOGV3eWlv?=
 =?utf-8?B?OXhVZUx1d0owcFR6WjZCMXBDU3lKd2N0Mm5EcFRwZnZWMFdGb25hTkc0NFdU?=
 =?utf-8?B?ak04ai9zSU10VDNBcmcxYTdLV0RYSDkxNlYrMDlTUzd0QncyeWJnUmp4SVNk?=
 =?utf-8?B?TVJwdVEyd1JZVUNYZldCekI3elNNcUs3QVByZHAxUkRyL1VHU2NnZHdpSVpP?=
 =?utf-8?B?QjdpWnpDbFZxTGlPcE1ITDJicjNud0pHbUIvZy9uK01FdnlySU9vak9ML3c0?=
 =?utf-8?B?SmtKSENnUEJrSzY1UzhyaEFQWUZSNDNsN0xzYUJJN1lGWmZmOUlIeXhNb3Ro?=
 =?utf-8?B?ZERKVzRIY3EzdDVQM3BZRlB5MTU3RUdXUzdoeWJpSTNmNWltTUxobnZpa1Zj?=
 =?utf-8?B?V2I3S3gxSWtMTklvK0pHSkNFc0x1NXNWRkdRUGlZSFVybmFScElMdXpMTitr?=
 =?utf-8?B?eTIzUFR1OFlPMHZDTXBQQVlzQ213cDhkaTkwMzdpcWlLbEhXY0ZTSHdUczhI?=
 =?utf-8?B?Vzk1M0ZWTmdvOXZNS05pdWNodFpQQjhFeVRxcmtNRmFXSk5uUkVUZWRZT3M3?=
 =?utf-8?B?dEp5ZTU1Vjluc2N3ZjVwUjdlWjROVzlmVHZ3alVqU0xVSk9sbDMxc0ZMeTda?=
 =?utf-8?B?VXQyQWM5R1FDalkzNzRXM2MxaVBpUThFa09HSzVDcC8rRGNKb0IxLzlaSUpx?=
 =?utf-8?B?OWxlbEZLSzBPcFBYNS82MW12RnpSOGtOQW00aC9hUlNua3k5UDAyYXhka3Qy?=
 =?utf-8?B?MHNqR2wwbmt6V3phcEt5MVJJaVVMM2pneGo3eUVUWXY2Z3NEaHVEQ1kyN2Zz?=
 =?utf-8?B?T1FTb1ZVQ1hCVkVzUGFpN0pjQ01xZk9pQ21uSkd5azJjMHI4ZTNTWW5nSTFw?=
 =?utf-8?B?MzJEQUtQdHFOdFlxVWY2M1JXdlBlaWUwV1lMQ0NpMkJLVEZkaGx1eUQzSGdK?=
 =?utf-8?B?RStTSlJ0a2FueHgzVzZINUZMME51RlQ3VWEvYVRNbEFreEJtYjdraGl5dlVz?=
 =?utf-8?B?WEVKS3NYZFQ5ZExnVDRGS3ViRjRIZC84ZXhkWkdhUDZtaElwNThVOWVZSkpE?=
 =?utf-8?B?NGViOTF6MEI3RWVjOVpFM0FQSnNxVHF2akUwcjZrN2hIZ1dUYnM1T0Vzb3RM?=
 =?utf-8?B?QkI5WHY5QVMydFVtMjd5L250VGxtN0VmVWFiQ0MwTCtZOHhlWUYveElCT0Vm?=
 =?utf-8?B?KzNvbFM2K2VFSVl5RUZreTVFSk9scDQ0bzhCcXRyc2crWWJSWldMSHN4Ly8r?=
 =?utf-8?B?UTliS090dzJvQjB0TjlnMEIzTklzdG1jcVdWdjBLSnhJVnh5dzhSOFRxc2I1?=
 =?utf-8?B?TUJsczI5NUlGVjk3YnIxZ2k0MHdML0VSY0RqaTNsbXJ6ZTJLQ291L0FwanZU?=
 =?utf-8?B?MGRUcmJvd29KUlRXaElTVjJjQXVHSmFuTXk5Rkg1M1lVZEVVRURjWklBY01S?=
 =?utf-8?B?N2FLcjd0eTJIbGlwNU5iWmVNOUkrVC94dDlMV2hBZUxnQUZrZkZzeGNHSFdw?=
 =?utf-8?B?eTZmbXBrWHBEaXl3bjJOUW5qdmZiRDBYL0RVSENHYlBDS1ZoVGxkM1FBOHU5?=
 =?utf-8?B?eXB0eEg2dTAvZ2twU1N0cm1qRnBxbEFjMUxZZWhGRmxFNHJXMWIzbDNwbnZn?=
 =?utf-8?B?Zzhad2V2MHV5VUt4NCtsc2hoQ3dZZ1dYS0NkMGVJZ1NNWncrOTJvNGM5U2Zy?=
 =?utf-8?B?QWdrVVdNUExpQWxMZ29rcjd2SVJLMDR5aWh1L3Z2T3lITjcweDNzSHZ4U2M1?=
 =?utf-8?Q?2ey/5HFcazVSoVor04rUYoStWQnnPgvG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3E4YVpGZHByM3ZpZndpcFJsajVnNmhiNW1zS0tyWnIzRmlPVDBOd0t0d1BJ?=
 =?utf-8?B?V0hPNVdTelRJUlYvbE9xUEZnYnQwTXQrUWQ1WGxsS0hrNTN6OC9kZStzMEZu?=
 =?utf-8?B?elFXbEtjVlpjcjFVSnd4a2txaTB0elpmeFVsS3VGTVlUWTNkSGJzN2dBRFVz?=
 =?utf-8?B?cGpFem9OTjRXYzQzTDM2L3dmRnlUd2t0emxzSHNNdy9UU0F0RUlkWWs3V0VU?=
 =?utf-8?B?NHFMV2hpK1RkbURJVDdmUVlnTHRHT2k4YTRnK0pwelFGVU8rNWhjOHRNK2JS?=
 =?utf-8?B?M1RZcm1zV1YzaHN4Yit6bE9vQnRxRzhJajZWa2hjL0MxaktOelgzWHZWNXhS?=
 =?utf-8?B?aWVQMWF1VnZtNVZxOGtJKzF5cXBrcUhaWExUSHVqQUt6b0VlZGdMTis2ZEZD?=
 =?utf-8?B?S1RUSXBhN0l1K0hDb21SbzZONDBSYk5ZN2MyYVhMUUxKRkphdVM1VDFDSEN5?=
 =?utf-8?B?T3VmNnQybGN6MWF2NXRCWk5Zc0xyYldEWTJ1dWxuT0o4R1A1RTJudFRWYi9X?=
 =?utf-8?B?NHRCeWVmWlY3S214K29wci96MnlpK1NZYmZQY3gyT21lWWk5TDF3Q2pnVSt3?=
 =?utf-8?B?UWpWWUsySE5JQ1NOb3JrUDBpM0o1bkpVTmtxUmNTOExiR0h5dzkyTE1xSVhG?=
 =?utf-8?B?N2FHdjIvNHJ3OGpFL2NHa3U2WmprVXZyeTkzRWgrcWc3UmplVVIxeHVNa2py?=
 =?utf-8?B?TXVMeXoxNGlLUG5QczRXelNXUzhBSEFOb3BIL0VMOVR0V0ttMWV4cml2dGk3?=
 =?utf-8?B?eXMyUXJzVkZlclM1a3ZmbkZuWVhVQkY5eGp3SWhveWZtNmR1NXlmSEtjbFlP?=
 =?utf-8?B?dlByalp4dVhkQ1F1TXlkRVVPYm9lLzdTTng2VklTTFkwNXFiK21nUm5KODFo?=
 =?utf-8?B?R2habFJvRE5oQlBZN0hxWWV6NWtsY3BhTmtWVnVOTU9LMEwwOWdmU1E3Qi9S?=
 =?utf-8?B?T3duRmlFUmxvV1FPWTBYdjk3SWVyS1NCSitEdjRuNVQ2SWszR0ZrZi94QnR3?=
 =?utf-8?B?dkJMbElNajEvUXhucGFCcGpCWXI0ODRxS2l1eFVkTWIzVGxmand3b0ViRFRm?=
 =?utf-8?B?aERPbkpva09xZi9VQkwveE96b2tYeCtLa0NuVVN3QlBvMEZPUFBNNWpoaWNB?=
 =?utf-8?B?dlY1SzIrRXVYN0szMHRhbk9oaFNSeFhwMlVhVDhNSVFvYmxadndvV1lGUWVG?=
 =?utf-8?B?aUNSNzhwKzY4Ynk0K2pBb0haVTdhdk1wbW5UR2IrSjkrTDA4cjNCMWo2WDh5?=
 =?utf-8?B?WERiNVdrSXlmcDVPL3o1cXBLY29UMnpNTGlsY1lEbURUZ3Y4dHVDWk1OTWtx?=
 =?utf-8?B?NzBxYlRmVzZIaUNoWnE5cVlEaERKaWlvMjN1azZwNGYwRHRPOEhhK1Q4Z2Zk?=
 =?utf-8?B?cjFjSm9JQ3BBRG1Ta0lMOWU3am5lVjVuQkZneWU4ODczcWsyL2laT1dCVk1F?=
 =?utf-8?B?clZJQzFtUEhIblBVb2poNEdTMEdSUzErYnNMSnVlcndvN1VVeHBWcmQxc1B2?=
 =?utf-8?B?OFlTaUNEOXVkcGlWWWxQckovOWVKZEY3V1JYemV6ODZsbHZLUVRBSFMwL0ZI?=
 =?utf-8?B?ME5yWjVFWnJ0bE14eDNUbEoxUG5JSEY2ZUFNSGFFQzFlbjlsM05UcDZidHNF?=
 =?utf-8?B?aTl2NVRSeVhrZkFzRjFsZzI2cFBCRWJzbXR2NXVCamF2Ynp4MXZ6ZWZKK05w?=
 =?utf-8?B?ZER4Q3BKalQxbnhncFdPQWRveDV2L01PanJoNG1FaEdTeDljMzVXcW9xTUM3?=
 =?utf-8?B?a3IwYld0Q2RONy9pY2dpMk1lNlBZd2VvR1lRNlBIQXVqUDF0S0RJMHdKVExF?=
 =?utf-8?B?SmFIYTRsK2hRNjEraW5DNFN5R0lYbXZETERmLzhjWlEyUUFXS3hUOFdzWFpa?=
 =?utf-8?B?YVdLdHhsK2VXZHhWS3JOcTRCZUxNdnhGSzFLVXp2V3prWEJ0RFVQbkh6cUZ5?=
 =?utf-8?B?d2tpTmJ1V1FLWitwYzJqWWZnb21HbER5Ty9jRTV2KzlnR3JiM3Ryb0JlTWRm?=
 =?utf-8?B?TElCQ3NrUFNnODNKQjA5NU5ONzJoNzdHUEhxbFFxVSswZE0zaitsYXkzcHEz?=
 =?utf-8?B?VGVEZ0NuUE1DQ1ZlL01XZmJJZmd2Zmk2blYrWVEzOUh0NjFiU1EyQXNOZnBn?=
 =?utf-8?Q?GhGXNY1jxQraYrRn8p9vlqPiQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d309a8ac-67f8-4eb1-4ded-08de16259bf4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:26:32.1265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89sdb2f2Fv2urq1vGDEDGQyK7IvKa8V6ROCtZzkLMxlL130gcISrrC84u91ujrHE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6756
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

On 10/28/25 14:09, Pierre-Eric Pelloux-Prayer wrote:
> BO's reservation object must be locked before using
> amdgpu_vm_bo_update_shared otherwise dma_resv_assert_held will
> complain in amdgpu_vm_update_shared.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index ff98c87b2e0b..830412f04b6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -81,13 +81,20 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>  	struct drm_gem_object *obj = dmabuf->priv;
>  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	int r;
>  
>  	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
>  	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
>  		attach->peer2peer = false;
>  
> +	r = dma_resv_lock(bo->tbo.base.resv, NULL);
> +	if (r)
> +		return r;
> +
>  	amdgpu_vm_bo_update_shared(bo);
>  
> +	dma_resv_unlock(bo->tbo.base.resv);
> +
>  	return 0;
>  }
>  

