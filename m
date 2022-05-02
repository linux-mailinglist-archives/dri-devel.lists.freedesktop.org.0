Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6D5176DA
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440C710E3AA;
	Mon,  2 May 2022 18:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F3310E298;
 Mon,  2 May 2022 18:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvocC3bSgSfVNcCkKz8w25358xp2UIF77kHjpqzEhEkZn4BRGz3wJpd/VvmMfwnsoNQWVBARSgbRdyXmzyYb3zwrJewcWQAh8f16apvaAl7CBSLWIbhj39+yPBxBNq0GS+GCtHL9GXymOIWc97YT9pO1lHwtndgDm1c2nlxHRrKF1/phWpBRonY4WctrdRAagKdT5lkEUOmaZJyjI+i9Fa98KHabd8z/EZ3uvm+ueKBXExCTFDh41xKAG0+cqEephMy9907KXwc2V+MNttKn659eby8mVde8vNY654tc4prEweK7I95Suq7HP/3zq2mxq6uGl47i4gFahHbp5OP91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kHSIiysYYem5+LQC8a7A6MfooTTxIl32Z4ss/4+ISU=;
 b=Pc+dYC3HIDzSniJPq8ew+3Af5N0pLpzszPEMyHcc3bDP1Kp3yiRBAVIaf+munTEop4z/MHAQWbz4WJut89hKTmRqiL0qQee7VLc+RRHq9n5w0m3Icp7YOzzNQTdI7+lGtuvFkWTPiXCE4yvjgQT6YY75N/Rzho+ZaSOFMLL7bgw36VQRU8pof9By+yPE1+glvDljnx13MFuE4TMpbvbtv9INkI+1m3rJIMmcAMgW2WNDow+keX3NUox9f58jy683QIB3du0U1SF8/bepQxXRW5NFv3+3lgkf9DbirL+9pXVthYUtZ3ctW1P3dwOBiRW9O0F5uuVSQHaWfeeJmM/QjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kHSIiysYYem5+LQC8a7A6MfooTTxIl32Z4ss/4+ISU=;
 b=dlk5I9ki1EMktRw40QXR7sAhVE9XTDUqsHEtLemmC90WgxXmlLMsmbE60AfYJCTZRvg+4JXwUgYsJsprW6rIyvK+sUO2S3JdrJtb2KvdZ2XHqg+il3VHmN1jEKIc3Abs+/W6nESpKqZYaRYT0BQXn2hNWMOPg+ixFMDxT+xJiM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4901.namprd12.prod.outlook.com (2603:10b6:a03:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Mon, 2 May
 2022 18:51:28 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 18:51:28 +0000
Message-ID: <c0ff5e0e-4c39-5482-bb02-410660bcced2@amd.com>
Date: Mon, 2 May 2022 14:51:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [V2 1/3] drm/debug: Expose connector's max supported bpc via
 debugfs
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, swati2.sharma@intel.com
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48e5c2d9-6c27-4237-f893-08da2c6cc362
X-MS-TrafficTypeDiagnostic: BY5PR12MB4901:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4901037542B8F3004FA6BA158CC19@BY5PR12MB4901.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjug0WryImE+/aJEgQO9NTDXZwJw191wChzXT3a5/eCaZnhkZdxieuPzOl5zkHObKf0x/eCwphEf7DLpOeaI4QAx81I0wHhLD6a43NgyTY5ti6CRJelZeuahFlC3yQ7HZ1Fo4dJhk4yIWx5iSn0/8K4UrrkzXo/qopcDkXSBgD+HCz71GflVM2L4EsScxTzfvY2TR65ZTx6vS7bApLSoSEgNSjZ7AGQzB0GxhtgVmh835K1f/ZQ1E56nUN6Ugc9Q8FxwWkHVyuopphRAvRSLPoImotjTmbL/2rYEwoTqpd372VTgAYmN3VuPd0ChmSVAnGpfUMoQJN1VjuDprnrXvDoBvekcQtpdRTzhNxW0ojcPkKX1m67EGlm6I1jJFWi4lrYrxjsVsl/AvyGA/KVwY+8Mu0qrlxGWHEhFIQqUiaFNqQf6XERkk+TQTGvaU830UOw/PtjrE6FdFJLI18Z11UZKyajTGJF37JTH2kKVrdhTlUa4QbW9qsNexODZ8FKBOCQiEGcWLczSifhK0vJ3VVoAklRnl1TfrJ72RpqjpVGBFJ+95nfEc/9oMkGUB342vZ6FLg6wdgvjfF1uIivK5capAqWADPEgNQ1JfywRVdNqRlSGqAMrtBUUSV9iv2OTNbxHcQ1v76S2p/RTt8pVq/ZH2/VC3m9IEBe7DCrNvQTkw7kvQ8NaDl4vDD1qLTWzL6JXkdTKiSwFCmqFDmRUY88Z8S00xAYYAvOOXUjGUq3kIAeX61hZpGbTAU7E/IMQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(36756003)(31686004)(186003)(53546011)(38100700002)(6506007)(5660300002)(316002)(66946007)(8676002)(8936002)(6666004)(66476007)(66556008)(508600001)(86362001)(2906002)(2616005)(31696002)(26005)(6486002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b294ZHZrRVlsTGMreDVvbjlEYW50b1dnVlF0S25rUVUyK3ZySFFsdW1XTldH?=
 =?utf-8?B?OEl0Qk8xZGNKbnRCT3hpY3ZoOWwvTU0zOGl1QjhkZWh6UlprbmR5L094Z1VP?=
 =?utf-8?B?NmhJczV0TGNvZTkvbUh1YjJLSU4rc1QxUkx0cHBEUU96QndISWZEME1xWlZ3?=
 =?utf-8?B?blpYNVduMjRhTlFpYTZjUm1STGYzN3VaRW12UnZyMU5NSHRqemlnbDlJUEMv?=
 =?utf-8?B?YWJXYjlDSlQ0dWw1R0xqSXhSOFFtb1R0b2VUaUIrWnIzTVduNWFLa2pxK3du?=
 =?utf-8?B?Y3BYbSs1cTJFaEVrOGM5N3RzSFd6SktqY3l6dmNXUWtsUFpHejZ1UUpUSUI2?=
 =?utf-8?B?NXc5STMrV0xmeENpU29yRHpWNGUzTFBMNHlmbVIyeTI0VVdPMklXN0kxWHVp?=
 =?utf-8?B?WTlZS0c1aTh5MGs0Q2VNZkFpa241ejFBSGdBL2Y2RERqaTRBa3o1MFNUSW9j?=
 =?utf-8?B?T0FqMFQxdmtWWHcwS010STJjdyt5RWxhUm94U2VKMXB1QmFzSWdRNFdVVW85?=
 =?utf-8?B?SjVtOEJKTnJhOGd6ZDIxc25sbkxkRTZBenJPdk9GbGppSUVWSS9pUUpRYTFx?=
 =?utf-8?B?MnV6cHgvR2wzeCtabUdPVWpGODVXazVQRFhmSy85TDdtWDdaZ0h1MkZIdVk2?=
 =?utf-8?B?Wmc2MTVkQjhzV01vQWx3eU1lOHd6SkkwWDlsWHBzUEtNV3FOTTVCVk9nSjNT?=
 =?utf-8?B?K0lXcGpxV2owS0c0ZVdOYjd5aVJZWVNaemdWNXh0Rjg5L203VnV6OWF0dUEz?=
 =?utf-8?B?aDcyU1FlVTAyWlhyN0xkbnRVNzhORWxBSlZzYlpvbHQzVXdzSXlIWHZnRE1V?=
 =?utf-8?B?cGRLdGxWRHdtdWJablMrbTBjS0ZDdXBHNXZycnlnMUZ4emg4eHQwYWUxQXJJ?=
 =?utf-8?B?ZnVmUkRDS3pLcFBiYmtiTmRYL3M1TTFwRjhjcjJxTnNqbEdQNjhTblluUU5t?=
 =?utf-8?B?ODM0blVncTlVeERSQ2VNbVhlMGpudTFqUHplLzMrcndqVFpXN3dTNm02NjJS?=
 =?utf-8?B?L09LSUprTjJmTjVsRlBZRFpxNmNUYllnTVZqamtybGFMOHd6T0lhTWpERWpK?=
 =?utf-8?B?U0h6ZUFQZmFKTzJ1ZzNjQzZXdWNlTXVHRkUvSXBQVFNoaW9LUjFKKytXN3Vj?=
 =?utf-8?B?QUUrc2hqT0NrSXBNOGtIN0I0cUpiWXBpSEdOekZ3N1hPcVdHMFo0R3FkWU5x?=
 =?utf-8?B?bHMxeklyZnV5WWcrUnE4NUdhaFUzbkZ6SVVoVDMzT2dUdXI2U2p1OG1vaFYw?=
 =?utf-8?B?U204bjNjL2FEb0VIRlA0Y09BcG9VYitnQUFZbndYNlJPR1RMWmxqSUNvemJR?=
 =?utf-8?B?aVRuam01eVVYdytzOHA5c0VBVUNuTEdTb2RUd2t5djBSdmo0SUlSL0k4NFc5?=
 =?utf-8?B?d0RHOTVuc1FDTllPcjhVWUdBK09BSHdGVHJTTFFXMFZmQnZBNmlvRVZKRndB?=
 =?utf-8?B?N2xXdEVaeTNJZ290Wnl0SXNpR3lKaEdOQlRUSGVUb3BtbkNiYUFmcmw3VkYr?=
 =?utf-8?B?YlpoMEpLS2U5TE84TW9YMUIrUHlFQlhQWTBnOTlEUkxQK09RQTRHL1dKalJD?=
 =?utf-8?B?ZElqSmNJclJSd2l2NSs5MHp3L2oyNkdVRVAvaEpiWjcvc2VkZ2dpU0VxbE0w?=
 =?utf-8?B?ZnBkMjB3dGg5TlAyQzBEK1ZRZkFuZUZ2ZytZem1SS2theWhjQ0p4WnVtek5L?=
 =?utf-8?B?eExzWXJIYngrSStWeDBLclFOV0FZL2NjRS94cHZzMmVDSjB2OW0rWFFONUtm?=
 =?utf-8?B?RmRneEw3bGEyVGtxbm94blZoZjdGUjN4Z1p1RGVMRXpVd1d2bXhIWmhiU000?=
 =?utf-8?B?ZlRHQlJSS0hFOGtNZHZ3N1ppb0VzSTdIZzRNby9pMnFXcjdnSitHa0hsbW5B?=
 =?utf-8?B?cTNJdFNIL3huSmlCNk53TUx2elBwbGZUTE1ab0FVQmtwWTdEblU2Q3NjV1dQ?=
 =?utf-8?B?a1ZtbVZjN2QrY1BOWjFZd25Sa08yYlZUUndlWG1RT2QxVldYeFplN3lOZVZx?=
 =?utf-8?B?T3VwOGZTTXdHbjlaTnVZdEg4cXRFK1NwM2pWa1kxR2hsRkM4dDB2d3hFUFgx?=
 =?utf-8?B?Vm9vVWR6VlZWcGZ0L1lheithUWhFZUgxaDB3eDRFMFB1WitubHM5SG5SaG1D?=
 =?utf-8?B?TUZZVjBhL1NXWmxnOGJQakI3OEsyZ0hSZHV2ZDJVZzVqeFlYWlRtTWtjN1J5?=
 =?utf-8?B?WEhsSTk5SXRPQkk1OHA2Z3F0cmpMcmlqdWJlZ05jdUhUbkFUR1lLYVdtemJ2?=
 =?utf-8?B?bmVGdVUwRWtQRnB0Q3lvNnBWTm56eFc1QUhmdjZtam5hbU1XQzdOdktHekRZ?=
 =?utf-8?B?TEJIRUZKbXNkaTRQODk0Rk1rL2dIOEtRMEZ5OWFLMVlrbGxCSHJ6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e5c2d9-6c27-4237-f893-08da2c6cc362
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 18:51:27.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDChZ5dVqBNMZywlfTE9DJG1SdQZyt3g1wK0lyP7nBAxjjRt/Rv8A5onXM+BktXFcFW2DEPCPnEZow9I5BW4Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4901
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

On 2022-04-11 05:51, Bhanuprakash Modem wrote:
> It's useful to know the connector's max supported bpc for IGT
> testing. Expose it via a debugfs file on the connector "output_bpc".
> 
> Example: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
> 
> V2:
> * Fix typo in comments (Harry)
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_debugfs.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 7f1b82dbaebb..fb04b7a984de 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -395,6 +395,23 @@ static int vrr_range_show(struct seq_file *m, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(vrr_range);
>  
> +/*
> + * Returns Connector's max supported bpc through debugfs file.
> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
> + */
> +static int output_bpc_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector = m->private;
> +
> +	if (connector->status != connector_status_connected)
> +		return -ENODEV;
> +
> +	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(output_bpc);
> +
>  static const struct file_operations drm_edid_fops = {
>  	.owner = THIS_MODULE,
>  	.open = edid_open,
> @@ -437,6 +454,10 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>  	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
>  			    &vrr_range_fops);
>  
> +	/* max bpc */
> +	debugfs_create_file("output_bpc", 0444, root, connector,
> +			    &output_bpc_fops);
> +
>  	if (connector->funcs->debugfs_init)
>  		connector->funcs->debugfs_init(connector, root);
>  }
