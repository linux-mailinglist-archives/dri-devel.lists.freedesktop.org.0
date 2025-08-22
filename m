Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147BB323F6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844610EBBD;
	Fri, 22 Aug 2025 21:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DC0zE0Hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701A210EBB8;
 Fri, 22 Aug 2025 21:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIVXK7uGf7FlTgPcwyYwIKAvtd8HIuHelSllK16Ura7OiBvxYxJKdOyQo/i4Vlc26zIm9ZsEgsHoXfK1vhUZN/OxCHv1YtXTPxcn2fhpqJ8VwiJKqQ7v6LBSerDnXpuMunBS33QYGucZYw3uvmcHN44VZajAqhA2fGJKf8FIfZroy4pseNO9Y8FGpn08oSlAdM6NfI/Tf7vNOnu8vrbD1qd7C1//X1CU5iB7s1pCksreuTl/chE1g4G2eRqOUdPwWJE/2n5HVz6X7+7INwFHo1uJZTEdF9lDZJWG6Kr0LU9lMvxIruTQucKGDljv/84ce3paGWo4gOrtYuOnEeCIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxbshUxLYL9Jq+YuyjFto2jiVj8i2Ec2W7hHYfib8Hw=;
 b=TR3a4iZ4VSPj/LlTOhLtONZH5siAJLyuxPLtu/zf/CqsoRiYCD/BHGf+O/79jIlCmAFoXmgEyAys3vS61I1mGOWq1dAV7X+2pPuIgRC0DlVeuOKJsmSiud/NrSy6YfcRtFSp5Pa7UWFmOSoWeY09p2Ocn/9RacBhapcBVliEgBcaCyu/f2bFKKKKqBdKiEdY0iUW+ou1VwKfzL7athUfd1ZIyKML8qE1lPUU01hr/S0rAqHlZDpAroTNA3KVZWdqsvTHVjw6yFWTnFM6vzarBHIdH2VZQZiDQyxyWQob6yln4HFiPt01D6tZgRO/Vd/jIEI+hr0zeYIGv3nbsrFf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxbshUxLYL9Jq+YuyjFto2jiVj8i2Ec2W7hHYfib8Hw=;
 b=DC0zE0Hy+AAotBJnkF2n0UuXK90NfYx85Ihmqakn2mO8Dvvw5PZ8AKNR1aQ9MwRkEqj6NA4uyVu+bDITZd61Cyrwzw2NyC36VFfBd+K4yHYyGzC+ASq7hjU7JmaciYOTwcIaQV8plgZ3ju7Wbhuio9JEBRXsnaqi4VCBzd80Al5J+5rh/YsygnqqEKNnd+WuBdamkR7UGxAST+boB8PGJlkvIEqBWEufFVIRrUjO0NvT3J/H2iXQKNCzM1/qDGc01/JEmMlcMm9uOHoNH5Crq4exqQnks6VdQSNmPMmWZgnylMbkAZUQ4kztP2IcQRTuhDNEkL5/BbUZIcob2VO8YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3SPRMB0011.namprd12.prod.outlook.com (2603:10b6:806:31a::7)
 by IA4PR12MB9834.namprd12.prod.outlook.com (2603:10b6:208:5d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 21:11:49 +0000
Received: from SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5]) by SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5%7]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 21:11:49 +0000
Message-ID: <69bd369e-ceae-490f-8f14-28a2a8e874bc@nvidia.com>
Date: Fri, 22 Aug 2025 14:11:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/nouveau/disp: Always accept linear modifier
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-3-jajones@nvidia.com>
 <DC99870U9374.HUXNLLZ5ZYBE@kernel.org>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <DC99870U9374.HUXNLLZ5ZYBE@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To SA3SPRMB0011.namprd12.prod.outlook.com
 (2603:10b6:806:31a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3SPRMB0011:EE_|IA4PR12MB9834:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df2bf18-64c1-4af5-f083-08dde1c08212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlRuaDZTczRodElSOC82VzhQKzQzMTZpcy9tai9BTTdwR1k0TEdLM1REdVRV?=
 =?utf-8?B?bERpeDEzSDJJTXJrNmdaTHdDUHoraGV6aCt6ZUVoMHZodGR6TS9Obk1HT0tT?=
 =?utf-8?B?czdabXpOMkhHajVRZmU2cE5mNDZaOW1OYWRFUHhBeThJMUdxUXJpVDFhOVlv?=
 =?utf-8?B?bldadGtMdmRxSUNnTmVVTUtOQnVDRFRVTStDZVlFMVFYbHNqYS9UdGpEa25Q?=
 =?utf-8?B?eHNWblcwNE9qd1habGhWcFY3TGQwekFTS2ZyK1NIZU9pM1FsTUJtd1pwS3g5?=
 =?utf-8?B?VjBTaFBBZnlWQmM2WnVTL0x3WldBLzlsOUtGbHdscVB2ck9oWXFKcVN3ZEhO?=
 =?utf-8?B?ZEpMUUdJUis5VVBUcUUyRkRQMktHSFlmKzQwV1B4Um04YWFjalRqVnY1QzVq?=
 =?utf-8?B?WDd4aytyK25MSElNSmU0b1MrZmd5TVBXc1pZS0lRRldscnlRUlBhYzBsK09U?=
 =?utf-8?B?UEl3SFoxakw5czNOaE9UVDZzSmpaZ05Vb3cyaHFMNlJ4VnFGZXlOMUxTWWxm?=
 =?utf-8?B?NW0yb3VucXEwUVlVaXFBL0VTY3R1N2h1SHRBTWl1TEdweVNkSi84YVoyU2xz?=
 =?utf-8?B?M2hiSnJPdG9XYjdFYTF4YU5XRXdsT3d5UzEvWFZHdFlVSlZNd2I0dzNwb1pu?=
 =?utf-8?B?WlRVMnRJeVMvdGVSZm5WRytTUjlwV0F6RW8xc09FRnozK1p5TDhlSkxGaHRh?=
 =?utf-8?B?T1d3akRucW1rSFdybUxSZnBkUytYdHNVeXMxTEI0YWljUlcvOEZTMlhzOFUz?=
 =?utf-8?B?SjNmalhab0h2eTNKN05zMmZ3S0pjS09iVFdORVpsRE9XTUd0MHZMZjlDSERE?=
 =?utf-8?B?SXdtRVFwTldKNGlJVDY3NEwwUitXR1JSUXgvUi9jbUdpamYwM000MkdlL1VC?=
 =?utf-8?B?TEs3a0NrcHRxMEJQQmp4YlREVWh1UGErbGVDZThiYllPZlRLVzc3SVRrL05s?=
 =?utf-8?B?ZFRHTXdNbEV2U21obVJWQ05JWmUybGN4bkYwSE9aNm05UmdiVTg5dGFyQk5S?=
 =?utf-8?B?Z1pkU29yYXNra1dQaTcwVWloOFNJSmhLanlXYnh1SkhNc0E4UGtpbEFEejFN?=
 =?utf-8?B?R1pWWHhBd1pQVkU2TWZCcGVqUFNrWjFwQ0hyVVY0NExOS0ZXRnZFSmhDWUpm?=
 =?utf-8?B?M3RLb2VnZXBmR0NRUmhsMktPMU1ZU3FnaVBHUDdDTk5ycEJWTTM5M21PR3JR?=
 =?utf-8?B?SlRrdk92dXdVanZVbDB6TFNpOW9tdVdvcGJKTE41ZEJ1WnZZalVMZGdHUWlI?=
 =?utf-8?B?OG5kOHQyNmpZMjc0ZzlFMktUUHEwQ0pYVXJJSUtyaG5PS2E5UjRKTVhvRUUz?=
 =?utf-8?B?cURoYlBVbUpjL1lRUlY0OEtRejR4QVR2VVVMOXpBTzM3VDFObytIcWlvZkFM?=
 =?utf-8?B?NEdwRzRxYUVEb1ZrM01VbDlyeEVDWlBXV1dncENoSjNnV0hDV2Iwam9oSnFE?=
 =?utf-8?B?ci9xWmxXS1Q2VEVJUDk0d2tBSk5HMi9HSFZrU3hNaGZSZUxPNHBYWmFqMUFB?=
 =?utf-8?B?QVBDVWM1aEtSd09qU0ppcG5uMFZiMVVKSVNGMEdtcDFPbnNkRVorZkt0bkJp?=
 =?utf-8?B?R05yZ2c3N2x5V3hZMWRLWHNTbFBjK0xRYTJ6SEZISlJpVmpoRDZaZ2JRS1RQ?=
 =?utf-8?B?Nk5MSVFvU09Kei9KY3hBSjkrb3A2aHV4bDhOQy9ubzdOempsemJsd2lXU3dk?=
 =?utf-8?B?WXhkY2ZyNXFHQlVKNHQrREZGeHFzWFV2SWlPb3pueFEwWk1vRlJWajV1eUh2?=
 =?utf-8?B?UGRJc0JnQU52L0hLai9UakR1bWtVUzBJNFpnRDNwZkkzY0FCZHhWMEZLR1Jv?=
 =?utf-8?B?MHE5WG5NZm55YXdSQ29zbDZmUk1FL1JrcFZxdEo0Y3RMSnZzNER3bW0zc2Qr?=
 =?utf-8?B?QmNJQXZSaGVFVU80dzlqdExKZjBra1AwTHhVcHcyTHdQSjJNME1jWTNQMlpG?=
 =?utf-8?Q?jujaKIIT4/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3SPRMB0011.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzJabTlzOERya0xOSzdoVmdqVi9vK2hnR0xnZC9ZcDNnanp1aEM2dWxvUGNr?=
 =?utf-8?B?QjY0RmFub0E5ZmZjK0pJZUVHZVoxT08xcXRZNzRBck1EZUsrOGg1KzZrM3pD?=
 =?utf-8?B?ZTY3K0VETDdSeGZ6OXJzSkxLYzU2dk45N0tCRTVkSWpjc29VVGFSREE2ekNF?=
 =?utf-8?B?MGJjek4xbVJOcWlaYTlCQTJONUczSm91dEdqME9hY2RrRG5rY1hKbmZvR3RH?=
 =?utf-8?B?OC9XcDVLdHpDMmZNNkhJcjBLSnpLaE1sdENkU0UzUlc2YjlPMXBESW43STJ6?=
 =?utf-8?B?a01sU3RyaFhYNHlyQ3ZKT2JadU0zUjJMNnJZbTFUQ29CWENxWWsxcnJCdFVR?=
 =?utf-8?B?QnpLSi82cHc4bUlsbitvcG1ZRXN1NS83ZHB0NW4ybmhnRzZqdHVhTWpqSkFs?=
 =?utf-8?B?K0dvUWF1M09jWkdBNGFMNmlYazNXYVZ2T2U4SVNzcGVoaTlQbWFONSs3VHcv?=
 =?utf-8?B?cEtRMDZ2RW85Wkp3MFk3dkZSZTRGNlRIcXU3VjVySlFkdlNyeWdWV21WRzhT?=
 =?utf-8?B?WTRwUjhMU1BiZHM3ZWptQ1BHWm1YQ2QvdGxsY0xNM2ZYQUJzWUlSTGROeVov?=
 =?utf-8?B?YzByRkxYM0lLSlJRYXJJQmIyd1ZxR3FJRXE2K2VITHpwdTc3UjIvTGF6b2Jq?=
 =?utf-8?B?ZUVhekRuTHg0M3dhb29mN0dWRzFnV2VudDlMV2lwZStqNXBBdExZQ2E3eVNu?=
 =?utf-8?B?SXVlL2trV1lrQVE0bFQ2c3FLdTNiR2VNT2RYM2NVT1BMclBIbzY0NkRGRlZX?=
 =?utf-8?B?VkJTMjFDSVJVdkRTSi95ZlJYYkZPMkRiVDVWUlBZL3RvMFFlN2xzTWJ2dk9z?=
 =?utf-8?B?YW9haHp6OHllK3ZuQkVRWHkrckhNMHdYWGg2QTJHVFpZNmpJaEdMQUlyK3Fh?=
 =?utf-8?B?cjlKazdFVEZzOWFCcjdWcURreitBcnNjNkkzY3E5ci9odnRidkI5Q1pOc1RN?=
 =?utf-8?B?UDdOVS9JcVpWVjJJTWZGMTdMNUhVQ0U0d2xucnZCVzk5QlRMZm85Mk01NE45?=
 =?utf-8?B?dGNLbHA5R1gzRnkrc292T2N3cnY2U2xUNWFxZjQ5YnBMczA1VTBjUm5NYVV5?=
 =?utf-8?B?Z09CY1NBZUpuOHBMYTJ4N3E3UzNBTUo5OHVIbEIrS1FFOXFKRU9oWFlzL3pS?=
 =?utf-8?B?OG1HM0wrUWFocEQvT2tCc3k2VE00aUZHZWR1eTBCOWVySlNUTitrOEEyOXZt?=
 =?utf-8?B?UmlWTk43YTVDbHhlUElvdmxuN2dMdUllTTRJUHZOVFhOTS8rVU51TjQySVps?=
 =?utf-8?B?ZExKaDRER2VhMGE3SWdkSExpODNVMnMvNDFIRzVSMkgrL1R4SExhTU91RUkz?=
 =?utf-8?B?WmZEOGUvZnRXY0VjSXA2N1AxajJrN1l4YzA2WHB4TndHQ3lRZ2FPaWp3NTZm?=
 =?utf-8?B?a1ZtSXZxM3dkWlM5YndYS1ZucVJIQ0lZTWFyZ3ZJNldpWkRhQ01Rd3N5c1ll?=
 =?utf-8?B?clNqbElIUzhyWUVWMEhPcVBGUlFPZzBuRnpMWlFpVloyRWh3RlVnYWhoTXJ6?=
 =?utf-8?B?MXpGWjFrdUxhNTRYQ0taby9IeTNJQm5pZGdLaVp6QnFrRU9aWUV3MGVIZHYv?=
 =?utf-8?B?eDlMZW5KTE1hVWdicWxRY2M5YXhTdVloSi91d28yZVdONXl4YWZHbm9pcEZ5?=
 =?utf-8?B?T0dBVjBJWmsramcrWnJnK2dFVHhDQnBpQUZBUDVkOWZHb3RIamZUKzdkS0ZU?=
 =?utf-8?B?aUxQRG5OTmJvblF6ZDVwWkpUbGVJUmVHYTBQMlpERmhIak93dDdrQ0x0WXB4?=
 =?utf-8?B?S1FEa1ZPS0xNaHdYK2pEc1RKWGZ4cXVQVFNMZWtEY2FzRjZRQnJudWpWdnNX?=
 =?utf-8?B?cXJyN2JVa1piRTFWNGhLVkNKOGFXYnlFakJVR2c1N25pREhzVVh0djBRKzVx?=
 =?utf-8?B?MzhsbWxsazdOQ0pxbmd5TFptRVRlUmMwTDFXYXRJaS9aQis4UXpXMWtqRmJ4?=
 =?utf-8?B?cXNHcXlvMi95OUYwWlJKcUk0UXdiQlNEbzI2NmlSWld0d0RFaWJ2ZzR1eUVo?=
 =?utf-8?B?U0VKL0Fja0k5bGY2WWE5a2J0aHRyVE02aElJZlRick9WZ1NkenZ2ak0vZUgw?=
 =?utf-8?B?QWlOSTQxSzJseW85ckVxK2xTdHlqQWhlUmtKWmIzU1RDUFJCaFlnbzFZUG45?=
 =?utf-8?Q?10y0//IflPMzGcCuMetPilaNl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2bf18-64c1-4af5-f083-08dde1c08212
X-MS-Exchange-CrossTenant-AuthSource: SA3SPRMB0011.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:11:48.9894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vq5h4yC2zYlGKGCl2aSv6QHJR4w4/uINlhrdkCR1GmnPQzfs/rTHtwXr8VyXy8WBY+Nd/Ixe9DEwsZiw0SEUrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9834
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

On 8/22/25 13:55, Danilo Krummrich wrote:
> On Tue Aug 12, 2025 at 12:00 AM CEST, James Jones wrote:
>> On some chipsets, which block-linear modifiers are
>> supported is format-specific. However, linear
>> modifiers are always be supported. The prior
>> modifier filtering logic was not accounting for
>> the linear case.
>>
>> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
>> Signed-off-by: James Jones <jajones@nvidia.com>
> 
> This issue seems to be present since v5.10, what's the implication of this? I
> assume this has to be backported into stable releases?
> 
> Does the subsequent patch break strictly depend on this fix, or can it go
> separately?

Without this fix, the next patch breaks linear modifier use on 
Blackwell2+. In my testing, that meant fbcon was severely corrupted (In 
a manner that suggests it ends up with a block-linear surface rendered 
to as if it was linear).

Yes, it has to go back to a fair number of stable branches to fix 
similar issues on pre-fermi GPUs, though oddly in my testing 
before/after this patch, fbcon came up fine on my NV50, so the effects 
might not be as severe there for some reason.

Thanks,
-James
