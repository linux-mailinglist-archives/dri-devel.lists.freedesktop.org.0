Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAC784A90
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 21:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAA910E3DA;
	Tue, 22 Aug 2023 19:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCD10E3DA;
 Tue, 22 Aug 2023 19:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHfY990jsgGEawv+PGnX7FoGZeHn4Tgt4vhWTiJJYd87vWLxP3TKcTHT1Hy5CJuNnN1ccepi4vNHZ5gVn7cqSp87/OjSGl754AW0VioM5cEskAzNPv7LmafBqiTal7wh/KE9ACY32ECmKoHViGX/qf4VFZkgHpEcCkBWat2YcZd13qeDC7KjP3SODmDni94H1VcFhuu9vr6hWRBZq6WhwgQnHLZHkv6uxGC1VoyPxVVzsKTapd6fd5P29CYAd7N7Z3gPwlHixjtlfNU+WOqIi8/L+dFGs/rQugdA1NGsP2nsQTijcVvnHrbtDgYmKp4mH3MX661tKR0Vxq/RHTK6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hXYYjvu/Cgrk+96qTPrnrvEPtq17J/drcSkvuE/pr8=;
 b=J5SBZeKWDfYJatqI4IuZW/uimHH0vUPouRNXE2V9tYLOsAFyTTKPK70U3UymxFg/1+1D01bi8PBwGmz/whefSutA+WkfpgDttOlD2V1REXLozBp1Z7qbS3DGFrBepE+w0ArQg62YIhqUeVnPWdSRKT0JuZObyPztIf3nf1b9V2FI/BkxBGLNaQTQV3niK864MDJwh3IMS2FjlXQbDIO+1BA0O9QFK5OlCpu2+pCqAVeOe7R5tQ6ErNNRBAlcrmY+tPtpehcvcr6nTFcNN5BmuZv2yxFgIcqoey0ittS/JtAIbxz9ohN/APRodCAb/DcFPe400t7EvN8VEiTFgOHqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hXYYjvu/Cgrk+96qTPrnrvEPtq17J/drcSkvuE/pr8=;
 b=USabACV/m+3MC6+gjlBv/aKDdI8BcTqC5APgT8oGa4tju2DIxZwNnNHsvVGXYTD7ldYgeZPXQ1CLFMGinL4KFi93kDTeNzJe26ceFq9U7ivuc+xZKDtNg4cCBcLzhp9/a7FHORoZP+78g0xWMf4efC7APeRoyNOVemB1Cd1HV0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3051.namprd12.prod.outlook.com (2603:10b6:5:119::29)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 19:38:37 +0000
Received: from DM6PR12MB3051.namprd12.prod.outlook.com
 ([fe80::a083:8d29:b3e7:d19e]) by DM6PR12MB3051.namprd12.prod.outlook.com
 ([fe80::a083:8d29:b3e7:d19e%4]) with mapi id 15.20.6678.025; Tue, 22 Aug 2023
 19:38:37 +0000
Message-ID: <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com>
Date: Tue, 22 Aug 2023 13:38:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <cover.1692705543.git.jani.nikula@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <cover.1692705543.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::19) To DM6PR12MB3051.namprd12.prod.outlook.com
 (2603:10b6:5:119::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3051:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec5ef89-215a-4e35-7895-08dba34760be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOaaUzuTImxgrq4ZuyjFDOD1I4WxVpl32BllZzpDuLlTUBXOqZieS8LfI3KVfNW7dWfH+fkhQOreySSgvCSu53CgtG45Ws9Pt6xglqxDJH92gGp1P5B7AdKOLER4a3hyoVQosgCr/CN/OhDbmjcv65OJzZDT0qwko7IQxkTqnYdLjgU/ZsDGn+PFc1n4QjVBDXU/o/eCOX8pSJJtGosGQJ0+azejbqLtDx01HAzfB0ML+br37Ac1DnQj9i7vZQzMWPhhKaDBQsY+M7fm95U4wTA+350mchWPJfUQJ5u1qqgib4ErgWg3XmW4n52kVIV6fL2EfsVyGC93W+QWMoNCG6MtK9f3901RGeK6Yx5TrTBTwzmQ70Ox2oUT7hGJJjgT0KAqMUvlOAEznSQfuUDa0r0RcnTv0pWMzH1tltR2KIJLSpvJUEbtTIfQBI4S9S2v6Qth0q+Pl8/VM2L8xk0nC11jfETfR21mBuqSQCaHMDc82akiQTwvn30lE57dfDLITexbRZWBY3JXZTXVAYitRoDW7yOw1q9XMdKmeNKtlKKUG/C4cGE/XLyjTLFyKdTUaP8dUnq4sKqpxpVnA/1NaoU4lgZylIwvc7jWVjfBjHXLCivuApEFtc3jR9h14EQm8d1+5OlfXTbuTiAtspALyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3051.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(186009)(1800799009)(451199024)(54906003)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6486002)(6506007)(53546011)(83380400001)(2906002)(31686004)(86362001)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWNyRDA2TFd4eG5tNWR2TFcweGh3N3V1VFphR2FOZWNqc0JyRWlqcUNlbzdo?=
 =?utf-8?B?eXlKTitKRWhRSFc4eW1WckUrZ1Z0RXY1VXlybE43QVNyaXdPYU9xd3pOMUg1?=
 =?utf-8?B?Y2pJKyt4ZEFqK2pDS2craUw2clNlQytlTWxHd3lxempWa0MwNWlWenQ1MHhS?=
 =?utf-8?B?UlNGcUhzWFI3L21DYmFnLzAvbjBIUnJQd3JHZ05wR1EwTWpIdWJMVnd4L0xR?=
 =?utf-8?B?RHlxU0lnSzZ1ZDk4a0tid3c5eXVUekY3dFpnM2svbUp0NGw0aG1DeEFzZU5Y?=
 =?utf-8?B?Z2Q3Wjg5UEVEVWlDbmE0ek5DYUJtaTVrVDJFTGZRaFBjdk5ISUMyZzd4cklO?=
 =?utf-8?B?SVZhNDI2WC9aN2tTQlkzcHk0Tjh3NE5lUmdWVk83RWlvZ2FmZVB4U01kQ0xB?=
 =?utf-8?B?UHppN3QxMjZaN2hCT1ZEdXlEMzRGaERkd3dPcDdDLzlrais0bldVZ0llV3RB?=
 =?utf-8?B?QkJNbUF4TWxiSjNYRjdrYStzY2FDVTNWOFdxdmhpbTlVRnp1Qlg4WXNaUHcz?=
 =?utf-8?B?VXlRcVI3dlA2N1p6TmE1cEdON3MvR0NTK2ZRSkp6eEZ1SWlsdnB2UXJkZ2s3?=
 =?utf-8?B?a2xKZzU4Z1E0ckpSc0pIV01KaUp0U1ovSmRSVTJld1BxMmk3ME5PNjJGM2RC?=
 =?utf-8?B?dmkrYXhlMjJEVWV6R1JTbjZRQUpzcThOblNHNStOYkU2bU56NFMxK25odFFZ?=
 =?utf-8?B?c0Jra1VTNmo1SVYxLzdiaFRrTVNjNDFHdGVoZFBYR01IcmpSTjJnbjVPeW5m?=
 =?utf-8?B?bDNmNmdFeTc4SkYxYndzVWh6SzV3eXZEQ3d3WXY3a1RLNXFMVWx5OXB5M1lF?=
 =?utf-8?B?cEI0V1pEamp3NTkrUTU2QXQvNUVhUU5mN2NMZWF5NDNVV3pLbW9tTWdxYURn?=
 =?utf-8?B?SWUwVkFGR1AxM1EweHcxbDRyM0dTb0EyUFZ0OHZrVXdhMFREVXE3QXpTNk0x?=
 =?utf-8?B?SG9SL2tDZ1RCTW04WnNVeVI3UXlSaFVnYi9XRmdsTm5rdExQYlowck5WRm9l?=
 =?utf-8?B?VFEvTXZkNmI3aERPRVlDNkdwdXFGQ3Q0SHBRUmNWTng5VnQ4TVdLcGFwd3Jj?=
 =?utf-8?B?SDk3U1pCRnZjZHhHK3orMTUweXlDOG9mUStDc0xvdnR6cFduSmtCeERXUlMy?=
 =?utf-8?B?L3Yrd0hOTUZWUE0zZTcraFpDUzMyc0wyU04zSWR2TWIvZmY2ODFnMWZIUGd4?=
 =?utf-8?B?aUp2dDhzOS9qZmFsbVluMlFmT3Z3TkFORzFnUUREeVJhR2FhcEJXclZYT0dW?=
 =?utf-8?B?UnBDYW9kT1hEZEhGUm1zVWRQK3NEckNWSHlnSDRvQnFhbTllWG0za25mWU9t?=
 =?utf-8?B?Zi9oRTBSR2EwQkZIZmwxNSt2OFRCd0ZlL3FSU09pNDlLbmI4dlBOM1pPNWpv?=
 =?utf-8?B?dUw2bEEzeVYzSUZOcURIaUpzUngrQXZZdzAxVEo2V3pnSnJINTB0SnpkMFkw?=
 =?utf-8?B?LzRhRWF2Q04waHBmenIrWUZzc3Q0bUlqT25yeWdrcTlPdFduTk5UMUZNWGNk?=
 =?utf-8?B?RG5vUUh0NTdGeEtJVStiT2FnNHQ1Sk5xN0k3ZEhUS2owWCtKd2JLYTE1WnBm?=
 =?utf-8?B?T2dOb2VoeHNPc0FDQ3pGeHAwbnR2cE9vN1hRV2JrVTUxOFkvakNBNkpiUEwx?=
 =?utf-8?B?TVdJVUJRNjYwcTBxeFRDdW5BekVmWVpKeVNMSWF0d1VDZmVnT2VEa3Y0VUMx?=
 =?utf-8?B?QW5nbjdzRk50ZGFUTmdhQ2FJelEwL1ZoVXpXRXdtbXVORjhRQmlIL0Mxcmpy?=
 =?utf-8?B?L1VFbG50Z1JxdzRkdU5rSlBGK2NTMy9jbEFDVUhsc0p3MGpnbm9NSFI2MDJF?=
 =?utf-8?B?ODhqSzJ6b0FhNUNtVHdTZGMyTEpBY3VmQWhWdnc1c21SNndwQkhsRG9rWDkx?=
 =?utf-8?B?OHd0K0UzazJDRmZ1bzdvU3AwbU56RjRPSENoN3puYjBQZkJrVWNGTlkwblRZ?=
 =?utf-8?B?YWovdWMzbHdZaUlya0ZhK2dkWFU0bTdNdnBPUVo3ZHVSOWNPZUpzUXJ0OE8x?=
 =?utf-8?B?N0E3ZGJjT1I3YXNDaGcxdVVSNGhjbEViWE9NWkFKZXJaWUwvTDRCVTNQVENZ?=
 =?utf-8?B?SjAvZzFYQkVTZ2l4VU5QbU9uN0p2RE9tQWFzVWROa0hGbkloTW9NV1I3bDNX?=
 =?utf-8?Q?ZblsTNlFPKkrSIRvGWuYm3PGC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec5ef89-215a-4e35-7895-08dba34760be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 19:38:36.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqqUM1ECTsjalmRzDZXVxEDiHi2wpvhpE2MJruHXCsIp/hcsXG37OJgsmqjd7+ifRX2VytL7GkJ7ZFiDwcZasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177
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
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-22 06:01, Jani Nikula wrote:
> Over the past years I've been trying to unify the override and firmware
> EDID handling as well as EDID property updates. It won't work if drivers
> do their own random things.
Let's check how to replace these references by appropriate ones or fork 
the function as reverting these patches causes regressions.

Cheers,
Alex

> 
> BR,
> Jani.
> 
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Chao-kai Wang <Stylon.Wang@amd.com>
> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Wenchieh Chien <wenchieh.chien@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Jani Nikula (4):
>    Revert "drm/amd/display: drop unused count variable in
>      create_eml_sink()"
>    Revert "drm/amd/display: assign edid_blob_ptr with edid from debugfs"
>    Revert "drm/amd/display: mark amdgpu_dm_connector_funcs_force static"
>    Revert "drm/amd/display: implement force function in
>      amdgpu_dm_connector_funcs"
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++----------------
>   1 file changed, 5 insertions(+), 39 deletions(-)
> 
