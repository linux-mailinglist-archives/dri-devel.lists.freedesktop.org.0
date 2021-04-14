Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E679F35F7C3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2856E4AD;
	Wed, 14 Apr 2021 15:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AAD6E4AD;
 Wed, 14 Apr 2021 15:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX6l77CLQGLUDTClyITu2TD49MgankcS2quN2CEYniligodz/LqGoqNTqvIzHGVtDlxZB5JgUif9K2pXb/HmkVLTXbe8E61vLnZfkTMRj5pLJS4oujY748bxT9/nZMdS9j2cKs3xH+p6foAY6FAFJqgZSpMBN5guC8QSu4eiTxZXR8qVSWLfJaiTHeFnThrvXmHUPARUWNyEWleA2VuTnFVTohyU3MrCdDP4ViYm6F+zbs/3dW8BHIQPeUsWy2ad/WRn2QATWF7/gzkSsSUMQAKUj9xVM4rVMzxWYNeZZ/94gZNJq6oNDeNDVIcPzsugy3IgiiYJPrQ9M8tGedwvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjMRS3JkyIMtXvNWBbZ3n/nUHTUsSZOBaPu8XvRc6xU=;
 b=IuW/maFm49Gor1J3Egv/D567zqe3eT2wPYnxOMND/SBfEsAYX0vE0591JZq36wNcmHKv8ok+43OIBJ3Eq+KLarUjMyAQlNdtTDfyTkPK2b2OlX6OIlnmuVhlaBvbu6m3FpOLUNJNgM97YHknBZgzqcgVJaHalrDGdgcgRaWeQGp0I2SvZNbwMTwyCnf/EPI+o7H6903+R90QbgvgCjR/0mR4gDUlDuGNhXPfbpKL39oEVWC2GvZ6/cGgIcVqEZ+4tptpHSRhzVJd6gXdYabEtVBbREyZr3rn+dGtX53790BCRETl8P86xqPYPi6BRV6mL1ZA/9Qj9ti9+HuqbOho3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjMRS3JkyIMtXvNWBbZ3n/nUHTUsSZOBaPu8XvRc6xU=;
 b=zKUi/YCqqiIlxw4zhfmNdcItL6d9rJQTRVV0D2EYz4VztebbJuCumZjYrgOWkOzhkbVhDzOsPA6QbHcAyiSahK4J/WJDmwgyilHW0Do/NlNJ0TybKmD03fQbyjpn/LUVet5tAmRII5p5UiOUn4X4J4SXC1brCePXhbtO4Giq59c=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM6PR12MB2857.namprd12.prod.outlook.com (2603:10b6:5:184::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Wed, 14 Apr 2021 15:38:59 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa%3]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 15:38:59 +0000
Subject: Re: [PATCH 4/4] drm/amdgpu: Remove verify_access shortcut for KFD BOs
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
 <20210407231259.1787-4-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <7fb0d374-47a7-7de2-3348-f155bd60c10f@amd.com>
Date: Wed, 14 Apr 2021 11:38:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210407231259.1787-4-Felix.Kuehling@amd.com>
Content-Language: en-CA
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 15:38:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f154d42e-e6fa-4d2f-bef6-08d8ff5b6bb6
X-MS-TrafficTypeDiagnostic: DM6PR12MB2857:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2857B692B55956F0D6F263ACE64E9@DM6PR12MB2857.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiLAqBgc5lgn00AAvhsEBsggmiYlCHo+8vlvrwMalBaupwfJNX4rC1cyBlmp9a1XTn/AMeAbLITWFTGch1uVxMFP/TezkYJA4GOvOqpXNAU063qHw2OI5QCVG/ZxPnsqA9pTTxY6rZBzMl+Z9Vlj4mrv0RuN6noZxi2955v6usU9M5AFmY6dh0cMnaP7NsLG3OHL/LrwuKhZY/POye1V+gNqdhNoH8kOsVKyBM/24BL4sE6HixUMqHRVfgX7JWktbkydU4TMO7NDV2bNSdIC4b1JnP5FL7hcvJH/AVGUtfY8sEAly3fctlN8wAeFgUpr1bfVLtRQcfEVYcDIDc4q6msrwk9jAbXN58kbRrBA2kPC7eW6RPt5Rmj7N1q8YPBFOhw2DSkQrIouhxcqI16rUCrrAoGd8/RGnDmFaEXjZ+YPQLEqVhB+koyBe1qEHvrPDSGaunEbMhhqHXUSzDxPf2FPXrMpat5GYgBRGv6UjT+TSApWnqSHjooKFTRMT0rpA4JwGBOZs6454MZqtdkobJu04pTw66BPRZGs1ZBeQ7rGLAa5x9Y60qS+TWN9rDp0jrP4Z8XLs+X+xOJS1XJ3F+IFgi/vGVw9HZL0JyI2k+98u4P99uH58vPzEDH8a/c6YdYWrtWIslWathv0W0/EnWacoWtxJTM0WjhpFSlOG4yqPGtASuyOUXyg3Ohxl93j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(4744005)(16526019)(66556008)(8936002)(66946007)(15650500001)(66476007)(186003)(83380400001)(53546011)(316002)(36756003)(26005)(478600001)(38100700002)(16576012)(8676002)(31686004)(6486002)(31696002)(2906002)(5660300002)(956004)(2616005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SExndlZqMDJBSlBHSkdnaXV3MGRoMGdSREFhUFplMUNFc2hDT2lDUnF6bTVw?=
 =?utf-8?B?RXRCRWNQdG8xRjVmTmYrNFljbTdBcUdKZXlucjl6TTVScjNKZXJxVzlTcW83?=
 =?utf-8?B?VlFvMWU2MmtYaTZVcnNUMFhCRGtRM095Tkxmd3gwVVh6amh4NDVjWDhLblBB?=
 =?utf-8?B?QkoxWVp6NG1xWWo3ejVLcDVjdjgwOW5DMGpFdVRTN09uS2FCTUlhaDl4SWVh?=
 =?utf-8?B?anMyMUxTYU9yN2piK2x4ZW5pOGJZVTB0NU0yRVlaM2FwNzR0TTMydEJaNmFC?=
 =?utf-8?B?Nm4zanNpUThxeTBXSjRrQVI1endjZkdXdzh4bm9BekNhSkliNnFGbWlhVGRj?=
 =?utf-8?B?Y29YYi9QbnZ2ZzZUK3hxV3ArVVQ2MUVnSVgvMUJaVVRZRnUwbW9XbWsyRURo?=
 =?utf-8?B?ZjZzdzlaZzdLMWREV1RPOGRWQUR3UXY4VWRlbjVLVHJVVmhzT3B6YWpoV3hP?=
 =?utf-8?B?NlFvc1p5S0gwMEpMa2FmY1o3MTRIQ0JvR1YvcEZyMGM3MXZUVmZMNDRPWkcv?=
 =?utf-8?B?dFJyOThJU1NpUEVmN3RFOXBkUnk1c2kyR0ZCUXFDVUd1WjgyQ0J3d3RPRjUv?=
 =?utf-8?B?N2EzZS9haStkZFF3MkdPZmFMRTFBNnZGR28vVnlCbVJLQ2F3ZWVSc3g4azM2?=
 =?utf-8?B?T3VpTjF1bWtETGZjVTBKVEhjdm1rVll1L3NWMWRySUtYNTc0OTJJR215T3k1?=
 =?utf-8?B?RkQ2VVdtV21NdVhCa3Jqd09xaXlPTDQ4QkdWem9TRU1VZWh4UG95dVdSMC9G?=
 =?utf-8?B?SkZYTHB1bzNMTjdycUtGenEzMkFLY0xDRWgyNUZvOUp3akxteW84dGFVQjg4?=
 =?utf-8?B?dUQrN1Y3RHArT2FYWE5DUVl2TC9yenh1THVOMFd6ajUyUW1vZHF3N3VvaytE?=
 =?utf-8?B?Zm9pVGs1a0VZQU5NMWoway9pOFhqdGkrWE13NkhxMXpFNkdZc1YvMDRBNjc1?=
 =?utf-8?B?SVZia1hEM2FyNnlmVTg1c0R3NWllMWtpTmhaaEpMR3JBRmROV25KbEVjb3JP?=
 =?utf-8?B?dzh0WnFvc3hWODhXc3YvVHZYNFVqZG9YSDROaDVKVHRmT1cwbkJEOU5iUVE4?=
 =?utf-8?B?Q0plVkw5Wk1ETHI3Q3NlN2Z6eXFKRmdQcmY2cEt5UWh6eTR0aDcxV3VIUmlm?=
 =?utf-8?B?NVd4UmpZR1FIeWZQRk1RcEhkc2U0S0gxNzhoY0I3Y0JhcE1JZXNDcmRNNDVB?=
 =?utf-8?B?WHhXZlJEdmFTUFU4K0hSSDNXdW5VMHc1Q3Z0WCtrTEp2b0UzUjdBUWRGalcr?=
 =?utf-8?B?cGlhS0hSSFdjaFFMZVRwYTFDZjcyRmhYUUN5cFZES3REV3dmbS9LeXcrWDk5?=
 =?utf-8?B?MG9tbE8yNUdjcWtoUDNncjJyZHRRQ3NvNml1ZGxNTnA4NVQwOHMwY0lFMHR6?=
 =?utf-8?B?ZTBMQTNZcG5nSGI1KzdxaWdYZDJ1MTZOTnQvOW85WktFWkI1NmU1ZlZFRjJa?=
 =?utf-8?B?K0pZWW9hWXhMUDJGWHlFK1VpQkFVOWhNc1JieGdyd3o3bUFRNVM2ZTlscldk?=
 =?utf-8?B?WERjcStrTUN3SDE3K2RWSkxldWtCdGlLQXNKTlo1VjJ4RWpyNlFhTVBhbjNp?=
 =?utf-8?B?dGVsUzJWWk1PaHBCcUdZM3o4d0ZkV1A5bjZjN1pNc3h0dW9GUmZ6UzRSdUNr?=
 =?utf-8?B?eXBVWDRIdmErVUtSRC84dGxhSWZpMEFQa0M1bU9PQkduVVF5Rkc3SkZ5WWNP?=
 =?utf-8?B?LzQ4Q2FmV2NuYUVoT3F2c3h4cm1RNzJobWdKNEQvSU4xL04zZlJFbkVoeWhS?=
 =?utf-8?Q?/ZhMJRzMS2ggnxxYFWdR2LLU0EImAFCldoueRig?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f154d42e-e6fa-4d2f-bef6-08d8ff5b6bb6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:38:59.0518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYZ41qHWSkgizv7Kn/jT6CFz9wIO/fkHddAHgoLnsCRdm6/3TbQ4sC9qWl6rcXsA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2857
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
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: multipart/mixed; boundary="===============0943408671=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0943408671==
Content-Type: text/html; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-04-07 7:12 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210407231259.1787-4-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">This shortcut is no longer needed with access managed progerly by KFD.</pre>
    </blockquote>
    Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a>
    <blockquote type="cite" cite="mid:20210407231259.1787-4-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 936b3cfdde55..4947dfe9aa70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -165,13 +165,6 @@ static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 {
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
 
-	/*
-	 * Don't verify access for KFD BOs. They don't have a GEM
-	 * object associated with them.
-	 */
-	if (abo-&gt;kfd_bo)
-		return 0;
-
 	if (amdgpu_ttm_tt_get_usermm(bo-&gt;ttm))
 		return -EPERM;
 	return drm_vma_node_verify_access(&amp;abo-&gt;tbo.base.vma_node,
</pre>
    </blockquote>
  </body>
</html>

--===============0943408671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0943408671==--
