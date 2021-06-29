Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D63B7180
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F89C6E875;
	Tue, 29 Jun 2021 11:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A106E875;
 Tue, 29 Jun 2021 11:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqgGSxGhrIijat1460dh8KAUtPDn/uSf4O/syIP1jQF7iZingjkBjyVuIzfvAJQPU48kG90OJYprL2Ona1/nKEu7IH9WDweV3y9GR1wNDiF69y1fT5jX5qLmdr2SAhTjD0E4wOnFZGkn8KFw36fodaYz9CS4B1bQx0y6PwkO33nG/B0X3y4w9eedB6idov+nIT5Qrw9UnmmYfiKZAvx8VAx07WEP+lrPmfP81OBKhjX8vzN7cEIv8SgD86IE+M79nCH+YklUGeztkoFCArPEaqPrWsPyJHjzNJEs8GJQdz4Lgvsk5joFN2+AL/X/O/eTtHv5UFyOGdZjCk2qDAu3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxeB7yNopjKbuUaO/NOfqBYFLLOOZyWt3Yj0YZOR/iw=;
 b=aTaIwFYf1IlU4/Nr3kbfDJlfabjzeZbcMwVxyiEn5QMBI8ppTlSVIYmG/68LUJNYtlbZpeaM6jvc+FjGgVTJXJB1NPXzN5D9f89IR3srsfYFJr4YFgaiA0tndVyKrWFbLUZYf3O/Mw4vdTiWYes71l9QB8+V0cowRP+BTkhBwuJAYYnsR8jSGHAaPjtfixLh7h8WfQFF++mFs0KX0ok7rQDTx9EJznGf0Wvg1Bxi0T/b3iZs3ytSqhcavEE08CQ8wG3fzR/+WqSxLijYd+0n38tG7uNT1LjanaRn6RgY+ug9p1afSfkf73hI+eSKyjw3lM1EwLgaWgfjAtkn9ugLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxeB7yNopjKbuUaO/NOfqBYFLLOOZyWt3Yj0YZOR/iw=;
 b=mKN+lRbmxdU6DiwhAdHAPw+vO1ydExi5aghqAbYP7NMsobVsgVSjd4rnKNOvHqQb5BBgO8L3dp2h/7YQnNFi4iXy70VfBud9rZUwAPto2jQ+T4g/GrPCjQeUjz5F2IbpuYgpZg+YjCs73xVsOUKPU6jiUOF7egXXNw6Ng8gNCW0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5072.namprd12.prod.outlook.com (2603:10b6:5:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 29 Jun
 2021 11:44:32 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:44:32 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/amdgpu: return early for non-TTM_PL_TT type BOs
Date: Tue, 29 Jun 2021 13:44:13 +0200
Message-Id: <20210629114413.3371-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [217.86.118.245]
X-ClientProxiedBy: PR2PR09CA0012.eurprd09.prod.outlook.com
 (2603:10a6:101:16::24) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.118.245) by
 PR2PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:101:16::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 11:44:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 039dc96f-fa2a-4828-74c5-08d93af34284
X-MS-TrafficTypeDiagnostic: DM4PR12MB5072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB50728B0F95E4DEBF3C52975D8B029@DM4PR12MB5072.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAeNp9JLtoOHDHjfEtrm02WC/bJS/1ukfyBHuMj7FN54yFTo1BGSBx0AgZ1BdGVsmo70HgSkpLfw/OMA458a+etmORIhGbzEG1I+0N1pF97neFB7/lNkEXjpe3OCzD1lPJ8gAoHC7usdg8oKfcBwwKMHKUVUHKuz7vT7q8Htjht9XO+Gp9WpmTKJzzCP69gG3VtE1EFCqcaUkcWrgBBzG/Oixoa9OVACFKfnnw8eDpR5zFnHuIAp0r/jwvHBFdzHto82YRWhmxWyfv3iaV1l0akp5bmieDYeLSpLfHDyltst2SctVPfbY64Ukajw7UHMpeP4AbsuobK4531k7m914dBfhDPyRw/yKZb82iw6jnK4FldJn+4EAZr7XSWlz7QNyz16CxeXke85KoZEIjPFxqRU/J37KD37yCAX1ATHVDd7eUita7FFmmnlMv9WarNfty6GdPoNwxO/djWXUhUGHg6fHvQTHkyVK9IfhhtV0dXK/UrqKgk50/rXgXChym6wp+vW1MtGmqbFlJboXBNTPtmo9hAT2v2cxemzdQf1OnEjoWmxxMga1VvlOwGJIPcJhiuWLJZBkN5zXffa+W+7HmG+qe+c+Rv/EM9OKSBGEc7uG641tqBzB3KGVW1KW22WYLE/0oFAZJOL0WYEM4xRBRYNgWldb5y665YeVryJCdGA3EhydkOSruzCkkyW3YrBb+UVkCUUtx6/V58vceaP2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(6916009)(186003)(38350700002)(38100700002)(1076003)(16526019)(2616005)(86362001)(6666004)(478600001)(26005)(6512007)(5660300002)(956004)(6486002)(6506007)(4326008)(8676002)(316002)(2906002)(4744005)(44832011)(66574015)(450100002)(66476007)(66946007)(36756003)(52116002)(83380400001)(66556008)(54906003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmV5dkZkMnEvMVRJcEwyRXU5SzA5MWsyNWFpU0RUM01iWTF4T1FUT3RqOHpw?=
 =?utf-8?B?ZUhSVk5zanFJaVBDOUdUYWptL0hBRGNFVzFRYUF2eUU3NHQvOHlaTndHYWl6?=
 =?utf-8?B?N1RQdGI4TWcvUk5GR3FOWE1kQ3FPVHk4RzJ3SUVJWnU1U2VrZ1VXbFpmUHVJ?=
 =?utf-8?B?dnkwb2lIUWt1dlhkZGllbGNQZ2VKSWQ3Q2ZsNUFpZXQ1c1J0S2JjTGtqMnor?=
 =?utf-8?B?OG1NMzVBNzY5WTBGUHBTUHB2dmxaWmF3NVVXTXA2SGx2Qk1qSW5rakFVODVy?=
 =?utf-8?B?UWdDUFFFTUVaRTJmKzRGK3M0L1Ricm9hRVhPNmFaem1Xa01rTlQxZ1Y3YjJH?=
 =?utf-8?B?SmlBMHkyK3BwK21KK0Jaa1JDYVdBeFlPK1VSUnczalhnaENmdDAzZFlHSWtu?=
 =?utf-8?B?Mk10a2s3dFB1NXdGYjVDUUlzdVlZRjd4ZTlSMWRVZ1NIZG5QL0tFNEdseDJr?=
 =?utf-8?B?dG0rTmRWZDZNV3lDbWtHZzFyYUdlSHNyRzBtQUxSQXdEOU9FdmdwSE5hOVFO?=
 =?utf-8?B?ZURzSDNqUjlUYUVCMkVOY0VLZVR5WVN6VW5rMUEyT1NXSXBPMkFrSHF4QVNP?=
 =?utf-8?B?WmJxLzJqdHVsZklOSVZEdFE1R0tDVGtPNDJnNFNDaldtdExpTG1OVkoxeWxH?=
 =?utf-8?B?OTRaK3pKV2p1V2tVczBwTjZldUlIWTc2ZktPOS90SEZwcUxPQm5GSDA2b2dU?=
 =?utf-8?B?WTNCMUhwREZVcXhFVW5uYVdsSkYvbjZxMnFxL256eTVVYkVPRXRHM1BaYWt6?=
 =?utf-8?B?cVdUendYUndVOStTOU50U1N4enV5L2hkTit1Y1RWN2tHaHhtTnFzZEVpS1Nw?=
 =?utf-8?B?cUVZblhFVUdHVHk1bGlDM2FiT0V0VHJGTWVmSDIwLzNrVVo2cUUvS0MwOUpN?=
 =?utf-8?B?bU5RYnc5WG0zZTlOWHNOcDdRcHlnRVEra1BtMDRXamN0SHdDTk1GdThhSjBk?=
 =?utf-8?B?NmlYMjFFaStaSk5vYUQzZXNKZktFdmliNlNrUjRmUnAzQldQSURrYlpvcS9n?=
 =?utf-8?B?YUFvblBQMUsrNkUrVjJUTUJNdnhBWGVZdC9qWFhYbDJ0YWRXdXlsdDZ2Y3RN?=
 =?utf-8?B?S1FiV3gvWVRrQjZzcUUyZHJFZGtGNWFTMnBXcnNDZFFIV0NQZGttKzJiaXR4?=
 =?utf-8?B?WVBpajllay9QcVRhMGltMGJtOXVpeGJKa0xmL0FBRk5JcmxMeWk0UkM1K21z?=
 =?utf-8?B?djJLNW41bjd1Zlo2TWZUMmoxOHB5a01UZ1JibWdTL0RXdTIxTWxmQlBFaisw?=
 =?utf-8?B?NlpRZ0NHMGFtb2paTG11TlhZYU1yMlhob0hxY0x6SklEelR4MkYybkd1R2tR?=
 =?utf-8?B?eXl3V2NZUVZKb0VTK0NOcTdIckxXbGFWSWkxVnhGNWtiQjJDVDlzc3lRb1c2?=
 =?utf-8?B?Y1krS0Y4bVhVcDhSQnl0VG1YeE1pVmhCc2Nnbmw1M1QxMU5lVFVLN3laY000?=
 =?utf-8?B?cTBDOTMvamdzOGI2Qko1WDJRM2JLZnFiSENwT25tajNYb0hsY3o1SnVtMDlE?=
 =?utf-8?B?SDJGVHNqTGhvWTh1UjE0THVrWDBVcjJvY3Q5c21MMzVwZ29EeXpGTGp4dXhx?=
 =?utf-8?B?U2swVE1wYnZheXhvOStwMmVJWUJyanR3YndPNklBcTh3Y2hPVWRzSjNYM1hn?=
 =?utf-8?B?OWpGVXJxWnBlcDFTUTlNd0Y0UWtGYWhKVHZWbGFqRU1KYk5EbWJ3ZjBzdlNK?=
 =?utf-8?B?eklNR2h5RGFsc3R1YjBTem9hczYxamljNTFFbmkrVlVMamhHYzZUTHdaQzVo?=
 =?utf-8?Q?5TSP0h/ID7SZobYTQ2fpFBf7ub7hEMak7+KYYB6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039dc96f-fa2a-4828-74c5-08d93af34284
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:44:31.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Kzc7TyIX0zWKSzG1bVNSoA3X7kPJSTkU1QPeAATIk1XghkxvDibpYhGv80ts6OwAogiOAyDm+yQ/CV5HqyZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5072
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
Cc: Felix.Kuehling@amd.com, Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return early for non-TTM_PL_TT BOs so that we don't pass
wrong pointer to amdgpu_gtt_mgr_has_gart_addr() which assumes
ttm_resource argument to be TTM_PL_TT type BO's.

v3: remove extra braces.
v2: merge if-conditions.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b46726e47bce..7a82e7b9e18e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -926,7 +926,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	    bo_mem->mem_type == AMDGPU_PL_OA)
 		return -EINVAL;

-	if (!amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
+	if (bo_mem->mem_type != TTM_PL_TT ||
+	    !amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
 		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
 		return 0;
 	}
--
2.32.0

