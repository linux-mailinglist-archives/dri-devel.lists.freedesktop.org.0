Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D3D6376CD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0FB10E266;
	Thu, 24 Nov 2022 10:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7110E22A;
 Thu, 24 Nov 2022 10:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhNNTwSA5mrqqxOqn+9hEDMUJHC8viMtpgzx2Vnw72B9Jq41jX3N7ZKfR8IZzr9P0gad/dstNiOyxkyJOK3f9kQjS4XklYIAfVOtW6U1VqBnHGugyvfv3b7rgzY9n8xHr2krQnLCqkloPK7v6RGSvMzymPgYPBXcjzDfOB4O1AcLszsrZMLNZxpZif6Q1/Q0TFdck88k4DIziXWPz5hg49X57l2NAY//WpJB8Y6atw0eJcwgCcdnvFFqRNqBayGSyqk919osdk0sKH1yOhDSnLcipPOWL2JCEvs93Smd2iqWhYIlN8PamkVId5KwWU9lz0hIsyWcWTCT85BMHaDkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg7Mv3lbsGGLkZuW6mACqoAvAePQlXQfkq2ZvmN7iis=;
 b=KZ2l2TNXzkVBtFVpmM3NAiZCcY9JW9rHLnuFzxEpVR+QXxPq6lrI7ZImFj911oIdlIbp0rd7JcW8Oprj02kVBDtdK6tCDSQXJ2+rp5EgmKNyY6gB8+fVhV7YsS53LGJaOtsNQEcCTwXMCL4tpo1MfqcZQ7KNg5rVagVLA6I1et/pKrhTSmC2CUcsjIeb5E+3LOekgQWSE6aOeX2EcYshKXejE9rvYJf+f+V79nJhwSQ+6KGyTN1ESpWSYAFzJboeY4DdOYfrOeXhPWvNttX1sjdNdinPVwGiO/qD3JmFb3VFBTxs/XqHOQYb8EMeKMh2agvNBEI1793haVIYmz98OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg7Mv3lbsGGLkZuW6mACqoAvAePQlXQfkq2ZvmN7iis=;
 b=npY6uqKnPHSYkvYUm4kPX1WtQvRnCc9ewnLQAuSIeA/5GzygilFyqI4P7GvjQmzyBC8684wSe+ooWVLt/X0dNoePmLieT2Ag68dBCeJqhaSVG1dr7i1z7VJShm7jbBsO1KvA/dh3iVTOWVI+HSH1DT30jjgOQbLVFVfiaR0ig14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4621.namprd12.prod.outlook.com (2603:10b6:805:e4::10)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 10:49:26 +0000
Received: from SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::f67c:12b7:6290:3b5f]) by SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::f67c:12b7:6290:3b5f%3]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 10:49:26 +0000
Message-ID: <71571bdc-8310-502f-77b5-954f5efbff91@amd.com>
Date: Thu, 24 Nov 2022 16:19:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] drm/amdgpu: add mb for si
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, =?UTF-8?B?5p2O55yf6IO9?=
 <lizhenneng@kylinos.cn>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel.daenzer@mailbox.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20221118074810.380368-1-lizhenneng@kylinos.cn>
 <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
 <800a1207-8ff6-4cfa-60f3-6ff456874890@mailbox.org>
 <4adc40d1-e775-c480-bb35-23fe9c63e05e@kylinos.cn>
 <DM6PR12MB26196C35AC2F28FD50ECCAF0E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <4ac1b046-b3bc-6090-f03a-eb6352f52a5a@amd.com>
In-Reply-To: <4ac1b046-b3bc-6090-f03a-eb6352f52a5a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::26) To SN6PR12MB4621.namprd12.prod.outlook.com
 (2603:10b6:805:e4::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4621:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f51232c-8ca2-4888-6c20-08dace098e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTnJMyF15Da7fbxbwEKtKTPpzeuJLu2Ia7SEVz/xd23KT4FUw8qjQktfTjS2UDOWtHg94s9+TlkM9WzglViJk61g9sEGhfukIcgX3ZnNpKDZag5uk/Yi+cvAjmiDFikS7+EzHn6wc4ooryA6mxrMA8Pk7mJ0T4m+5ZNAX1lTYJHdAxR4YTnmfHbo98K21Si2itCEySAl/OhBhJHzBhUmxvlIoGS7dYFZep13m8oxaVyLYAQxYCf0/3A0blbCyMssRIp+MyiDgjIfYwuTVsk3Nzj41AuSLSCyln1+54uTkFLxeJsTwTW9KhB6nSwvyukAnNwNivBBfqy5r1fmssqy1pLjVW7QZfFq4rdxwjXPqCw72xphVhhs9Wkp0gDOl3h61OeB67X1Um+oq9slq42C/aAHe3Hbt4FI30VEvPCBeyrVBlCjaawyD25MjyYHN/syYeeatCogr9zgHtUU3NL9UVrwHiUzE+EqLwXmPNVHuUG+psCCG0gZtj1svqJT2npfww65lK9tkJ0p1AR5MNzLwV7OfN/TEzjfxXz4bK7STOCD94yaoZuMdRDc4J0aESd6T62qX0+7qOd6DB7D5yeEaTgnoXjcD4TunyAbh4UDR8bHvtkLsKkTArX64ZNSnj2UVy3sGv0LESfR5ASk6JeLENVMyz3ktqT7JXl1XiN+auojUtfpiEyeSPVwhmQjR0XnUKwhD+Tx3yTWmwNbKRkP0s4xx1k0QU4Jyo4VG3Ku2stgeCsWdFw+7EnQ9+w46VR3nK22whRFrKm9CXLWaEIxKLyy7Z4aLSCoSNCwqRn+tUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(8936002)(2906002)(5660300002)(31686004)(110136005)(316002)(66556008)(6636002)(8676002)(54906003)(66476007)(41300700001)(4326008)(36756003)(66946007)(6486002)(966005)(478600001)(38100700002)(6512007)(53546011)(6666004)(6506007)(26005)(31696002)(86362001)(66574015)(2616005)(83380400001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdZemw4TmNaczdlME15bUlBV1pnWExHSHFPMDUzTnNPUCtVSlMva2pQYjJS?=
 =?utf-8?B?WGJEY0lLeGx3c0ZrVzVmcVpabHhycXkwUTk3OHlMYW8wNXNJUGlUV0EwTzU3?=
 =?utf-8?B?UkFjUkczL25FWEE2ZmtFZHB5a0k4Vy9ueCtrMEU1ekZOYmdxRGZlL0hGVE4x?=
 =?utf-8?B?T0NONHFuaUorSnZXTDFPTjNCa3JvcVFXd2N3bEkwOWJDWHlERnhlckxLcUUx?=
 =?utf-8?B?eG9vN0NpdEVYc05UeHd2V2V3SE15UkJ2MFhZWk4wYmtIaStUaVZyOFJvVGYw?=
 =?utf-8?B?em8wK21Jb0tidHUyRXhnMjZMWUhvT0ludlEwWnhCRm9GTVhxOXhSZG1Gb0Qz?=
 =?utf-8?B?VlpybzVvR3NpZFQ3YTY5TDNtZUs5c0NvR3R1UGdDaW9nc1BIM1ExT1ZZN1Jx?=
 =?utf-8?B?bElva2t2SmttTXZuOGdqZjdqaG9hb01IbmNCWi9aVlgwelYxYnE0ZitTbUpr?=
 =?utf-8?B?eWtUTU9VenhNV2RpUWZRVFJDcWZQVVlLendPby9aMHUxN2FqVjBtOEZleUF5?=
 =?utf-8?B?aE9sK0o4VXY4VksrSVVnRWJQckNyeEh3Ym9lVmVKeURVbGkwanFTNDBQeEpr?=
 =?utf-8?B?L2NHdHMvN252MXVpQkxPTnR2eG1wWUpDeEZWeVlTYm8zbTUxRXNzancvWnR5?=
 =?utf-8?B?eVVjajBmRkdvd2JtMFJVZGpNSmtMdXhlNWE4MXdFMFRUdXQvTmsvY0grZ3pp?=
 =?utf-8?B?L1JMWFJpYmNhU1RlY01ZbzF3aDAyVzJxZzRmWCtGR2xMNHZacS95YXFaemt4?=
 =?utf-8?B?YXBtaStpNG5ucFFBMzQrZnhhU0g2MVN4MGtHWWNGWjdqVmJaeXNVVXp6b0hh?=
 =?utf-8?B?NDhscjdKWkxLL3ZwbXpob2lTNjFMOHg2SlR5dTluNDlVUU5zOTdidXZEREpO?=
 =?utf-8?B?WGM0eDRsa2NJektVOSsxaktEMk9aT3BCS0dnZTNkYVZuQmk2alJWMUVTNVZa?=
 =?utf-8?B?cThQRSsyR1ZDZitKcVJ2MktDRFQ5VlJIbVVMczE0OVdnODFVUUNadWNyVmpy?=
 =?utf-8?B?K3J5cDB6RFh2Q1BtNUl1VzNkaFc1Q1hSZXJHZE9sb1d5V3gxalp3azZ1UnJ6?=
 =?utf-8?B?N0oybkRjWEoxVmZKKzZLeVc1TXZqSVg0dXQ3SmN6QWtVclR3K3BCenRSYzRr?=
 =?utf-8?B?OTJtUTYzR3JnbHpEOUdMS2pHQW1teE52dWQxbGNyZ2V1NW9WTVNvWmhZTmxS?=
 =?utf-8?B?emlpdUhSSDFZQkUvbU5qVHNxUHlvRXVKRmxlL1YyOVdvVkxNcWNJaG9VSmhP?=
 =?utf-8?B?N1hRcmRBVzNTdGFzMnhudEVHeDQwdzJtUzMya2NhaEFmUmdFcVpUOUltRGJ5?=
 =?utf-8?B?UGtVV0o1amQ2TFl3bHZWVFZHK3hhVzF6czlyaFlHME5kcTVTc3M1VGl6MFFq?=
 =?utf-8?B?UEV5emczbXpOSkM5d3NqbzlwQnprNG5MT1plRzhBZ1I3U0dKTElQVEI5Unc3?=
 =?utf-8?B?YnVlMm5iTVUrMW1OOHV2VzdGMmhCM0ZDRW1sUzVoUGI2b2xxUEdFTWFydjFs?=
 =?utf-8?B?NWw0ZkJzbjFYQ2VnOVhvcHFxN0FtMVVLamJoUmQzZU8xWkRnaEtMcWxwMGZh?=
 =?utf-8?B?WTA3alVkRFE3czRaSjY0VmJVOXVXd3pNWUQwUkp4QTcrMG9JVm5VbnhqcmN4?=
 =?utf-8?B?VlpUMDJhR0E2ZkJNVjNzUEVkNnAzWm9tbnQ2Zzc5cGJMWVNxZ283ekxZUHRh?=
 =?utf-8?B?MlN1VmpUZDFsWEhnbE9kZUlSRkVReEdEcUxWWDZ1Y0FCYXJtMHdKK094VmlV?=
 =?utf-8?B?WHlPTlNyUXNIenJBK09KMzZhaEd1NjZkWVIybmtZTWlNSjdCRFBpRTFGSkQ3?=
 =?utf-8?B?blU5WHJaeGE5aFBUZUtxUXlXVGk3Njh4MkR5SGlPeUFoU1owMDMvazRHeGdS?=
 =?utf-8?B?UitGNitHZVMzc3RWS1M0NkRxWWpxRGNLcVhWZXorL0JBWnZKNkUrMzRWeHJ6?=
 =?utf-8?B?d1VLNGNFMmI0a0tLMDBldDk0UDZEVHR2L2VqVGNWZUIvNDlUR1RNaE5YaDlv?=
 =?utf-8?B?aTg2K3VuTjhjVlpoMFF2Z2YxNWhxUFUybGVQRHdVVFZJYlB0a2ZTbDZGb1Rh?=
 =?utf-8?B?N3pOL2F6bjZUWlYrYldtOE94WUdWK0JOb254Z0NocHZ1cU1KZkNUNHBEQldR?=
 =?utf-8?Q?RTQYA+SCa3hF5b1pYSB1H5HHP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f51232c-8ca2-4888-6c20-08dace098e58
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 10:49:26.7814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pb/f/Kq0z3nF16day2qEW+HmjE3tmPtXVYgkzfuhGHwAlBmQcpa7l08zmqgqDzb3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/24/2022 4:11 PM, Lazar, Lijo wrote:
> 
> 
> On 11/24/2022 3:34 PM, Quan, Evan wrote:
>> [AMD Official Use Only - General]
>>
>> Could the attached patch help?
>>
>> Evan
>>> -----Original Message-----
>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of ???
>>> Sent: Friday, November 18, 2022 5:25 PM
>>> To: Michel Dänzer <michel.daenzer@mailbox.org>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>
>>> Cc: amd-gfx@lists.freedesktop.org; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org
>>> Subject: Re: [PATCH] drm/amdgpu: add mb for si
>>>
>>>
>>> 在 2022/11/18 17:18, Michel Dänzer 写道:
>>>> On 11/18/22 09:01, Christian König wrote:
>>>>> Am 18.11.22 um 08:48 schrieb Zhenneng Li:
>>>>>> During reboot test on arm64 platform, it may failure on boot, so add
>>>>>> this mb in smc.
>>>>>>
>>>>>> The error message are as follows:
>>>>>> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init
>>>>>> [amdgpu]] *ERROR*
>>>>>>                   late_init of IP block <si_dpm> failed -22 [
>>>>>> 7.006919][ 7] [  T295] amdgpu 0000:04:00.0:
> 
> The issue is happening in late_init() which eventually does
> 
>      ret = si_thermal_enable_alert(adev, false);
> 
> Just before this, si_thermal_start_thermal_controller is called in 
> hw_init and that enables thermal alert.
> 
> Maybe the issue is with enable/disable of thermal alerts in quick 
> succession. Adding a delay inside si_thermal_start_thermal_controller 
> might help.
> 

On a second look, temperature range is already set as part of 
si_thermal_start_thermal_controller in hw_init
https://elixir.bootlin.com/linux/v6.1-rc6/source/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c#L6780

There is no need to set it again here -

https://elixir.bootlin.com/linux/v6.1-rc6/source/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c#L7635

I think it is safe to remove the call from late_init altogether. Alex/Evan?

Thanks,
Lijo

> Thanks,
> Lijo
> 
>>>>>> amdgpu_device_ip_late_init failed [    7.014224][ 7] [  T295] amdgpu
>>>>>> 0000:04:00.0: Fatal error during GPU init
>>>>> Memory barries are not supposed to be sprinkled around like this, you
>>> need to give a detailed explanation why this is necessary.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>>>>> ---
>>>>>>     drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>> index 8f994ffa9cd1..c7656f22278d 100644
>>>>>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>> @@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct
>>>>>> amdgpu_device *adev)
>>>>>>         u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
>>>>>>         u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
>>>>>>     +    mb();
>>>>>> +
>>>>>>         if (!(rst & RST_REG) && !(clk & CK_DISABLE))
>>>>>>             return true;
>>>> In particular, it makes no sense in this specific place, since it 
>>>> cannot directly
>>> affect the values of rst & clk.
>>>
>>> I thinks so too.
>>>
>>> But when I do reboot test using nine desktop machines,  there maybe 
>>> report
>>> this error on one or two machines after Hundreds of times or 
>>> Thousands of
>>> times reboot test, at the beginning, I use msleep() instead of mb(), 
>>> these
>>> two methods are all works, but I don't know what is the root case.
>>>
>>> I use this method on other verdor's oland card, this error message are
>>> reported again.
>>>
>>> What could be the root reason?
>>>
>>> test environmen:
>>>
>>> graphics card: OLAND 0x1002:0x6611 0x1642:0x1869 0x87
>>>
>>> driver: amdgpu
>>>
>>> os: ubuntu 2004
>>>
>>> platform: arm64
>>>
>>> kernel: 5.4.18
>>>
>>>>
