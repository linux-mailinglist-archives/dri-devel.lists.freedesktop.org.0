Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07C3DA6A9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 16:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ED56E094;
	Thu, 29 Jul 2021 14:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E756E094
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:40:01 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16TEVYvK025970; Thu, 29 Jul 2021 14:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zpiXx3DysweFi9jf1xfSbWlJ/SXCWA40YrU5k2lWrFA=;
 b=zzuIlOUg+PzbAHJqpf63Xg16mgkyGZOn6dNAqhsL+JZWAyxFOnib0PMYBzwB/AtiJMOR
 ji3rDocUKLbg+qpd2BpqOxd5v7w6rQYysnxNbQgTWyQiksGyZYbhhhYE3Rl5VKul43p/
 +dhwsKoAcrME4FyL1OfFmWAQaGNwLWBMjLMjhsEzsWJThVkJJYwihJdN4MiXBbQNLyfi
 zvcLlHVRrITf+dc34h8UWQFmPkJuwThtRIkLn6hsc2nMDBOrDx8xWkesUwfjahMKQgEb
 isn5+w9r9KW2gx64USkENpOoRHskweP1yytDDZGUfqLL8E8YNFnV+G4csW9JLuN1ZP6B eA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=zpiXx3DysweFi9jf1xfSbWlJ/SXCWA40YrU5k2lWrFA=;
 b=yonLqe6XRziig7Sv52ZeAH19ZxJPmnEoPym1HnQqS0BgFhiYSnak+4RhXTgLFzM0Taxg
 fuKezeILeGSBjQSq4ug1lMqxOHxcfvMGlGJC8hsRYzjDv4KUB8yaxFzRSed7gVVxLaFd
 xmvFiUctSPuEYH180OrTYWRElVbWTq6fFXDRI7A6yNDW4z85+MGVMKFNO4cO9je7L5QP
 07/LVHAeU3Bm7VC8SY3YhJjZFW+PqD0CZmxubrEhP2+oybWMlSXRpvhe5T9SxJuRdmo1
 aW13/YYi0SgfiaNGzOe97Af2ePRZm6IpeJMWo6ZCpJ1a6UTEgPcaSwxC6X8GfNu1kaUX wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a3uuj8d7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 14:40:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16TEVcga049343;
 Thu, 29 Jul 2021 14:39:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3020.oracle.com with ESMTP id 3a234cctmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 14:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwX3xPCzDm+Gn7FXiNVK26dk1vrkjsFIyfvvnBBEmTwDVkNuvRlov1JqcuuYhlnvqTrR0Sm1JQMQdumPMCJuv33OPFatsyomcNK/id5KSRnZHnQaTFpZEj4cR5S8HI2/t5GiF8YFggpOqw2DI8jL+CI9OHH++dwrJSAWryUrj6VU8RzESIDzv/fN87p9d5vPGYWS4trhODKwEYA9ys8IkzXKf40K+jJAN2IKQBSE7hTs2fmF8RhS7YgUF8qKZE/dN7GyocFin4vcdpndFC6ao4jhLQj3n4cr2S5deC2/Sj66WPU+rtSDtxeIIMWGp8pdxDdcJyQPoaZ2C+JEh3yrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpiXx3DysweFi9jf1xfSbWlJ/SXCWA40YrU5k2lWrFA=;
 b=Fd7AHsKSwobnfHZDI+2kewCN2SP2lmZzeg6Wcy5+ha/BSWQ2R77W2W6H9sjEHyREsu7ZQzcmRa5WWLDD8axK/CrqF+kQbPGOrv3eio97pCNopeL2H03d32q36VpeaPVzulUmaiyL1fxu/JYvK7TKUvQ6Rrm1UUhVJBYUT1HS4Kcy2uGYtEY/OoJxa/exKTzCzE3r8qWb3dKNzLFuokPWH0wVJWA6HN6tla7nbITTa805PvYiAROiYWKrFq9ngEwuyOEQgUkU/fml/uMOvem8DaUTycf+/KiB8uKN2pDqRYurq6wex68YZKVS/MFH5EIEMugiyGXcykRdC6burK5pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpiXx3DysweFi9jf1xfSbWlJ/SXCWA40YrU5k2lWrFA=;
 b=NcHSubU0IAOKtHgxSzWNh0EAx22QQHHuBc2BlMfUXBpOtH8kG242oG0vTeG6zO9KC+GBP7iptZEq+yaaGd/RFSSA1F4kn6JvB/qJZt+kKOc1lI5PMcQZwF4+LfLiJlpcPr1xk8lAsmaBygkvSMV0K3WH6kz4oVGzoRtZW5AlBBs=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4595.namprd10.prod.outlook.com
 (2603:10b6:303:98::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 14:39:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Thu, 29 Jul 2021
 14:39:56 +0000
Date: Thu, 29 Jul 2021 17:39:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: thellstrom@vmware.com
Subject: [bug report] drm/vmwgfx: Implement an infrastructure for
 read-coherent resources
Message-ID: <20210729143945.GA22949@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::24) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZRAP278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 14:39:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d3a7f35-efab-4b09-e67c-08d9529ebc24
X-MS-TrafficTypeDiagnostic: CO1PR10MB4595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4595A51B649FEE46BA40378F8EEB9@CO1PR10MB4595.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4S3cq6w9CfzzO/Ey2F0XNb4Cm7u5PZRiBzjt1Hi4tn8nCMy9KicGvZIUCCj2XAPIjtfg+nYo+24qXagXSJMjlbudMcp1JwLUn5FY+qV8shmxcSKrtHxP0ralqt8tJxXakFVGOIs6xgpv+8fJGRJbd7xBkXLFmsA0qmNJNn+PmK8c4f7ZNeZNRHydWtjMxaNL0XwYdqoMHl0ulDk7Bkuj3F9VxVoPmbNHn2dlN52kpzFwnlkRuRt42ZTN8+SRXyt48uglYtUYTO3KeA2IZ1fWLaa74gtcmJvuZHKHdmXfVExtWxMnzLiyDWtla77JnfMZWjFPG1NFrPLUvynO5RmoC4kI2ez2aASpTKd5Ba9SKGJVIc4ei29YMwNtlwthGummrRVa1Q7krQBS946cUIs4AD0IfjGZ7vz96Hnn0q7SZKxUrVcbk1+yipa7cGeW2eZnpU6QX6R2IBR7FzOcudm8n53lUkKnDKGzD/NRmBm7zp0nHkLm9JtZ4+W79LUBzIR+AxmVIWG9+OTr25dhunOosKOW1cSSUZebh0c4IRPaUtHeQPRnRsUuP3Re6u7aSdEFeRuTae62ySUw/yv81m8j8v+cSC49BI+zPcwThwhn7ZIdZJAkKzKdC+/d0kOpLoLikChfOS4OVFPIFCiURmaoJ6C/kj1suHQS+sez7b88grWHVlV8+kFKpzmyOFp5FA6WKEuLXODoPNyhhGGXXXf5TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(39860400002)(396003)(346002)(5660300002)(44832011)(66476007)(186003)(66946007)(66556008)(478600001)(2906002)(26005)(33716001)(9686003)(4326008)(6916009)(956004)(55016002)(6496006)(38350700002)(38100700002)(83380400001)(1076003)(6666004)(52116002)(8676002)(8936002)(316002)(9576002)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OhcQLZgjk6aWamsMTgg4P5YmOWJRYCJ1z9oEtFrLYNukSspj0FDgd82L3c9t?=
 =?us-ascii?Q?6rbft8ba53PJB5PuWSNV5f4ApGF1Fw/dpb25IwLweukUjuHpT3OmHU3lfHM8?=
 =?us-ascii?Q?dnz9VgJIotXNZQaENiDqxgR3WsCYVa/2Bg+m+dkaWXUpC4KxQGr0V4VM27r7?=
 =?us-ascii?Q?1qK6fdblSREgUzz7pAGp6Oq1u38HIpoYQJszPfKmuSTn0MEXtTRbIZf06bu+?=
 =?us-ascii?Q?zLdnKI+/yCgsW784YhOey5PjziAtrNoco+6IAcFjFtz8U/wX3/tBzXIGZc4t?=
 =?us-ascii?Q?jhEoxVdepXA/xjzX6COtFlAcpXHx7wt1QYgOmioSU/R/s6bZ0qtN1ekfWIwh?=
 =?us-ascii?Q?4OOD11sQuCkZqrBc3IRsldKJ4rdy5or8RrPUusLSYfGZYHou0j1tBedjA4iH?=
 =?us-ascii?Q?ImPlsNJ8w7XNCf1oqBi1Fq78YF5orwwgn64lz/AJ5uPg4ELuRiJdaMjjg84b?=
 =?us-ascii?Q?aPZ1PKrRGT/Zcqr2aI9WbDPJ2+w5K2/6gofwIx54NhQNomo+IfRDmm1xAwc1?=
 =?us-ascii?Q?TcXwo/Y+GH3w/rLYeSyepzRj/QzeV/Dec+QgRJ0Yn9Kyqz+cSDdbuo1+U1Sx?=
 =?us-ascii?Q?F1Kqtwii0z7HqJfChy+oEs1RjbpffBkyk9XzuUyT6Js2MGBcUOEM1EB+p9i7?=
 =?us-ascii?Q?TP10CwPIiRpSgm1abG25BjIoDB5x6xKIKPGU+PN7ma1BbVXlXaO4tyUnujnN?=
 =?us-ascii?Q?RgkT6PMESl8noQasX0wtv6MVjisma2g4SNZEZQS2bBHmqcP6A+rYLhpiyidV?=
 =?us-ascii?Q?VLbkwlkXBzAQMyELsP1zDHZkURp95ojzoTpw/iAAmg63MGCRQ0noUVNuRmol?=
 =?us-ascii?Q?lbVZElMBzBKEc6M472Jzx/50kPt03Px74p/4CVz1/dBLIPEX3AHdhmI1mziQ?=
 =?us-ascii?Q?cP1uY2vzNvIA1IR4J8UCqwm6x62+MP0rYpWM6C1UQisiZQNOzPjc23sSoZ4v?=
 =?us-ascii?Q?bMrfOmVmylPmPbzErv6ocJxcvNvL2pFHpzUl3EAte9bhDKEBUvFF1LL3MWuS?=
 =?us-ascii?Q?fAEAfEMBfuqu59Uebgm6/ApO+0NuH0XeTbOjJIvmgzyPO0s/xid4lcU7m9WN?=
 =?us-ascii?Q?baY+GNg+zLiZcPqGhTEZF5m99grNniv/XCQeVmB3rkqTMIAwMiGGw1NZFUPR?=
 =?us-ascii?Q?r5yw3temS4jb3Nla/D1nnDmMkEI8RaahWNewP3LyG+sm5stiiV5wr+dbAhlh?=
 =?us-ascii?Q?5bMtUDQSr6V/Bg3MHY5P9DOItL8XrHUd64AWEqjR2cgl6wfytUcGOINMo7hO?=
 =?us-ascii?Q?gn9SJSELlPh0t7NtOn5nMEEkF73h9+TbWL70kP4aAGSZQID3tJtzZgkfJ5CG?=
 =?us-ascii?Q?aObiMKcf8n4l62NSEMg7I25H?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3a7f35-efab-4b09-e67c-08d9529ebc24
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 14:39:56.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeWq1ZFGpHxMTZe0mId/Ctt1mkkku3Gcgt+tuG20RUqtrefxSb3DSOrMSHf03xBFebjUsMPqVGDvDo/6T1lmoQtIv6yDGlRS0XcDloMuTrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=859 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107290091
X-Proofpoint-ORIG-GUID: jDBPRD0UjPOa7zYkyCtVy0aLWqJoqSUM
X-Proofpoint-GUID: jDBPRD0UjPOa7zYkyCtVy0aLWqJoqSUM
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
Cc: Deepak Rawat <drawat@vmware.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas Hellstrom,

The patch fb80edb0d766: "drm/vmwgfx: Implement an infrastructure for
read-coherent resources" from Mar 28, 2019, leads to the following
static checker warning:

	drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c:461 vmw_bo_vm_fault()
	warn: missing conversion: 'page_offset + ((1) << 12)' 'page + byte'

	drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c:534 vmw_bo_vm_huge_fault()
	warn: missing conversion: 'page_offset + ((1) << 12)' 'page + byte'

drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
    435 vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
    436 {
    437 	struct vm_area_struct *vma = vmf->vma;
    438 	struct ttm_buffer_object *bo = (struct ttm_buffer_object *)
    439 	    vma->vm_private_data;
    440 	struct vmw_buffer_object *vbo =
    441 		container_of(bo, struct vmw_buffer_object, base);
    442 	pgoff_t num_prefault;
    443 	pgprot_t prot;
    444 	vm_fault_t ret;
    445 
    446 	ret = ttm_bo_vm_reserve(bo, vmf);
    447 	if (ret)
    448 		return ret;
    449 
    450 	num_prefault = (vma->vm_flags & VM_RAND_READ) ? 1 :
    451 		TTM_BO_VM_NUM_PREFAULT;
    452 
    453 	if (vbo->dirty) {
    454 		pgoff_t allowed_prefault;
    455 		unsigned long page_offset;
    456 
    457 		page_offset = vmf->pgoff -
    458 			drm_vma_node_start(&bo->base.vma_node);
    459 		if (page_offset >= bo->resource->num_pages ||
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
page_offset is in terms of pages

    460 		    vmw_resources_clean(vbo, page_offset,
--> 461 					page_offset + PAGE_SIZE,
                                                ^^^^^^^^^^^^^^^^^^^^^^^
It doesn't make sense to add PAGE_SIZE (which is bytes) to pages.  The
code in vmw_bo_vm_huge_fault() has a similar bug.

    462 					&allowed_prefault)) {
    463 			ret = VM_FAULT_SIGBUS;
    464 			goto out_unlock;
    465 		}
    466 
    467 		num_prefault = min(num_prefault, allowed_prefault);
    468 	}
    469 
    470 	/*
    471 	 * If we don't track dirty using the MKWRITE method, make sure
    472 	 * sure the page protection is write-enabled so we don't get
    473 	 * a lot of unnecessary write faults.
    474 	 */
    475 	if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
    476 		prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
    477 	else
    478 		prot = vm_get_page_prot(vma->vm_flags);
    479 
    480 	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
    481 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
    482 		return ret;
    483 
    484 out_unlock:
    485 	dma_resv_unlock(bo->base.resv);
    486 
    487 	return ret;
    488 }

regards,
dan carpenter
