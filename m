Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9E41EF72
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202F46ECF8;
	Fri,  1 Oct 2021 14:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C056ECF8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:26:52 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191DjkO0011106; 
 Fri, 1 Oct 2021 14:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=dZLoyM+JVw1vs4+oeo+pVphLLHDBiye2KDdD/2qhj3Q=;
 b=bF+ChahYtN4PX+br9nx9v1lK9JRtHxd+zzK/peby/STODTt8O22ofNo6Tw0c7sVJkLYe
 U+YQ+nJA91ZtlJGrOsAWVWTKL8sYuCIiDq4Ee/ukU0u3f+zgbcWXWb+p1ezmddY0IJwu
 1ccbQt7YaxN0ZH3g7ssNQiPZtxxm3oqcSQxCifaxoqWae73Yc8yCbP5wb1t3oSU0/Oin
 LRwkEHKSH910wrN7QnETSqpTg0X7ZDdgSAzCRd/NUOZ21SgHImTybt01mSIWt2qPDK1d
 r0FEbRVJ58moZVkFXDhC0LrIFznLUkOuWk0zOMkivhs38LU5dr6QtrTT3vNbjOsJ5m6l 6g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bde3cg6yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 14:26:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191EBLGc138084;
 Fri, 1 Oct 2021 14:26:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 3bd5wcr8nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 14:26:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn5rMMu0A4ujKLE7/1x6Pr+NipK3v6Y1+Ly6pUofvx6PsswyWHpA2+yJjbFqh+2O8gh007y6hNtQaZQC+hIgshqevZr7WfvTk477ku4K+hucls2ha7kitJoMZg5rPtHezdk0vjy+0W5bJ1uCoOM9Pybu1pEienGRsNwcp/suGLs+k/sMDhDzkui6rklQK+7utOpfhV4jr2zp/6ZXHpT7/iic0pxLWCTWpYwV1WU5WW9NZaYUSKZACOuoKGVGCtiy/pLB9wxpPXSHQS00FeAl/l0a/qCp7LHMm2TSr2SwqRKnYDEmgbv35C3yPpPAkSi0daIRbAIJX9Ma7dLz4l4+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZLoyM+JVw1vs4+oeo+pVphLLHDBiye2KDdD/2qhj3Q=;
 b=LeqxBzeB6lYlgVhf57+RPCb/QpW41olSWbmzvATmK+4MT44ks3bJzfzFphAwry3BgIeHRC7veJXvymExc/BC5ZEUuse1tgP4eopy8NJJFJju9Ek1PLYONp6VcY4W7euuf4Fop1AFafs06th+XK0UtoXUPP8OpjTMu4iTPKat6r68GHM8qGAXhnXJuG4iwZqbRnQooJG7lYKmLSQC0zqX3N5kYW2R8E6Cmn2YQnVG2kdn6rNJMqNJyPJ/BUqfzkEQ07i0EwUl9dTcWGlZBTfu6j/OpY+qg4TxofU2NWCZBSO/TeAy8vWGAjn2Qy5elrdj/IlGAEPv1F71Ef+obfNtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZLoyM+JVw1vs4+oeo+pVphLLHDBiye2KDdD/2qhj3Q=;
 b=Rf+o4c+wqE2giNyNN/cnKm9WaVe4eN9HtXvAwqw8zjFgfWnnfyHp1LMg37JnBNmsi5awQMLSw7lDXni3Mm32+JpJ8zC3yPnsDM11AcKvXYcfa8Py42nks+uszSJPCH5OPkQpDkcnOjnIiDE9rrztnhJGWHzXYr5kiN1U0sqa9T4=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1615.namprd10.prod.outlook.com
 (2603:10b6:301:7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 1 Oct
 2021 14:26:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 14:26:38 +0000
Date: Fri, 1 Oct 2021 17:26:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: robdclark@chromium.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm/submit: Move copy_from_user ahead of locking bos
Message-ID: <20211001142628.GA11810@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 14:26:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65eb06ef-3026-4345-dbff-08d984e77b1a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB161592CCEA3D61DA2E784DE18EAB9@MWHPR10MB1615.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cizv07VDKNTmcjVNuv6+eCr009HyC5rg2XurzjgXRfuq2I+kpxc99YdvAJA80UmlkSuTHlND7eJO3zhoohWjwjP6h7C7nt0iqshd8jzyUsxepASrgQggNaETZ//14k/xxFgX/iLW4YcP6Dq5uPeuL5kWQOXkVP6IvWXrr7VtJ2LtHg/b5KLuk5IpkhXnXiK58hDInGBm2TqL65mw70OnVDmDAnZDRtAyrc9IH7IsZNnN7qdj6vgp47kU/5slz0II2P9cH5EEnTVOsH7CnPVgnRRV+WilO3uSe2gKlQG1/4XtNiBzF6eY5Nbx7Ouh7EAMUiR5eP43YAf2w2JPqmiuUjPI5p8ndv2Sth1NmUIxvXMHYZRJXHzvSm5zXYHqW9+PA1vosRtCjIKZoWHg/wl49EgDoNSuXh+Uy83fo3NzaMR+XS425VuIxQSKNbjTbXvI4oty/6+LFNBwqPHe4A1U4S+hssDXgOfS+FwIUj+7v7mD/BL1j+NsUL99a80Pxltx+vFBAvhaamBs0Rxy3K3+CBfdBVvACsLhE2OvgObDbqJadKzxhhF4JiyIJ27vNJkXVk9Fmg2078PVaR4+FN7S5HZTzEyZStJZ3QWDhCUOaBC9Jtip6FLPI3u6/6z0ktkjWgY+IzBLOCkMIBU/f2jxfg6m3u14yB1uDL0EviSzIeCT3aY5L3xZLl91WMbbfuz5vJ2Wj9xTBz1rb1p1WqQuQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(5660300002)(38350700002)(38100700002)(316002)(1076003)(8676002)(52116002)(2906002)(55016002)(9686003)(4326008)(33716001)(6666004)(6496006)(66476007)(66556008)(8936002)(186003)(956004)(33656002)(26005)(6916009)(66946007)(9576002)(44832011)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ewu05iVqsBg6vJz4mhrBGYeo3JAN1cB5VSU2m2SpIc8xAktDn55ze373Vnbn?=
 =?us-ascii?Q?z/hGcmpD9Q5mAhKAt/PgTK/o6iwNEnz42SeLeEY2VpzT3cNbaFKwpuDFuoFa?=
 =?us-ascii?Q?RqIfpTmp0PoMk+GtCHERap85YTVnMW0QSFWzjD8a8h1J4blnFyMItmSvYE1M?=
 =?us-ascii?Q?tSgcG/ykpA8ivWdZbOeYLRW7ZOq55yOswOQ/e4qY0vVUkZITuRMGgUFH9gRP?=
 =?us-ascii?Q?gAo8ggdi78AnwtwhweDzV6zwCQlssQTPSEGO6aWWzqX/gqfD0mz6D0ORSqH1?=
 =?us-ascii?Q?d6Z1Ly1yoQaouGUWTXTtXzqIf5etFhyAXsxQ8WleQj7SU2AoS7AQJKv8xQfS?=
 =?us-ascii?Q?7sWaIPaoo9MW+fYikbTrSXtP1XR09wMuD3dO8B2+bfQL43jo/YIG3FOfH4IY?=
 =?us-ascii?Q?7R+SXrtl/MztSMDiUEc33lfj4uAXN+jdWJGJxyZKRjbK9oHSWRGDr7cbRXu0?=
 =?us-ascii?Q?uBqeUFsBlkcOHpCY77ih/iQz7LfI6w18oKVFjC4pEGhlVoPgnlVwG+nKvqof?=
 =?us-ascii?Q?QIlVayvPkwb1A4pez9dt6wUVAslbJ+i6n4UHarQu806J3RHHQtpBSauQi+0t?=
 =?us-ascii?Q?rQfdh3X+gclBHUm845iwDICcbU1nt5sxPx1AwTHdDTCvQVuQpli8Hdg7mBL8?=
 =?us-ascii?Q?D6Age+RIoM8Ud6JT9Eyqq9VeCzEMbCXrBc5w+lypJ732JEXekaqvT3DYQ5Ia?=
 =?us-ascii?Q?fmMIclysv3zbN66KHlhn2YGk1o1rrlp2asBRAnysv3LEo3WR3Q3KTHbSiJpW?=
 =?us-ascii?Q?bZCjDQKr4KzHJ69oHXOOK7E031quVpce25BeJLqp9kOUivnh6FCTR/X3yiEs?=
 =?us-ascii?Q?KxYgkZ63JrSKiTjyb3IrsDahe9d6RkPGD/W4pDgXQOuWX5+YhVgUp6BBAd56?=
 =?us-ascii?Q?8wiHHEjb3o6KXeruHI6mhgi4SS8aCXWwyD7N6FIEW0HuF8Y/0LZ7baUfmA+R?=
 =?us-ascii?Q?723LmMZ+lzn35izo/JG8OtDAXZ0xyagbqyL2OIsABMD9iDTK8/kYbVrGRChM?=
 =?us-ascii?Q?G7L/7RDEhWiXjzjx4DDvl6CYJNBV6X1jTOnKTSx3fhmPtbhYGKIEkxNxjUzf?=
 =?us-ascii?Q?Qip35jFe65yzwTjM8V24vFbYEhi6fJHu8frCF7ZI8DGBnn/hYnFKwf8K2RHH?=
 =?us-ascii?Q?mbafO3Ov91rkxndHcq8wwEmpkCMFDoKo4jgR4Y7CTxFi62c91pwK34Echzbk?=
 =?us-ascii?Q?eSOfZA0RkLXFTjGdcYqdvTK7h8n03fPLCSfNGkrhNFUIzYbSK7AaIzJv3Fyo?=
 =?us-ascii?Q?e9RFniEgppVgyZxi5CbmA/T9LvOVWxLuAhUeECKtDmHME4cO5B/o6Kicx+76?=
 =?us-ascii?Q?NOT+cbGwRhutbvQxIeZ+aC0Z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eb06ef-3026-4345-dbff-08d984e77b1a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:26:38.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcWbiYqlus09ju89EZLKy+pLdz8z9ScDrj5gIpg7jBWqQwVm/52VE76UtV+IyEvWa66w9b91Xwgg+Fablzcz1ow/GodF7KqHiF4EOixUlNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1615
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010097
X-Proofpoint-GUID: d7vaR3Z-d8Hp7VMVMIBID6_DSPSq7ELx
X-Proofpoint-ORIG-GUID: d7vaR3Z-d8Hp7VMVMIBID6_DSPSq7ELx
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

Hello Rob Clark,

The patch 20224d715a88: "drm/msm/submit: Move copy_from_user ahead of
locking bos" from Oct 23, 2020, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/msm/msm_gem_submit.c:207 submit_lookup_cmds()
	warn: impossible condition '(sz == (~0)) => (0-u32max == u64max)'

drivers/gpu/drm/msm/msm_gem_submit.c
    161 static int submit_lookup_cmds(struct msm_gem_submit *submit,
    162                 struct drm_msm_gem_submit *args, struct drm_file *file)
    163 {
    164         unsigned i, sz;
    165         int ret = 0;
    166 
    167         for (i = 0; i < args->nr_cmds; i++) {
    168                 struct drm_msm_gem_submit_cmd submit_cmd;
    169                 void __user *userptr =
    170                         u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
    171 
    172                 ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
    173                 if (ret) {
    174                         ret = -EFAULT;
    175                         goto out;
    176                 }
    177 
    178                 /* validate input from userspace: */
    179                 switch (submit_cmd.type) {
    180                 case MSM_SUBMIT_CMD_BUF:
    181                 case MSM_SUBMIT_CMD_IB_TARGET_BUF:
    182                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
    183                         break;
    184                 default:
    185                         DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
    186                         return -EINVAL;
    187                 }
    188 
    189                 if (submit_cmd.size % 4) {
    190                         DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
    191                                         submit_cmd.size);
    192                         ret = -EINVAL;
    193                         goto out;
    194                 }
    195 
    196                 submit->cmd[i].type = submit_cmd.type;
    197                 submit->cmd[i].size = submit_cmd.size / 4;
    198                 submit->cmd[i].offset = submit_cmd.submit_offset / 4;
    199                 submit->cmd[i].idx  = submit_cmd.submit_idx;
    200                 submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
    201 
    202                 userptr = u64_to_user_ptr(submit_cmd.relocs);
    203 
    204                 sz = array_size(submit_cmd.nr_relocs,
    205                                 sizeof(struct drm_msm_gem_submit_reloc));
    206                 /* check for overflow: */
--> 207                 if (sz == SIZE_MAX) {

"sz" is u32 (not size_t) so this check is impossible on 64 bit systems.
May as well just remove it and let the kmalloc() fail.  Or use a smaller
limit so that users can't trigger the kmalloc() failure.

    208                         ret = -ENOMEM;
    209                         goto out;
    210                 }
    211                 submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);
    212                 ret = copy_from_user(submit->cmd[i].relocs, userptr, sz);
    213                 if (ret) {
    214                         ret = -EFAULT;
    215                         goto out;
    216                 }
    217         }
    218 
    219 out:
    220         return ret;
    221 }

regards,
dan carpenter
