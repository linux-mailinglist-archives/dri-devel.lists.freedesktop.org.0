Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21094C6904
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E876310E395;
	Mon, 28 Feb 2022 10:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2041.outbound.protection.outlook.com [40.107.96.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0630510E35E;
 Mon, 28 Feb 2022 10:55:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaGI/B5eUJJC8BQuSqrEUEqniL6MG2404leqzYkuitUd0pAn4buqBksmanXMFGjwFVjcN3BzNE1Cf84hAG+nmlD3fcWa8/gm1/TWFFb1pjwqkK1JcH7UDJWyDgGi70BYaXz4g3xawu8tjZcTjpLwRO3TW6L3tzmMg+ycrMb0Nu9UFAG3+KeTBWUvDBpeM7adk2YRFhA7R6kkw0obfpRBsC83V1GQNKryGuo1q0GUV+9TJFmpmUr4aCtNCRFk/dnXG3I8kPGV+QuJK0+eUQ9G4Do7iA/H9P9OQgXR+h8ypERAKFAgWS7pga2UQcKwIc+hnCJzMT9/Ub3PEYVG2jPb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBLTjUcGvsWQrir4hxk9/F84FqWFfT8saPJEfggKr1Y=;
 b=jvL5Xf3oNs+bUI0G9b1IEej85qH9u+2CYc2Ebg/1CQzcDHlTxEbkqBx8A2icV5tx5Xw829+WC2FGYHracACv+mHQzOUm+UWxRIM2lJRMSwW+VGOr52vG8d/5dRBP92g+q6JgbrY43tuVyDCyXEhc8mDm+vGWmosqfk6HdRZst5lXtwxyZali/PbyjAyEKPtYtgYK75pvgc/Bn7REWZqXK3y9BGJDZYVo+v1U0G7x3G9X2diIT5bO03Se3Ih6qFOSj0t0nX2MGg7uoe7WixZNrxret62PrQRDpI5wWGpTPCFLefoRV92+s9gaZBR8zn0NT2s4bXM3j8EdtMpDQtTbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBLTjUcGvsWQrir4hxk9/F84FqWFfT8saPJEfggKr1Y=;
 b=BgmlaytHt/AdUV1i5w23si39UFK4r7+MuCbP3TP/cHpx4nXqJdhtdPrWWOqbyLviJAmgTqSvlXpmaCy8zaDqawTyrqNCh7nXNOcyRvE4thHBW2uVbmlnXQDpUqPCmE7vGMzw6M8f9ryb7x7eHUcz1iZ9pEHTir+ewxiIqhGnGvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2508.namprd12.prod.outlook.com (2603:10b6:907:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 10:55:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 10:55:45 +0000
Message-ID: <58ae0ccc-e964-69a3-b40b-3262fd24af9b@amd.com>
Date: Mon, 28 Feb 2022 11:55:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/amdgpu: Fix realloc of ptr
Content-Language: en-US
To: trix@redhat.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, lijo.lazar@amd.com, nirmoy.das@amd.com,
 kevin1.wang@amd.com, tom.stdenis@amd.com, evan.quan@amd.com,
 Amaranath.Somalapuram@amd.com
References: <20220227153342.79546-1-trix@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220227153342.79546-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::45) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f0403b-31e2-46e7-7830-08d9faa8deff
X-MS-TrafficTypeDiagnostic: MW2PR12MB2508:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-Microsoft-Antispam-PRVS: <MW2PR12MB2508655389F885BC9FA6214C83019@MW2PR12MB2508.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7FaMSpI/F2VJ1tJGPOWCLAZmtvE9bvu2u1atORSjePyCrzw05icfDOh+ih5fBQokXtxtVbJJz15HR3jKhFWRuLdSw7AwgVl9JklEHv26EWQkiqd9aw3o/MvWs/AH3XoeGB+WDVIi0DToxtlZYSWwMBQKgfoog2ZiMOEr6WlIk2WGNqE6JPxn7dBLpzSwM2V/CjTBymFc1nWVbdKHq4uVAicuGASEQZlf0OdDOCMrzIolq8w6EUko6gUkYmFpRiHqdVKV/e6vENnWqp3xGZRKq1P8RDNaGxwMBDAS2whauxZgJNnlGdGZiuS4VbXIcCqqTF5bZ7dpQt8d0TYZtYbnS78scTyWaL9Fnf1/s1MaGTbDURnpNO6v/xVqNXX6vlE5DVGMLdoq6yIKc8VANejE5rD/2car7rLTaB3x824yWxw+ABeiK6/BH30yG9T7fnnvL0doNfla6WBSQ4vVUuy8i922YQbv5BpC2aPOzb/ErOEZzLwDRl+xZ2+5GM17cAcY/1M7PRNdRXKdlv4yrG8hU+EjrMOnozcDmJsiK8v56fj7WGiW7U2saOHMrgPsnF9XtuOAob9ymDIgZvdfiARxo5RphLknkUXPfXgyN+fpq7zcE5zxBH9cTXTgW0rW3alrSAtQ9Zsi1JvitncgUTInC/XTWw3N7G6aa3HfTWjNV5QPKJPKVgs/LVN9WuY2bKj509MBvy3f2PtkqMabjDBxiJYMn/Wx/yAs/X7YsjDXQrDul+wzVWYsflseCAp2GSfOADCla9fbwv+VKy7mnEn9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(921005)(6486002)(6666004)(38100700002)(6506007)(66574015)(36756003)(6512007)(6636002)(31686004)(508600001)(83380400001)(4326008)(31696002)(8936002)(316002)(86362001)(2616005)(5660300002)(2906002)(186003)(66476007)(66946007)(66556008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpQWDNwWUhYTzRXQ25VbGNiOW1mK0M0SjNGMEtkQ1QxazlZZ2ZzK0Z2NlFl?=
 =?utf-8?B?SlJ3OFQ1cWlLTW1Vb3NzaG1TQWEyZkd5MmpwQnVLY3ZjWlJkVXJYdmhRcktw?=
 =?utf-8?B?MUlvSVFrOEtSY01lUFVDeE1oaUJZOFBJMUIydU1wV2NTLzJTK0diRzVCWS9z?=
 =?utf-8?B?SEFvNHFZYllUV3ZDOUl5ZkhWZlRXalhqVU8wY1FOYnVFTXA0QWdoT1kvQ1c3?=
 =?utf-8?B?UEFnQWh0em5iU3VQUGFFQmk5VGFweXo2RGpMdmFHY0xyVG5XcHR1NnI4Q1dj?=
 =?utf-8?B?cnZqeHpVVVAybVFCYWVTWW02K1VtNU5DK2Z6UzFySVRxUWxTMitUdXRmeUIw?=
 =?utf-8?B?T0k0czJRN3RZbml5U0FTaUIyZkpkbEhIUHo4TkUyL1N5NWVubURTSTR0Y1pR?=
 =?utf-8?B?Q1JrRUEyd3ZVQlBLMW9xMUhDcTNTaXdyTmRBTzkxeHVDMDUvSml1WWVNSDdI?=
 =?utf-8?B?Y2hZNlJWRlhnRUZsK3FLeGNtSXlaTm9ZanVoczhRSHZVY0t6clI1RnVEZW4w?=
 =?utf-8?B?bnVsWDl0VEZDNWYrSmN6S1hNRXEzODBCZ3NITkRzMXRkbXpkMkw0WC9qT0k2?=
 =?utf-8?B?Vm8wbUJrNVJUQ2VUUlJGWkV3eHZ5ajBiL0hWdmd4QjVQS3dxOUJ5LzhRVG1k?=
 =?utf-8?B?T3ZqRGc1UUJjVk9vQjE5SnRIc3VoNWlPQVBXMmFwelM4VVFpazBPNitmdWV6?=
 =?utf-8?B?VTZpaXZSY3lQcVRyUlZ4WVV2aGIrQmpqWkNzNHNZUzJ0MzlvL09aSVcvWkNY?=
 =?utf-8?B?QUQzcUZwTDViR0llQWg5bU1Xc2JocmM0VkpwQTBxd09YdWNxTVVNcUlQUU5t?=
 =?utf-8?B?a3B2RjU0QUZWZTFGdGoxNVFyNmZscWtiTkZZRzVzVGRka2JwNTVwT0FKUmhn?=
 =?utf-8?B?d1hacTJkVW9GMllsN2MrbVBBL0x2UmFMeERjOVlwUlhBN1VnNERWT2NaRnI5?=
 =?utf-8?B?STcrK3czamE0SCs5QVVNd1NXRlJxeVZ2SjBwVGlMOW1jOEtVc2xyTkxpSWZq?=
 =?utf-8?B?RzdSeVlYdHVQUTE3aU9xTzBhZDdwU3lZZ2tHMCtpSnNiTzV3LzhkMUFGeFVk?=
 =?utf-8?B?YzdJMUFHYmtxS2psY2g0ZUxER0RmWE05MW5ySkViZ0d4YWpiOFRoL25SUmUx?=
 =?utf-8?B?ZS9ETVY5c2NmUVdUd1IwdkNZQTRvRC9acnFWbFNaYklINHpqVnhBWUR1eXM0?=
 =?utf-8?B?cjJPSWZEZ3RTSXBoZnl4OGZyMjNhTE5DQkU3ZUx0S21zRFJWTGxmYXIzZGhw?=
 =?utf-8?B?N2svbVBSRE5NZE14dFd4THJNQmZadGNhSkt2aDZlZFFCNjRhZDhuYlpsTSs0?=
 =?utf-8?B?MUM5Z1pMbVBvcHdhTXVid3RsTzV4SkxjeWVWMXRETXJWN3oxRFltcGcxeGMw?=
 =?utf-8?B?V1doNDh3ZVhlOW5TTHh3WHNjampLRXZHVFdPbDZaRFpoREd4NnoxTkJzWHVv?=
 =?utf-8?B?SHR4NmJNWUpYWHNwcHBpVzExTitKQlRORURvLy9rQllxaFdteW9CZnBOTGxC?=
 =?utf-8?B?eXVpSnJoYUZCKzc0T0xZNjkzYmtCaGorZG9xZEVsUndrVXA2VWZpR2xvamxn?=
 =?utf-8?B?VE9YdWtDeUNhVUwrY3FuOVlibGtaYW8xNzlVTzl0VEJ0MEQwV2d1TmdPQjBh?=
 =?utf-8?B?RzIzZWpwaGNjMkJEYytHU2V1T0Zkd282Y0tXbEhPVFgyeHNKNGp5WEJoL2VB?=
 =?utf-8?B?UEJFU0o3YzAvdkg1cWZQcFhJeVU4d1dlakZqdUxONG4ycithNEFUSkcydFVN?=
 =?utf-8?B?TzhXUU82SEdHbS9OMCtUblI1RVM0aTU1R3J4SzVaNWpoOVUvOGxTcVo3SHl5?=
 =?utf-8?B?WVdHYWFxRnN3VUxrSVVCWVpXWmZVNE8zWmhHUmJsb2E3VUxOMmZ6My9xQkIw?=
 =?utf-8?B?dFJQTE1sdmhTam94Mmp4V29qdXRJRkNtSWRUaFEyeDdXOWhnQU9sMGtzWlcx?=
 =?utf-8?B?SmlTSnNxWjFOWmpZTnlIZUk0d2N0ZnQrUXV3ZnREVHo5cXFzOXhCSjhKbWd6?=
 =?utf-8?B?a0xONzRQU0tGeGdlYlBrN0V6UkwwZFVvRWxxa28zaUd5TDAvT1padUFDSHVP?=
 =?utf-8?B?cUZVTllXTnlhcWxGc05SQk5JMGZYTkt5bC9IMmlWTG9TRThyRHlVSUhTZmtn?=
 =?utf-8?B?cjlQOHVLZEVOMDdzVWFhTmdmMG9uUHFKRHpaRzY3SDN5OEJLWlJLa2ZFWnFs?=
 =?utf-8?Q?2kWkeGlnUMyQZ5RDze9QIWA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f0403b-31e2-46e7-7830-08d9faa8deff
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:55:45.4088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXl0fE1fVcT4RFdAaDqBqHlAfgZuAK5iodxDitHZB0VWe0AYFl9nkp8SWr3JxuLz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2508
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.02.22 um 16:33 schrieb trix@redhat.com:
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this error
> amdgpu_debugfs.c:1690:9: warning: 1st function call
>    argument is an uninitialized value
>    tmp = krealloc_array(tmp, i + 1,
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> realloc uses tmp, so tmp can not be garbage.
> And the return needs to be checked.
>
> Fixes: 5ce5a584cb82 ("drm/amdgpu: add debugfs for reset registers list")
> Signed-off-by: Tom Rix <trix@redhat.com>

Yeah, stuff I missed because of the long review. I was already wondering 
what semantics krealloc_array is following for freeing up the pointer on 
error.

Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.

> ---
> v2:
>    use 'new' to hold/check the ralloc return
>    fix commit log mistake on ralloc freeing to using input ptr
>    
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 9eb9b440bd438..2f4f8c5618d81 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1676,7 +1676,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
>   	char reg_offset[11];
> -	uint32_t *tmp;
> +	uint32_t *new, *tmp = NULL;
>   	int ret, i = 0, len = 0;
>   
>   	do {
> @@ -1687,7 +1687,12 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>   			goto error_free;
>   		}
>   
> -		tmp = krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
> +		new = krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
> +		if (!new) {
> +			ret = -ENOMEM;
> +			goto error_free;
> +		}
> +		tmp = new;
>   		if (sscanf(reg_offset, "%X %n", &tmp[i], &ret) != 1) {
>   			ret = -EINVAL;
>   			goto error_free;

