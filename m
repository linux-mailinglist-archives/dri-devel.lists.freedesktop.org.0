Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269FB302B4C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029A189276;
	Mon, 25 Jan 2021 19:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2048.outbound.protection.outlook.com [40.107.100.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6EB8919A;
 Mon, 25 Jan 2021 19:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrCp0/CD0SZUQytp0Bdv1Ax97QjNiKmsfSL5W1pjQcC4SPViY3r8exiDAuBZRZSGQycRmDcz+Xqkam3+eYMJxSa6WSsetR3Ncx5oajijig5H0u3Zp0pqa7MZwZXAg7sZC12JWNx/ZIlD/irC7TzsifMMwrjrFFpppoq1QNXafZoVcKcwfNVgz+h1ksgoJDY3xeTCs22bDkFe4Pz83ysqJubXZ87AjtwkiA4R0Qc5c3brsrJGqepKrrYg/NXYI0zxo4k3sHW+WZdi+KtvCj4WvUpyetkYiAskjsWxwle15j+9cPPF0vMSpjRL29tasJAD5ga9TcT5YuWqPUDevWOBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byTpr5CjIl4+hQvSfKydUryN/H+VCsz2KZwllmQOuAs=;
 b=ng6tOdiiAx1t+lF9lJvs8iCOlrnLcCu0KAWK2u5r18spPvLgVx0+IYToxgfwtDrCcIsWplPEuUiF/VI4k+uwcxxnEvPKse6GNdE/xmtbgiCFiaPODhc0PR96ofBRKvYZCWSQlR6Krd5ocrJX4L+xZ83v7V381TzoEXZDJIpAYzyKTCOAiyaSc8y8i6KdXFJ89O78q6df94gSYL1AbBKpkYvNGQskKjQ7fskOQG2t8hLTFb43F8UE8JONchT0PKt0ANEPkfvT9GQQq2nMjjgPzcNgzsskwD9ULl2ByOe9npnsdU5hGzliGSvOh9IvxWn3DrEcGkGm4DA2eg+k5SmW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byTpr5CjIl4+hQvSfKydUryN/H+VCsz2KZwllmQOuAs=;
 b=J+ffdyb7IrPy0tJrlwHFUXu0c6G8Q8DVykPOXgUJTjO+z+MhqpcFNwQLWdroLkfcN23OgEmhClpiWpHaHT/aEmb8pEI4iGfCseODNTk8xdL53Aid75Va5kV3GQSvV4VN9iEOyUut23AscqLw4AV7Sth99YfuwR9u/WWS4W4NvKA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4886.namprd12.prod.outlook.com (2603:10b6:a03:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 25 Jan
 2021 19:16:43 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d475:3e33:bb03:8471]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d475:3e33:bb03:8471%3]) with mapi id 15.20.3742.014; Mon, 25 Jan 2021
 19:16:43 +0000
Subject: Re: [PATCH 2/2] drm/amd/display: Fix HDMI deep color output for DCE
 6-11.
To: Alex Deucher <alexdeucher@gmail.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>
References: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
 <20210121061704.21090-3-mario.kleiner.de@gmail.com>
 <CADnq5_MaiO_OmULhcv2qtVBK2kXURd15Xe4QgBm05HxHhc-ASg@mail.gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <25c30592-43aa-50f6-8904-63f983391f56@amd.com>
Date: Mon, 25 Jan 2021 14:16:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CADnq5_MaiO_OmULhcv2qtVBK2kXURd15Xe4QgBm05HxHhc-ASg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.19.251] (165.204.54.211) by
 YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 19:16:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36eabd5c-3801-4b9b-ed2b-08d8c165bfe7
X-MS-TrafficTypeDiagnostic: BY5PR12MB4886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4886AF39CA2BC7E4FC700659ECBD0@BY5PR12MB4886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpwHn5Vhfs2gf1Tgg2OQRezDitz1jjXcRGFh396jX7hn14MFXjA0feh2uas0AmvDNPs93W/x74foExVU3+nCfSsKXAqsROqEiulkOlxwrnHzE++nkVfzuh037WKGtpJNBIaQcrv1l5s+LNOgtp1VP7n69COfIrR8IDopD7e1ld+69Aas+5iblS7z3IWlXLiSCnqnERoJsD3enC09mwOKuDIhE+d1cuKyM/GnsSovRQGPQ6MFnIrovNeeB/AJJHUC4Vrr154kvFldbXsEh0vrRp8DVvSlquKDBXFRQiGf5uYTh/CDqsAS1zzumNLE8uTFl+sOqdt/p3dswhHKtyKkXoj4PgCdWcENY2xI1wKX5hTtOgve/6vuXeTeegB6asW+KNbosWJM18uMfe8PksB7/5npNCHo56WJ9nyTcdrhW1UxtUyuMqzknttN0CrclabrkAwlDKrSHvlUU1taQaZzupiiBfCkmKvXviQcx/oh5cd0pnn3XB86cYOH+Z4Ff791qYnBtQv8MLTjvctCWOo0NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(6666004)(16576012)(966005)(66476007)(2616005)(66556008)(4326008)(54906003)(31686004)(52116002)(26005)(45080400002)(6486002)(5660300002)(8676002)(53546011)(8936002)(956004)(31696002)(186003)(316002)(478600001)(83380400001)(16526019)(110136005)(66946007)(2906002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dU1NOGJ3YVJlVmsrR0RhVkRRS2hKaTlxdjhTR2FjNk9memE2bWY0eHoxVGJV?=
 =?utf-8?B?UGZZZU1ZWmhHdW03SmpBWm5rd05YU1lBT3diNlJuNk1TM1ArbGZrS2IreDVl?=
 =?utf-8?B?VThBSnVTWTBIOWRQdDhJNHVsMTJTbU9GSXFVMCt2VkdrSnd3S0huS0h2aW5o?=
 =?utf-8?B?TmRxVUJJMTNpS2NWZTc2TnZJRFZXNjFTZmIzMllPYlZsRXNQbUZGS1BYOTZY?=
 =?utf-8?B?Wm1IcmJKZllIOFhNeE4zMEpwY1FiQjJQTENIWUw3WjA2VFdVQTBMQjVkUFlh?=
 =?utf-8?B?aS9PNnNjVjNseldCaUEwTFRJeCtiaEhyQUkvNEtHUlVFb0V1dUNSY3dsVXZ1?=
 =?utf-8?B?YWN0dS8xMWhCbmFsZ2l0d1I2eHJTdXNxN2FHZUpqbkFSTy9XK0RYSHpxTllx?=
 =?utf-8?B?UnlrT3h2OStlUGVvTjlpU1ZEQ1JWN1g0WUlXSHoxVXNqSU1oeDB4NHV5dGEr?=
 =?utf-8?B?U0VWRktJNWZiWGJaM1FzMlZ4L3V2N3hjNkdDUnpvSHYwbVJqWkJ4NDFGSnZ6?=
 =?utf-8?B?ckxPbi96S0h6L3dXa2N1MTVPSFhsK3dHaTNqUWpUSjlGS0U4YVREUUoxZ1ZU?=
 =?utf-8?B?YWxEYnpUWXN3NS9UZ0thNUZkM3BSRVA5T0NYYlJsb0psRDg2R3M0Zi91TDNI?=
 =?utf-8?B?TG9aVnF2RC8rV0dBcENSM2JGYkhPK3NHcVdFZGh1OTN3L1FFZEU4ZVBrNzRj?=
 =?utf-8?B?NzVYUUhtNkxmbFJYazd3NGJ0ZHI3QnV4bTRXZEdiK0hSNC85dkhFSzdKTHZv?=
 =?utf-8?B?UWptT2VhclliaFdwcWw5VGY1OFNoMUp5MEpkYkVjaFFUWGQ1L0gyUDJ0VmRq?=
 =?utf-8?B?ZnF1SVhETG9jbFU5eDVLZ1lTQ2xsbkg1N2U1cWZ2ZDVrSGw3aWFvbHBUVWNn?=
 =?utf-8?B?NWpkbWNmSWxVZmtmQWRnUDFZZU9oNzl0MDFXeEt6L05obXRuZ1ZhbG1HRUxJ?=
 =?utf-8?B?bVNqR0VBUi9pUXdUUE93VEIzN2ZOdTFsT1R2eFRPWlE5Q3IyQm1lQzBzYURs?=
 =?utf-8?B?dFlwMVFUVE1GTWpyamxxaTU1K21uTk5xdEkxZ0MxVFo2dUUyOUdOL3hDU1Q4?=
 =?utf-8?B?K1RUL0NrSmEzRm9WZ05ObGNha2o0M3o4Wk5Od3AyYUJ0MWdTU2RkaWNBYlZJ?=
 =?utf-8?B?NFRnS2dObVVyNUxJdE1OZGowNzNZRjcxTjUzOEdrMFByN280a3luOCsza2dp?=
 =?utf-8?B?N1IyWmxoMEtaQjdoNkVadndtdlNpZVRMS0owZWxhSjhHWGpsVzlMOTBURDZ4?=
 =?utf-8?B?eHhWeG5uVXF2bGR5OWs1b3dsQzVVSUJOYU51aXhpYVo0UnFKS1lZYW4rajV4?=
 =?utf-8?Q?QhJwqWhsfaV+LFyjIVUxOqblKkKZNbrHCZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eabd5c-3801-4b9b-ed2b-08d8c165bfe7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 19:16:43.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIozJQL8Wu0k7a1U3FUaIRCRfIuB1foGmXSC2AJxsvGXz8vXWnkanzhhY20ZEDyBcRXq7NyTkOXYehC611X3Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4886
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-25 12:57 p.m., Alex Deucher wrote:
> On Thu, Jan 21, 2021 at 1:17 AM Mario Kleiner
> <mario.kleiner.de@gmail.com> wrote:
>>
>> This fixes corrupted display output in HDMI deep color
>> 10/12 bpc mode at least as observed on AMD Mullins, DCE-8.3.
>>
>> It will hopefully also provide fixes for other DCE's up to
>> DCE-11, assuming those will need similar fixes, but i could
>> not test that for HDMI due to lack of suitable hw, so viewer
>> discretion is advised.
>>
>> dce110_stream_encoder_hdmi_set_stream_attribute() is used for
>> HDMI setup on all DCE's and is missing color_depth assignment.
>>
>> dce110_program_pix_clk() is used for pixel clock setup on HDMI
>> for DCE 6-11, and is missing color_depth assignment.
>>
>> Additionally some of the underlying Atombios specific encoder
>> and pixelclock setup functions are missing code which is in
>> the classic amdgpu kms modesetting path and the in the radeon
>> kms driver for DCE6/DCE8.
>>
>> encoder_control_digx_v3() - Was missing setup code wrt. amdgpu
>> and radeon kms classic drivers. Added here, but untested due to
>> lack of suitable test hw.
>>
>> encoder_control_digx_v4() - Added missing setup code.
>> Successfully tested on AMD mullins / DCE-8.3 with HDMI deep color
>> output at 10 bpc and 12 bpc.
>>
>> Note that encoder_control_digx_v5() has proper setup code in place
>> and is used, e.g., by DCE-11.2, but this code wasn't used for deep
>> color setup due to the missing cntl.color_depth setup in the calling
>> function for HDMI.
>>
>> set_pixel_clock_v5() - Missing setup code wrt. classic amdgpu/radeon
>> kms. Added here, but untested due to lack of hw.
>>
>> set_pixel_clock_v6() - Missing setup code added. Successfully tested
>> on AMD mullins DCE-8.3. This fixes corrupted display output at HDMI
>> deep color output with 10 bpc or 12 bpc.
>>
>> Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
>>
>> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
> 
> These make sense. I've applied the series.  I'll let the display guys
> gauge the other points in your cover letter.
> 
> Alex

I don't have any concerns with this patch.

Even though it's already applied feel free to have my:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Regards,
Nicholas Kazlauskas

> 
> 
>> ---
>>   .../drm/amd/display/dc/bios/command_table.c   | 61 +++++++++++++++++++
>>   .../drm/amd/display/dc/dce/dce_clock_source.c | 14 +++++
>>   .../amd/display/dc/dce/dce_stream_encoder.c   |  1 +
>>   3 files changed, 76 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
>> index 070459e3e407..afc10b954ffa 100644
>> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
>> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
>> @@ -245,6 +245,23 @@ static enum bp_result encoder_control_digx_v3(
>>                                          cntl->enable_dp_audio);
>>          params.ucLaneNum = (uint8_t)(cntl->lanes_number);
>>
>> +       switch (cntl->color_depth) {
>> +       case COLOR_DEPTH_888:
>> +               params.ucBitPerColor = PANEL_8BIT_PER_COLOR;
>> +               break;
>> +       case COLOR_DEPTH_101010:
>> +               params.ucBitPerColor = PANEL_10BIT_PER_COLOR;
>> +               break;
>> +       case COLOR_DEPTH_121212:
>> +               params.ucBitPerColor = PANEL_12BIT_PER_COLOR;
>> +               break;
>> +       case COLOR_DEPTH_161616:
>> +               params.ucBitPerColor = PANEL_16BIT_PER_COLOR;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>>          if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
>>                  result = BP_RESULT_OK;
>>
>> @@ -274,6 +291,23 @@ static enum bp_result encoder_control_digx_v4(
>>                                          cntl->enable_dp_audio));
>>          params.ucLaneNum = (uint8_t)(cntl->lanes_number);
>>
>> +       switch (cntl->color_depth) {
>> +       case COLOR_DEPTH_888:
>> +               params.ucBitPerColor = PANEL_8BIT_PER_COLOR;
>> +               break;
>> +       case COLOR_DEPTH_101010:
>> +               params.ucBitPerColor = PANEL_10BIT_PER_COLOR;
>> +               break;
>> +       case COLOR_DEPTH_121212:
>> +               params.ucBitPerColor = PANEL_12BIT_PER_COLOR;
>> +               break;
>> +       case COLOR_DEPTH_161616:
>> +               params.ucBitPerColor = PANEL_16BIT_PER_COLOR;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>>          if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
>>                  result = BP_RESULT_OK;
>>
>> @@ -1057,6 +1091,19 @@ static enum bp_result set_pixel_clock_v5(
>>                   * driver choose program it itself, i.e. here we program it
>>                   * to 888 by default.
>>                   */
>> +               if (bp_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A)
>> +                       switch (bp_params->color_depth) {
>> +                       case TRANSMITTER_COLOR_DEPTH_30:
>> +                               /* yes this is correct, the atom define is wrong */
>> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V5_MISC_HDMI_32BPP;
>> +                               break;
>> +                       case TRANSMITTER_COLOR_DEPTH_36:
>> +                               /* yes this is correct, the atom define is wrong */
>> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V5_MISC_HDMI_30BPP;
>> +                               break;
>> +                       default:
>> +                               break;
>> +                       }
>>
>>                  if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
>>                          result = BP_RESULT_OK;
>> @@ -1135,6 +1182,20 @@ static enum bp_result set_pixel_clock_v6(
>>                   * driver choose program it itself, i.e. here we pass required
>>                   * target rate that includes deep color.
>>                   */
>> +               if (bp_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A)
>> +                       switch (bp_params->color_depth) {
>> +                       case TRANSMITTER_COLOR_DEPTH_30:
>> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6;
>> +                               break;
>> +                       case TRANSMITTER_COLOR_DEPTH_36:
>> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6;
>> +                               break;
>> +                       case TRANSMITTER_COLOR_DEPTH_48:
>> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_48BPP;
>> +                               break;
>> +                       default:
>> +                               break;
>> +                       }
>>
>>                  if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
>>                          result = BP_RESULT_OK;
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
>> index fb733f573715..466f8f5803c9 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
>> @@ -871,6 +871,20 @@ static bool dce110_program_pix_clk(
>>          bp_pc_params.flags.SET_EXTERNAL_REF_DIV_SRC =
>>                                          pll_settings->use_external_clk;
>>
>> +       switch (pix_clk_params->color_depth) {
>> +       case COLOR_DEPTH_101010:
>> +               bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_30;
>> +               break;
>> +       case COLOR_DEPTH_121212:
>> +               bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_36;
>> +               break;
>> +       case COLOR_DEPTH_161616:
>> +               bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_48;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>>          if (clk_src->bios->funcs->set_pixel_clock(
>>                          clk_src->bios, &bp_pc_params) != BP_RESULT_OK)
>>                  return false;
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
>> index ada57f745fd7..19e380e0a330 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
>> @@ -564,6 +564,7 @@ static void dce110_stream_encoder_hdmi_set_stream_attribute(
>>          cntl.enable_dp_audio = enable_audio;
>>          cntl.pixel_clock = actual_pix_clk_khz;
>>          cntl.lanes_number = LANE_COUNT_FOUR;
>> +       cntl.color_depth = crtc_timing->display_color_depth;
>>
>>          if (enc110->base.bp->funcs->encoder_control(
>>                          enc110->base.bp, &cntl) != BP_RESULT_OK)
>> --
>> 2.25.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cnicholas.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa80d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=b9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8NM4AY%3D&amp;reserved=0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cnicholas.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa80d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=b9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8NM4AY%3D&amp;reserved=0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
