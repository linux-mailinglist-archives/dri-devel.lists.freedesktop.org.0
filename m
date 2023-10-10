Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64917C00FC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5C10E3A3;
	Tue, 10 Oct 2023 16:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17F710E39C;
 Tue, 10 Oct 2023 16:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=de6BPe1HKE4fDrTAyh4K8qc4CMYucpeWa9Oot8y/7f5DujH8srYAko5gbINaUq8ok+M97vIzF3qvAuHNDy700v+JJoF1urgL3rl9jZ99QXAR8F+jPyBz8q5s/k8irbzcXeaCP4CrkkxT7YpOVOUs4mimiRPntDEwKvoZCvYqbbNiCI5Gi/ftx1KtBMKvSt4e/uY3iW1g35aGPPGRdZRY8R4ZUDnz8A3LuZoUCWrCvHndpWMtWqTLWBWuX0KODMeJkO5Bd/rXuMbQ2pV6L9JmAGp+JD717b08gcRf0bKz9QA5A5BqAHmKbe1L/9HQnTadnh/4juC1S1bAUSLOMsOxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsUnUAWxSdCbgv2z2LGBoHATGUWNHmWs6UHZ1j3/bcg=;
 b=Pnbi/tS0zyzWfXVn70UDt1AiYZykgJ9P6M+MIxLzwlTvYN9INu3VUGjAe3ARjefsVyo3Tk9NQxVuA10GPtBpb7OzrWFBV+FVGxCfkbcEin/SFYlD35rLtpwwlSpTjFBQQZIPepktJAcrZxm9DebaFUtYKaGAciE788G3LuCkdWHXTIORrwewj5koXvcp4oVLxh/zoDffrkaGtKfNFtLjB8masj8aXufIKbIbQj/EGqdPe8As2QvE8yQWrDN4pRQHBn7Ui6f6v83lgWhNXJ9gzNsJYN+MjLX974usGvSid2rM9XhC1dnOhekLZrJJp8bz3tKpVQcvkaZP4Wznok7TaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsUnUAWxSdCbgv2z2LGBoHATGUWNHmWs6UHZ1j3/bcg=;
 b=F+cvPEnNJl9T0TJa3D/v/kcTk7gOU7jCGCkwhsWkveWLgBrDr8NsYCry7EY1dqiO9Xim8wzNwiBsV55QuE/Z4Dp/07H/ejSrFe3kvbVDeZueHXja5UtlNe6JV3HLzeqtKJxCgPqKlZ5lH23XCAJugNW+uBEibNaW+fZ1NBfWu0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 16:00:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 16:00:33 +0000
Message-ID: <be7ebf48-0952-452c-a9d9-6e0e221f52e8@amd.com>
Date: Tue, 10 Oct 2023 11:00:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] platform/x86/amd/pmf: dump policy binary data
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:806:27::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4508:EE_
X-MS-Office365-Filtering-Correlation-Id: f17a9d19-972c-4d7e-8017-08dbc9aa08d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W5oWAiHoZz9967G/q5ROp08odiBgjJ7NKl4pDYMVtpaMvAFf1Ioj4S12yECrfSTwj+hpMI2TogxPmtSP2NCm32YD4BpDn0KPlb2sJGENvhNiA4WRsai2KbkK1OmHZT3QQYZc8nVb470SGCaLWwpk61vasU/ykB8Bc+SSMiteNLxQnaANiWR5zr2lCNo4A4HHPXbHc5MDS0QwU3Sj24uu1Yf4v2kApiAvmNhclWxtLbMkfnjt9nJ/lXkpxOPx8tp7Zwo1iMMbp8Otxp3+46nG6NMeokxXCuj54eSCEirMvsqS6TS6Z3578Mg6N1WZ4LLO1lm4tSZYYdYKhL4cNIJpnz4xWCYEe1VDpcld8Jr8Dcn20EVBiH98naPmBGHHK0Tw8eKKf0sBngMdqubklktxv1Yhgtk98c+lQfJBYTTLM2jwnGuugITe1kN9TPB5EgsYAKm9IiSxBk6T3sMrY8KBb9tATpjJEC+JFVlLY0oAPKcw0HXV+mWg4Rb+2pL9mvYWHMeMDlC+Lcdv9mzgfGr9CnI4NFp1uIFyFAs/6QbvAFjrohgAVIADG9Ym3xgW4XKO8OVQLdUgcGUE3ektjH6CFfxAUmzQ3alqnJ9GQROcp1ZhnK+3Hj7SdYkzQ6qcNsPUoPQdD8mfZZ+pcg6dd0n/C/IyllRNRd/OsXUXM9zol1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(2906002)(6506007)(6512007)(53546011)(921005)(31696002)(86362001)(38100700002)(36756003)(26005)(8676002)(5660300002)(8936002)(44832011)(4326008)(6486002)(478600001)(41300700001)(316002)(31686004)(66556008)(66946007)(66476007)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pNckg5VkI5NEZRREphazdHSDh2citNMG5MTmROSzNwU3U3dHkyZHJQcUVL?=
 =?utf-8?B?RTREWEpWNWtZV0R6UEdTcEJab0xvQmw3K2xzeXluN1Q4OGc3RWl6MGNUT0gr?=
 =?utf-8?B?cVpNaThBVC9GR01sR0dRM05EUlBsZ2lLeWl2bnAyTTVNeWJLU250akxEbkRH?=
 =?utf-8?B?SGZIWmtVZkU0VjJoYitWUk4zUU9kYXNiNUYwN0RQcCtyU0JuNGJIY3FWd1Bz?=
 =?utf-8?B?WVhXYjhCaElneURGSUkwRkFtUmxlTGFidFVKMU1RWFA5a09DcW5YYUNGRUtr?=
 =?utf-8?B?ZmFWSks5WWY1ZlNaVWlxQTFnb3JBaldUTlZ6SkwwKzhuN3EyUE5tOSt2ZTB4?=
 =?utf-8?B?cW96WnZDeGFDK0pHd0doRXBuMit4S1FLelhCZCtiVjU4TlladURrMERIanow?=
 =?utf-8?B?RlRXZklmUEI4RFNpSExqd2FKL0lWdVJwMnA3aEw4NVpMKzZHZXhWa0lxN3JI?=
 =?utf-8?B?YXBNck80elFsRjZ1ZFdzS3JvWUg4ak9zd0djcDIyVVBjbWZHamxrT2hnZ1BP?=
 =?utf-8?B?SkxmaDNPSXdzV2xKRXE2VC9NN2NjVjhETmZvd1A5TjZCaWt2Y0gvNHZQRzdr?=
 =?utf-8?B?WWZqMm5JZ3VqKzhCNjJ3ODZKZzZwVnQ1TXAvbWVYMVdjNFZzQy8zQ1NpdDYy?=
 =?utf-8?B?cVBVVUo3aXkxVEZJa0k2U2toNEw3QmNDcGhsV1dEZUN5VGxUa3l4cG1yS01X?=
 =?utf-8?B?RDIranBFci9ySXl0NEZwc2htNkFtQ0tad0k2eGgyWlZDSXhOM0pEcmVqVDZZ?=
 =?utf-8?B?QlVxa3BJWXlNanV1K1ZiQlN5OXc4czhqalI0UnFsdHVXSjIzSnpxVHhONFln?=
 =?utf-8?B?NFFmYmxLZWxvdGJMSm9Na292MllyMlZtK2REYXpDbDVWMk50b0MrNkVRNFlO?=
 =?utf-8?B?eW5ORDBlL1l0MGdjYjg0K2JXOStwZ0NGSVcveGFibkRmcEgwa0RLdGxQRTJ4?=
 =?utf-8?B?eWlqQllzeUNSeGxKc0J2RG1ieXZLQXRWdkRuR2x3OExLUTc4T0dQaHFqVjVu?=
 =?utf-8?B?Y216Uk0zUE9Hb044aXA2MmxVMXNMWGM3dTVMR1BHaStWOVF1TnNjTjVxUDZH?=
 =?utf-8?B?VlV0Zmt1bU4yWW5oNUEra1ZxRU9IU0hyYjZSRm5FS3F0ZFNSZ3dTdGM4dDRj?=
 =?utf-8?B?UFNCaFNnbHpIRHBCY2c5OUlrN3JRVXFMc2c5NHl2N1Jhb3g4WUVLWjRoRXcx?=
 =?utf-8?B?VGtkRmIxbU1vRHRnN0hCdlFiU1VzOVU3Vkc0V1hnZHVTMXQ4cHVJc1BwUEJu?=
 =?utf-8?B?dFlDVktUZkZZa1k0MnFJcENkOWZsWTNHSzZaN0JrOWN6WU5INE1tM2sxR0V6?=
 =?utf-8?B?YVNWUk5sbHZTb1c2eW0yVFhReVJGVHFwU3dNZ3dJREwwRlN2cnc3NE84QkJ1?=
 =?utf-8?B?N3RONFRaNHVQTUdreGg1T3dhR3Y1Z0t0OGM1TEtTRkh2MGdzRm9CRVRJTUYx?=
 =?utf-8?B?cGNxaDF5bFFueURjblFoVUJRTURvdnk3N0JQMzhCaWZnUFBwUytsOHFUa3VF?=
 =?utf-8?B?czc4ckFwM0FDU0dWS20yeUdRbVJialI2YzlOako1ZUhlTHBJZGNBd1lNazJK?=
 =?utf-8?B?bURua3ZrS2xKbGdwQit2anlqTmZkVGc3c0JzM2JXSFVBaXk1TkxZNHNWZ3VS?=
 =?utf-8?B?c2dTZFh6Q2REZHhvY3ArdkVnakp2Z2JuaHR0ODFiY1dxQTZJMWllSzBOME9x?=
 =?utf-8?B?ejdhL2pGZnZ1c25pRnpFUWtUTXBwWXdUWTk2QXo3WFJ5RERGbXNVUzE3SStt?=
 =?utf-8?B?RDJ4eCtib0pzZVhaSjdHZ0I4R0Z1UHhVMXFOQS9WTkVwdG14SW1va3ZJVkxS?=
 =?utf-8?B?eGMra0x6bnNka1FmSFRoZzVaVGlDT002WnY2Y1pHOGlzN2pnQnhocW9DWHhZ?=
 =?utf-8?B?SDBLYURraDlhQSsxTlNZUXJGdGJvVGwrOUVmT3cwY3lVbVNYaE9BR3ZLei9V?=
 =?utf-8?B?bnNna0NqOGV4b3VQY20wYTlnUU1LRHYyUkczSzRRK2JzZlNvQmJUMjk5NjQv?=
 =?utf-8?B?NWgxWStsaXRDM0VUVlhnNXZBN3ZrUFNaMDVCZVQ1UFdCQzFiWDA2bkNrOS9i?=
 =?utf-8?B?cU5IMExEdzZWZzV0YVV0Tm9XaENmOUN2UnluNFlyN1lDVjdmenp0cVg2Z2Fp?=
 =?utf-8?Q?Zic8cbWfQUVb2E1gW8eNXQU5p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17a9d19-972c-4d7e-8017-08dbc9aa08d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 16:00:33.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsASeBt2ZWGtb/v5V7zi7kJ4iFSCo1AkHp77mmRFDf5Mq9LK76JZNmwMdacjuUThqwKei/zVg17Mo8plxPpG1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2023 07:59, Shyam Sundar S K wrote:
> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 994daf945795..e4386f503ad0 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -275,6 +275,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   }
>   
>   #ifdef CONFIG_AMD_PMF_DEBUG
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
> +{
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +}
> +
>   static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>   				   size_t length, loff_t *pos)
>   {
> @@ -289,6 +295,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>   	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>   		return -EFAULT;
>   
> +	amd_pmf_hex_dump_pb(dev);
>   	ret = amd_pmf_start_policy_engine(dev);
>   	if (ret)
>   		return -EINVAL;
> @@ -327,6 +334,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
>   }
>   
>   static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
>   #endif
>   
>   static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> @@ -341,6 +349,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>   
>   	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>   
> +	amd_pmf_hex_dump_pb(dev);
>   	if (pb_side_load)
>   		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>   

