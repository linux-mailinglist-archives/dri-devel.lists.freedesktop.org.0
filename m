Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F5B82717
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467A10E00A;
	Thu, 18 Sep 2025 00:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vCrpUHdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010037.outbound.protection.outlook.com
 [52.101.193.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558CB10E00A;
 Thu, 18 Sep 2025 00:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl5sVDsKwoaUnYwVC2XZgLiOkRFKtSWfPmIRTwCld3HxkJnWLF0tlZuJ2NCO6ZbxiTkJlfFjdhCcV3pa8tg5EMKDEVcIodmdrI81asd7pVysSwmmVTgtH0QQcrmKI8ntWtgb5+bEiCsdxtQFiuQsnODDBTGPOdTT77Hpbe3jtCjuHB9lp7+Gn3PgGq1X2N9dKzNAUrAjBfDnsyxgufJbyjXa8FrwCmJlG3zwlWPjWNFZjqh62Nvuv6ReKJKKfJKbCs+LxqQXaICWxEIMyJznf/qvxry3cYYleTcD0vkYNggdkqwFGMLmmYekAMSSgHIzHd46U61iY/iVoWRNq4MOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8Kp2bNviaxgZFG9zSyXQw8jdgyrWFPDI+QQ3BY8doE=;
 b=nlBWSWH3FvCcOurqAvyj0milvWm3DfWWG0zZpLjolS5uraCvslQ9M/7Ej5KOOK1SW7d1ubiQBdFRinFI2bt2Ue8i1mbFWF/o+bwe9r8qqqHxeC2hwgwCIQKsJqVi8x0dJ52zOEAa0ZXlcFuuKKj3L2TQ2i3lJGtry0Gu1uj+3lBysSZ3q10KbW0laskafiwG38mjiBiVI02oQUBK27VPqXyExuGBOPjiGGDFeybqpgmz54VKfnqf1N8wotIanwfGwXwKkLZJwiqE95KhCaGZO2NADIGLPm/pq2oLrWkSrR7Q/sTmAtIgIP8vZECA00Zo1IhnMvwKFLvaTLV9xbuB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8Kp2bNviaxgZFG9zSyXQw8jdgyrWFPDI+QQ3BY8doE=;
 b=vCrpUHdGNY8fO4u8lt0XoYOzWYGOnG9WG05BFtTrzZjBhoU70EiY7UQQsg2B4jZK24uw7d3JWfTjFqXa5HyBr0vWBJEXEfAdanx/SdlhMcfHmMocYW1nZMw2RuTp4JGpHbyhZP+7+9I1LwR9UDsHAC87c7aqmeP6LLetbemOd3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 00:50:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 00:50:50 +0000
Message-ID: <5bb12014-15d4-48c4-bab7-aaef84efae3a@amd.com>
Date: Wed, 17 Sep 2025 18:50:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 13/47] drm/colorop: Add destroy functions for color
 pipeline
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-14-alex.hung@amd.com>
 <59910838-4ae7-42f1-9226-3845b3a4ab52@bootlin.com>
 <73c5ddcf-885c-4c90-9393-6ee6e2fdd984@amd.com>
 <6a9ce6f7db556a7b2a3ea60a4765075a4f0073cb.camel@collabora.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <6a9ce6f7db556a7b2a3ea60a4765075a4f0073cb.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 12673279-2472-4583-c0fe-08ddf64d6965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGljMWRpcEtiVXFVS3EyYzFta283dTJ2ZFZ5aEowSEpwNXV4MGZLRWlsM1F4?=
 =?utf-8?B?aGt1SGRpTWxQYXAwdkdLa1V1MWxsejdYZU03SXhRM2V2dGczVkRKdXpuYTAr?=
 =?utf-8?B?Y1NnUFMyTDNRcXJqY2Z0NXhHME13N1pLK3pWMitwa0NzVWE3R1ROYW9Bci9M?=
 =?utf-8?B?ZzF3SzgxZ0FwdmxLU09sc0hLUURMOGNUZGVaZFlVSzdiVS9KSWYxUkthVXpj?=
 =?utf-8?B?VnQ4RmRqRkZmYkNwNk5DaUdsQUIzWVlBRTFvR3F2alF5bVFndk8rdkxrWEF4?=
 =?utf-8?B?ZGZlb0hZWDZyQ3VBVnJxVmw0ZDI2Tmw0MUs5WlZJL284VGorbHc0Qk02UFVN?=
 =?utf-8?B?dVc1QjBQbDhFM2hGMUZoN2JMSTVESmdRS0JrdUd1UmJlam9UTzJDV2VEY3Fa?=
 =?utf-8?B?N3U0VnVQQ2lxZ0hIUThxQTFiM1ZqTVRKc2k0MG8xRzVXY0x6am81b2tzWm1M?=
 =?utf-8?B?QkRsSGJYbFZlYnp5azBQd0t3TmNKdkJQNmpxQXdBcEZzVmM5eXZ4VUYrMGlP?=
 =?utf-8?B?Q0ZQWjBOdEJmZHR2cGh4QTVHVmJzWllUa2JHK1FjRDdrcDZUTW9ibHE4R3hr?=
 =?utf-8?B?Z0RMdXhBVmsyMGlJazZCcGRUaElOWXl3aUJzek0vVjE4Q1R5dzZMYkI4aUtj?=
 =?utf-8?B?REw2TGUxS1ZqbUVSQ05YOWJWRDZXM0VoL1JFdEVVUUx6M3IzanBMdmFKaXlM?=
 =?utf-8?B?K2MvU3l1aGRSUDdBTUNmTDFsNVk5cFpMSnR5UjFHbHhIRUdsYTA2QkRDNXVD?=
 =?utf-8?B?YVRlTmxGV0FOc3BvQXlYNFd0OEVuMzJ6OUw3ZmR4SWVPNVUyVHRKbFlBZDha?=
 =?utf-8?B?UEh4TlcySHl4eGJWN3B4aWJCU2VSNWNIdDlPNmIveFdzYWFUNkdQWWNsaUgz?=
 =?utf-8?B?Qno2WGJpK0tOc0lhZnRCMTlINGVqNEFuZndOaUw4Vm5zUFB2bFF1UXhQeUJu?=
 =?utf-8?B?RENYMERubDMrdDR4am9GKzBXVEp6NnQ4RnpSWEUycnB2aSttczk1dk9ybW8w?=
 =?utf-8?B?MXkycG1MeGxMY0twVjdNR1NJcW5kQTZNSmJta2kzQ1NBV3gxVEJKRGRZeDBE?=
 =?utf-8?B?TzF2b2g2UGhwODQzTTU1dnZ3REx0OVNGWm9rVHhPVEFPcVdqK0pGUklzaG5F?=
 =?utf-8?B?QlhhRnhGWWg1amJrd0NBMFk1Zk9JMUdOTldsejBGL2ZCVTNKVWdaaXh0REZh?=
 =?utf-8?B?OURMRmVtQVhqdmdHc3B1OXA1SVV3NkNXalRIMUVXSmhmTkYxdzRKYWZqL3ll?=
 =?utf-8?B?QUpwUzRpaHB1SE1iYzNZYnAzYTR3aDEwS0lwa3dmVTF4OGx3Vk94UkxteVgr?=
 =?utf-8?B?dm5pR3FGMzhzbnVCK1hHcW40M0FycGR0MGRiYS8vNmJINFVIUHA1NzhaQk5J?=
 =?utf-8?B?REFsdEh1dG1yYzRsTzBXWHFXeHFWZE5JbjMrSjVGdThnRUlHZy9kN3JOZ1ZQ?=
 =?utf-8?B?d0xtRnc2bkhWZ0taOUJLTktQMmZjSFZSR3QrdjlMMTY1L20vUTVYOEg2RHpr?=
 =?utf-8?B?aWhLRjBKU0wwTElmZ0RpZ01wckpNMkJYVTNwNkNrNGI0ai9rc2Jhb0cxQjB6?=
 =?utf-8?B?WllNOStLMEgvYTUrUFZMcVdsSjJBZ3hILzFqVm1jcFFjZVppVEIxNVA2K1VX?=
 =?utf-8?B?YWdvY0tySGMrQWNiZWYwclFNV0x0akJOT25HcmcvY3EyT3hJUVFwUThrb0h0?=
 =?utf-8?B?RS9Mc0lBTzB6R2RDcXJJcDh3OVNxd2ZtaHBjNnI4RFZESXdBanpvQkxKS2Vl?=
 =?utf-8?B?ZHgvdGFyOFFkaHY5c3hKUUY5VXVmbDZHdTVTTWZMcG9MUXVaSU1SOWZXYnQ1?=
 =?utf-8?B?cTZnUTUxdnAzcmY3YmVwRDAyc01ZU3FQdUYwT0I3TDVONUtvcm1RUlR1UHdE?=
 =?utf-8?Q?7LbLzZjZUVGkN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2RHekxyWHl5NlJJMUYxdnBqdEluQ1RVR21wdmpJYVp1KythUy9UM2dzclRW?=
 =?utf-8?B?cjZBYXpCR0hML0pnRUFhSXM1bytNbTNSZUVpUGJDYTl2UnNlU211bzU4Zkxx?=
 =?utf-8?B?Y1hISGRDS1AwdHJxak92QnBjeWwzUTFLUVNBRFYzZSt2NHR6NTZJaFcwaXRm?=
 =?utf-8?B?THdMbm15QmJFU2Q5K29QS29PSXNmd1dBT2wyQkFQb2tieXp1QWJiZUtHOFF0?=
 =?utf-8?B?aEZnZTd1SjQrNHg4bDlhQ1JIekdsNXBKYlRybkFOdDhnZ0MwSjk1REZDOExl?=
 =?utf-8?B?ZzVYeDFXaHkwOUlDTGdTRmExQnNBZnQ1VDRVSlZhV1B2MVZrM0xNV01FZWY2?=
 =?utf-8?B?U1AxWkdIbGo1WFl2RkpJNjRYTFJ2eUJDQ0ViQlN2VndGc0g5MXNsRVM1VzdK?=
 =?utf-8?B?L2sydWc4TGVXU3lqRG5qQmUzaXZqNW40cTBRNFh5OFRkdGZzSFdjWTdITDVW?=
 =?utf-8?B?U3F6Lyt0L3o5ZjFWeWhwUlRqTVNhSlBvVmxnNTI1TG5qTUljUGNUcEsxb094?=
 =?utf-8?B?azVQNGFIU1lvTlZxTDBhUytlaGNCUGxTdzRJWWVVblI1LzJ5eVNtTFd3Vjdy?=
 =?utf-8?B?d0hvM3VyVTFFUE13VEVHSnV0ejYrMDdFUmN2NDgwUTk2OHNFdVNvVFNRMFp5?=
 =?utf-8?B?Y1FNOWtNOE94RlNTQ0xmajIvTURUTnFTdldxek9KTnRRdXZzZ3hwRGpjeWFy?=
 =?utf-8?B?cGFOek9vSHBFblQwNUp1L2daUDRrZjkrVzBDMTFPZ2kzc2tCZXpwb092UCt4?=
 =?utf-8?B?c3A2UGVHcmhLRW52VkJMNjVKcXJlc3BXUHRoMUdISjNGNlF3TUREK080TEZI?=
 =?utf-8?B?MzBLNFlmOE5yMHJQenhEeUhtRzBPeVJIS09mQkw0eDNuS0tydnp0dXd3bUZr?=
 =?utf-8?B?WTIxSXltRFJGcmtsbmNOVFArSlRrY1VsQkVRTjdXalBRWThCTHFMbTRyNEov?=
 =?utf-8?B?UTRoUWlPWitNbU51Vml2eHpKVXdaOGo1MEQxKzdRL3JoVmYyNHNnNDJKUmFT?=
 =?utf-8?B?VmNFeTN0ekN6ZVZYazNtNmFvQzhhY2NYUnljVWY1aG4wYUJrWkxSMHo2VTk4?=
 =?utf-8?B?cldNWlQ0TmV3QjQyOERXOW9TdGJtRkFwa0Q2SHo3b2F6cWtZKzJXNStQSUxn?=
 =?utf-8?B?R0Z6T3hSSHc4cThTckNONFdLQ3pEdzV2RUxZV3UvSm8ybzV6V3pPckZkK1dT?=
 =?utf-8?B?U2Fkd0lZNWNITWxsS2RDM2svNUlDTk9uWDM2K05WWjBmV201WUVwNWpkaEs2?=
 =?utf-8?B?RUY0OFRtS3JNMklTVEtmc29zOW54T0NnQmpJOUNJckxiVEV6TmxLSkV3U2x3?=
 =?utf-8?B?cjA5bmRmSThCTTE0TWRRQ0dzclIvTkdESitiWkt3cGFWQmlaRll6c0M3R2Iy?=
 =?utf-8?B?N2VwV3hXSlBhMXIrSVBZOFNZU1hvNGV5L0t3SFVNQnJTODZ4QzhqQ0ljRkho?=
 =?utf-8?B?cUNzTDJIVW9tS0dRSjlXeGJPQW1WSi9vQ0dFQm5mN09NZ0dKSzFKR0VqZkpF?=
 =?utf-8?B?dHE4NkFnQ2pJUi9KaFZ4RGRtSzJ4dFMydTNnc2FHbXR2R1BJWGNkbmRWREc4?=
 =?utf-8?B?UXBHMW96Mk5NM2syWnVqSDNLTzN1cmRLNys1aEV0U1dScHdsU0FNVHZVM1hH?=
 =?utf-8?B?YnBMR1FXQm9kUDJlRFFkMnN0RjZndGNoTFcwbmtqUUJOd09pTS91Q0lqZktM?=
 =?utf-8?B?UnFaN08wdHFOTGpFa1k2VmwyRnBYZXUvNjhaQTc5bWpUaTliZ3JJdEdZbzVi?=
 =?utf-8?B?QTUvUmJ0NU5PZU5WcmZKUFNGSGdUbUVWbEM1UENUN2ZRcTk2Qm9ZdXFhWVV5?=
 =?utf-8?B?VnQ3QkU5dDFveTBwUWZ5RG1jem5zNS9VV1NIQ2VPb3I2b2ZvVXNReE1pNmVJ?=
 =?utf-8?B?NU92NDVNMEw0V1VvZHMwN2wvNGpVS0FwWmlxaTI0NWVZY3Q3N0w4Ri9MZGY2?=
 =?utf-8?B?aW1sSmZLWU1XVXdzQjRUd3pGd1NEZnJnTG5TYlk2cVlIbEVFUk5RelFJUUcy?=
 =?utf-8?B?T2x0UGdsUTd5K25QRVl5R0NPWWNrZnlBakZtWDBERDhmZ1hVYnNST3NJWjda?=
 =?utf-8?B?MEkyL1k3SGl6RWhQWmtTbEt3QUJ5SUxsbW1KcXdJNjNTZ0VCMnFrTTRYU0lp?=
 =?utf-8?Q?Ysr+0rxUFbCg8w9hTIGSg+QC0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12673279-2472-4583-c0fe-08ddf64d6965
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 00:50:49.9817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NDHUD+iJx3TIf/T/Wn6ipSuTKgXWQBDj4xLahA6za8Ssi1biLfbx2n8iw2l03jLj6/gwWMDXiDuxRlD6anmUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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



On 9/17/25 09:31, Nícolas F. R. A. Prado wrote:
> On Tue, 2025-09-16 at 20:01 -0600, Alex Hung wrote:
>>
>>
>> On 9/5/25 11:12, Louis Chauvet wrote:
>>>
>>>
>>> Le 15/08/2025 à 05:50, Alex Hung a écrit :
>>>> The functions are to clean up color pipeline when a device driver
>>>> fails to create its color pipeline.
>>>>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>> Reviewed-by: Simon Ser <contact@emersion.fr>
>>>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>> v11:
>>>>    - destroy function takes drm_device *dev instead of drm_plane
>>>> *plane
>>>>      (Nícolas Prado)
>>>>
>>>> v9:
>>>>    - Move from from latest commit to here, and
>>>> drm_colorop_pipeline_destroy
>>>>      is called in respective commits.
>>>>
>>>>    drivers/gpu/drm/drm_colorop.c | 35
>>>> +++++++++++++++++++++++++++++++++++
>>>>    include/drm/drm_colorop.h     |  2 ++
>>>>    2 files changed, 37 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/
>>>> drm_colorop.c
>>>> index 7b3ecf7ddd11..6930d39c8ad3 100644
>>>> --- a/drivers/gpu/drm/drm_colorop.c
>>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>>> @@ -135,6 +135,41 @@ static int drm_plane_colorop_init(struct
>>>> drm_device *dev, struct drm_colorop *co
>>>>        return ret;
>>>>    }
>>>> +/**
>>>> + * drm_colorop_cleanup - Cleanup a drm_colorop object in
>>>> color_pipeline
>>>> + *
>>>> + * @colorop: The drm_colorop object to be cleaned
>>>> + */
>>>> +static void drm_colorop_cleanup(struct drm_colorop *colorop)
>>>> +{
>>>> +    struct drm_device *dev = colorop->dev;
>>>> +    struct drm_mode_config *config = &dev->mode_config;
>>>> +
>>>> +    list_del(&colorop->head);
>>>> +    config->num_colorop--;
>>>> +
>>>> +    kfree(colorop->state);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_colorop_pipeline_destroy - Helper for color pipeline
>>>> destruction
>>>> + *
>>>> + * @dev: - The drm_device containing the drm_planes with the
>>>> color_pipelines
>>>> + *
>>>> + * Provides a default color pipeline destroy handler for
>>>> drm_device.
>>>> + */
>>>> +void drm_colorop_pipeline_destroy(struct drm_device *dev)
>>>> +{
>>>> +    struct drm_mode_config *config = &dev->mode_config;
>>>> +    struct drm_colorop *colorop, *next;
>>>> +
>>>> +    list_for_each_entry_safe(colorop, next, &config-
>>>>> colorop_list,
>>>> head) {
>>>> +        drm_colorop_cleanup(colorop);
>>>> +        kfree(colorop);
>>>
>>> This free here seems a bit strange. I don't see any requirement on
>>> the
>>> colorop pointer in the init function, so we can expect it to be
>>> embedded
>>> in a bigger structure, so this kfree may affect a non-allocated
>>> pointer.
>>>
>>> I would expect one of:
>>>
>>> - a clear documentation in drm_plane_colorop_*_init documentation
>>> that
>>> explicitly says that you need to pass a kzalloc pointer => very
>>> error
>>> prone, if the user don't read carefully the documentation it may
>>> lead to
>>> undefined behavior
>>>
>>> - that drm_plane_colorop_*_init will do the kzalloc itself (so we
>>> garantee that the pointer is always a kzalloc pointer) => it will
>>> forbid
>>> to embed colorop structure in bigger structure. I don't think this
>>> is
>>> the case today, but I don't know if this can become a limitation
>>> for
>>> other drivers.
>>
>> Yes it makes to have kzalloc and kfree done both in vkms/amdgpu or
>> both
>> in drm_*.
>>
>> Does the following change make sense to you?
>>
>> diff --git a/drivers/gpu/drm/drm_colorop.c
>> b/drivers/gpu/drm/drm_colorop.c
>> index 1551b86471ce..67aa443e53e7 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>>
>> @@ -214,6 +216,13 @@ int drm_plane_colorop_curve_1d_init(struct
>> drm_device *dev, struct drm_colorop *
>>    	struct drm_property *prop;
>>    	int ret;
>>
>> +	colorop = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +	if (!colorop) {
>> +		drm_err(dev, "KMS: Failed to allocate colorop\n");
>> +		ret = -ENOMEM;
>> +		goto cleanup;
>> +	}
>> +
>>    	if (!supported_tfs) {
>>    		drm_err(dev,
>>    			"No supported TFs for new 1D curve colorop
>> on [PLANE:%d:%s]\n",
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
>> b/drivers/gpu/drm/vkms/vkms_colorop.c
>> index 0191ac44dec0..f11dca61b5ce 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -24,12 +24,6 @@ static int vkms_initialize_color_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>    	memset(ops, 0, sizeof(ops));
>>
>>    	/* 1st op: 1d curve */
>> -	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> -	if (!ops[i]) {
>> -		drm_err(dev, "KMS: Failed to allocate colorop\n");
>> -		ret = -ENOMEM;
>> -		goto cleanup;
>> -	}
>>
>>    	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> supported_tfs,
>>    					
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>
>>
> 
> Well, as Louis mentions, this doesn't play well with embedding a
> colorop into a larger struct, which is something I'm relying on to
> track additional bits for post-blend colorops in the MediaTek driver in
> [1].
> 
> I don't see an issue with the existing solution. From the function's
> documentation: "Provides a default color pipeline destroy handler for
> drm_device.", "default" is the key word here, each driver is currently
> responsible for allocating every colorop and cleaning it up, and this
> function is a helper for the common case where a drm_colorop is not
> embedded into another struct. For the cases where it is, the driver
> should create its own destroy() that properly frees the pointer for the
> container struct, which is exactly what I'm doing in [1]. Perhaps we
> should just add to the destroy() documentation that it frees the
> pointer and so drivers embedding the struct should implement their own
> helper.

We can go to option 1 of clear documentation in 
drm_plane_colorop_*_init. This doesn't seem to impact the API itself and 
improvement in future extension can include this.

Does anyone have concerns?

> 
> On that train of thought, I think it would make sense to make
> drm_colorop_cleanup() public [2] as part of this series so that those
> drivers can reuse it.

Yeah making drm_colorop_cleanup public is probably a good idea.

> 
> [1]
> https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com/T/#ma6b44d451ed84c9c6b32d26e6192ad951612444d
> [2]
> https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com/T/#m15e8f52a03d711a4d3ab9cecc7b9cafb2954c489
> 
>>

