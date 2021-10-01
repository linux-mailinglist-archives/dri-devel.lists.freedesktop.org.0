Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8577A41ED6F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679A16E49D;
	Fri,  1 Oct 2021 12:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFCC6E49D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 12:28:55 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191BjSrS017596; 
 Fri, 1 Oct 2021 12:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=igN8SXzG9ba7Nt7FkmJADj2SibcgrofPjsVyRUOC9IU=;
 b=zT7WJgIwd7l/Eny5mNT280aw4lXmD5qLvrdw7dN7XhZ7MRtmRqBLQxpjf9EI5XrtG+zx
 34HuWfRW0kWzazwzFs7/Ly8tgs30BB0QI178YuKcfG8NJWTWkcHDWlWmVbYwI8jZzVok
 9rbxxUYuFVVo6LLIAyQ/09GHY8tCyxhh8LQNYmydSlXDmcQmZ1Mg1bvsT/IVB0P5ZuSa
 2CYLOy22qFgAg5ZGLS6tGjzscA+pPLDnDXfxJF4gHUK7ZQGyVIsZskPzixMviuAw26IZ
 GqlsdEGyCeC/3jGCWZw/jj/wURxTwFELBrYShN7bRG7ZCDOIbK6PQdDnHoL4LVoDJ+MC Ng== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdevve68h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:28:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CKXkM153908;
 Fri, 1 Oct 2021 12:28:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 3bc3bp4cbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAs46OWmAZHSOl/STlzi5mRwmkTtankfud4W+qLR+XL/FIvg9i5hXCWRtK0l79AawxXv2QFBNCtSvPE4EdkvovxJ8QM//xi9rbGA+chdNpSx3WzHllLrz7PZnBE01IiYroCkANyElhpZKd0BS+iNehuHdAkaO/Jc9L7WcVloZDwMNcU7AYdzxrPYvtjr24+LTbh9ThTgMTKD9SDobc5C9T8QkTRzptpCv9HbAeUoYFWVj+83OqrNLFv6H1tcTY4OJVl///q3imkdEOntzaosyDUiMVwLxN6SX4uNFk1n+NEARtWYCJyT/YCcPUx3Cg1PBcucqKaYugPh0sxnCbUNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igN8SXzG9ba7Nt7FkmJADj2SibcgrofPjsVyRUOC9IU=;
 b=f+AwZCxqoMAWeoOu3X3ZASPyVtLIRUv1tEetRsscSK8K9pXWhI4xVP8tZG4B+7x1zL3Mj6qxHubPSzthtqPjv6+PlIuxIq4VNx7bB6PTQkJVgM/HVG/WlkYTXOSDQq8RrnHzdcr12IyfNvnHmlNzHwuyO2F8BAo75rvlGgUArxqI6dVdtgtV/mTeCMaxCiTEp5C0cmnPMNA57lqyQjCmuVwB/Eq8MBF4OzjZlylgoegDfCpqnX8xqiyeL8eq9DUWrIz9Y5o3wHQrqbe8RNj1PODwH5GocHds7/xmaGg/AD6asPFk7dw0L+ohLQj+sUdXnDTJUQdmi3hK5uPNgCBpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igN8SXzG9ba7Nt7FkmJADj2SibcgrofPjsVyRUOC9IU=;
 b=vyFQTKqgIRc2S0Vdk45IPYVn18BK4UcOocFyJYpJ8V4tCNx9i6NkQmkRv+lrvMv1k32HlwF7MGJWZhhd49SHj+EQYCLi1KBRfs4BCC0O2jhhkPFx40shgIUOiKsgR0O2nKBa/PPjy8w/2P0rfQ5WFzGDpPZB5vXO9FSeoXBa6cU=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5425.namprd10.prod.outlook.com
 (2603:10b6:5:35f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 12:28:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:28:48 +0000
Date: Fri, 1 Oct 2021 15:28:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jsanka@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm: Add SDM845 DPU support
Message-ID: <20211001122838.GD2283@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 12:28:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a539d29e-5625-4f57-aec5-08d984d704c9
X-MS-TrafficTypeDiagnostic: CO6PR10MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54257DBD5983E8C5DE843F4F8EAB9@CO6PR10MB5425.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OdMaPPw4jxd4ryHe/0UFi3bThISridEZQNjD90RBAHdOW/QLKUFqO+L67GeN+IzJ+DtKzE55UsppBamRbGn2g42K2tP2NvzxVZ+RbdD6QcoZwmeDx5+TNS33vuSrEWtMwRwiZ1DABDHq6FeIL/fqbIFr9WkJvXNSvS0nyA9hKxqPA8/1bgzzDPRN7cOeYVXjEXMk3N7WVjdFrHSbLjRE0eJ9EQxqjfj5BN5cD070WtiBOHSB7Kdp5LZ9xUxM18sa8wwvPEHEwTBxhGGYh8jFREGIFeCXRnBkYxKA5eKbuVtPFj5DVCWkcXVaripDsgmO95CUhKBtPMDL78VjZ3y+JJonygsethm27jvb9SdLnk/wrgVV951dOhOK3bC4FePxsa3jVPekCPeGgsiHy63Ptu9p3SOD9Sear5AlxjUsCpUHfocdShneh3Rtw3RATpMOBKf6R1U75E3aqtVCgCoq18EVSzKqBkXR7XI4DdhVJyvSiZIaodLXSZ8tlItwtCgyBmJhbxRmF0PxVUC6BrAREKH8s95XlsD0HIKyL1LcPwk5fUw33Y5kpj8+VGlv7XDLovyU3eL0eDqlObfZV77oWqFYyJ2WaHsVil2mErMqW0X1czmwD6h14RDMsds5Ac1xYVUgjqMCf2PwKbGmuMVxb8URVRHykNd7ANPopg11A/50ZcqNUygw/f2A76BuhPg51HDKQRcK++lkWhXHMTRJ9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(9576002)(508600001)(9686003)(66556008)(66476007)(55016002)(6496006)(316002)(52116002)(956004)(26005)(33656002)(44832011)(5660300002)(2906002)(186003)(66946007)(33716001)(8936002)(83380400001)(1076003)(8676002)(6916009)(4326008)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xx2JV8xyQd6Gz9IjyrLAbMMlR1DdvPgkYcdVnxC0viEZ3X7u8FAhVCHqCPAc?=
 =?us-ascii?Q?k+gHwRRctftxha3kLxPI5EzUUFUroa1dkJwhQwzsVoqk6bTC0rDJV0vqCcJ/?=
 =?us-ascii?Q?tU9/hwzbc1yyTx83F4sCWrtaO5tVTNGGnw/4l5H1OSHtKDNvzbecg+Q0X4Zb?=
 =?us-ascii?Q?U1DU8DpDXsCRV8HNK6ZV3qeByeh1ywKkQvgF8QzCf9B4dChqVpJxESWgJu/l?=
 =?us-ascii?Q?DDcJIzf8Yircf0M7CquD6UrxTtwd+FDHTqYEjQOyAD/97FDrZUI+YkzymQId?=
 =?us-ascii?Q?2OQLzOVwUwGlmW9xsX4BvcndYUkDwIqAQQXu/hEZAVD/QpIc1Vp6qxXC+8nD?=
 =?us-ascii?Q?CKVp0mbNgQ9Osjkzj6HVuhzubl4Gxshbswj0IOT/3DH6cBkh7L/jeQ+NBGLT?=
 =?us-ascii?Q?aDHtGTMbBu5q+/krqwQbVynoqL7VSrwHTEwbj6cK4hBElaV2Ddc+9PIbC3tn?=
 =?us-ascii?Q?prqoABi/Gd26kGF8AfD9TeV/DIDl7b5/oRv8Q8h1xFOcZEh8Es7zZs7qOznI?=
 =?us-ascii?Q?rggWVurWvgJV/VtAR19UbHEeiRCgmpGDPWDF+EJo6IsHjFkv7dZzaldckBRz?=
 =?us-ascii?Q?mScx0S5c7V8m/gNq92XplPogQh1z/SGdaMGvm7PG32AxXkE5+NnhTA9mF60u?=
 =?us-ascii?Q?eJUwHMFgA89H7193LfnbWLiyORlv/F0xr5BZ0kztNiSlQedsZRF622jAkGJH?=
 =?us-ascii?Q?0aEac2e1Bg4LRqMXnfsBivFgvk3WwwLb+eQEwEew5qBObb0pYxGm7ahL9lcf?=
 =?us-ascii?Q?NmYF883JJv8/2kCDQN9s96DeMf7srhXCunh/vIFwl925CeUInEo2ljPwct6M?=
 =?us-ascii?Q?N76P5KlzpDTcoYg81lvvk6uXHEH/q2wG7Kox5tHlsqBCYeBeVvcem36PSb2c?=
 =?us-ascii?Q?+qpTk6F6hoS+Se+IM3xUxG6A4IU7m3Ygulr86QZ0d6uCrjwVfvY0aYEJdRhb?=
 =?us-ascii?Q?4IuRDPhkbI2nMdi9DwVv5VDbLhidUZnDf8VESDvKy41qfBMLf0bot9eYjN8k?=
 =?us-ascii?Q?MHHtLtwHs3WfjmE5qeiVQa5E0l7E+vgwnNdoaIBQFxcVd1IrISyhQ4gw4JzV?=
 =?us-ascii?Q?zjscXdbwoQktgXXw7e8epzjcdxA5UrNkAgfgirHHupddSasyhO6adEotj4Ni?=
 =?us-ascii?Q?zrMsSWN4JuLSwA/4ycoQGNyxgpjRLJ6hOjKO2u1uNFuKzdlo9z19cKVOoDSd?=
 =?us-ascii?Q?fSF70tRpPv5enYAZ2pxcaNqkduHjjXUGCQs4TVE/oUU8QOiXrs850sG1Ly+U?=
 =?us-ascii?Q?WlhfDMd0b0SEWtwXSrjrdEvzI+t6URMu3fMmOZwQCImefx+UhyROGAJmNgsx?=
 =?us-ascii?Q?gr2U3/CFC208AfsNVcArS1XK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a539d29e-5625-4f57-aec5-08d984d704c9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:28:48.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfs/ibMnK/6w0lC1xjf4ICftwEwS1vheXp9VrpSn1dMiceT4UjW0fe9dfdaWP8mfrAvMVqr8Xlwo3gpZot6DeWhe0v4jWRD2DRG8VzAHF/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5425
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110010081
X-Proofpoint-ORIG-GUID: dkoMC4WsIYb8uSR-Tmz0hFvWFc__MZ4H
X-Proofpoint-GUID: dkoMC4WsIYb8uSR-Tmz0hFvWFc__MZ4H
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

Hello Jeykumar Sankaran,

The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
27, 2018, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1679 dpu_plane_init()
	warn: '&pdpu->mplane_list' not removed from list

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
    1567 struct drm_plane *dpu_plane_init(struct drm_device *dev,
    1568                 uint32_t pipe, enum drm_plane_type type,
    1569                 unsigned long possible_crtcs, u32 master_plane_id)
    1570 {
    1571         struct drm_plane *plane = NULL, *master_plane = NULL;
    1572         const uint32_t *format_list;
    1573         struct dpu_plane *pdpu;
    1574         struct msm_drm_private *priv = dev->dev_private;
    1575         struct dpu_kms *kms = to_dpu_kms(priv->kms);
    1576         int zpos_max = DPU_ZPOS_MAX;
    1577         uint32_t num_formats;
    1578         int ret = -EINVAL;
    1579 
    1580         /* create and zero local structure */
    1581         pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
    1582         if (!pdpu) {
    1583                 DPU_ERROR("[%u]failed to allocate local plane struct\n", pipe);
    1584                 ret = -ENOMEM;
    1585                 return ERR_PTR(ret);
    1586         }
    1587 
    1588         /* cache local stuff for later */
    1589         plane = &pdpu->base;
    1590         pdpu->pipe = pipe;
    1591         pdpu->is_virtual = (master_plane_id != 0);
    1592         INIT_LIST_HEAD(&pdpu->mplane_list);
    1593         master_plane = drm_plane_find(dev, NULL, master_plane_id);
    1594         if (master_plane) {
    1595                 struct dpu_plane *mpdpu = to_dpu_plane(master_plane);
    1596 
    1597                 list_add_tail(&pdpu->mplane_list, &mpdpu->mplane_list);
                                        ^^^^^^^^^^^^^^^^^
This is not removed from the list in the error handling code so it will
lead to a Use After Free.

    1598         }
    1599 
    1600         /* initialize underlying h/w driver */
    1601         pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog,
    1602                                                         master_plane_id != 0);
    1603         if (IS_ERR(pdpu->pipe_hw)) {
    1604                 DPU_ERROR("[%u]SSPP init failed\n", pipe);
    1605                 ret = PTR_ERR(pdpu->pipe_hw);
    1606                 goto clean_plane;
    1607         } else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
    1608                 DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
    1609                 goto clean_sspp;
    1610         }
    1611 
    1612         /* cache features mask for later */
    1613         pdpu->features = pdpu->pipe_hw->cap->features;
    1614         pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
    1615         if (!pdpu->pipe_sblk) {
    1616                 DPU_ERROR("[%u]invalid sblk\n", pipe);
    1617                 goto clean_sspp;
    1618         }
    1619 
    1620         if (pdpu->is_virtual) {
    1621                 format_list = pdpu->pipe_sblk->virt_format_list;
    1622                 num_formats = pdpu->pipe_sblk->virt_num_formats;
    1623         }
    1624         else {
    1625                 format_list = pdpu->pipe_sblk->format_list;
    1626                 num_formats = pdpu->pipe_sblk->num_formats;
    1627         }
    1628 
    1629         ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
    1630                                 format_list, num_formats,
    1631                                 supported_format_modifiers, type, NULL);
    1632         if (ret)
    1633                 goto clean_sspp;
    1634 
    1635         pdpu->catalog = kms->catalog;
    1636 
    1637         if (kms->catalog->mixer_count &&
    1638                 kms->catalog->mixer[0].sblk->maxblendstages) {
    1639                 zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
    1640                 if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
    1641                         zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
    1642         }
    1643 
    1644         ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
    1645         if (ret)
    1646                 DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
    1647 
    1648         drm_plane_create_alpha_property(plane);
    1649         drm_plane_create_blend_mode_property(plane,
    1650                         BIT(DRM_MODE_BLEND_PIXEL_NONE) |
    1651                         BIT(DRM_MODE_BLEND_PREMULTI) |
    1652                         BIT(DRM_MODE_BLEND_COVERAGE));
    1653 
    1654         drm_plane_create_rotation_property(plane,
    1655                         DRM_MODE_ROTATE_0,
    1656                         DRM_MODE_ROTATE_0 |
    1657                         DRM_MODE_ROTATE_180 |
    1658                         DRM_MODE_REFLECT_X |
    1659                         DRM_MODE_REFLECT_Y);
    1660 
    1661         drm_plane_enable_fb_damage_clips(plane);
    1662 
    1663         /* success! finalize initialization */
    1664         drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
    1665 
    1666         /* save user friendly pipe name for later */
    1667         snprintf(pdpu->pipe_name, DPU_NAME_SIZE, "plane%u", plane->base.id);
    1668 
    1669         mutex_init(&pdpu->lock);
    1670 
    1671         DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", pdpu->pipe_name,
    1672                                         pipe, plane->base.id, master_plane_id);
    1673         return plane;
    1674 
    1675 clean_sspp:
    1676         if (pdpu && pdpu->pipe_hw)
    1677                 dpu_hw_sspp_destroy(pdpu->pipe_hw);
    1678 clean_plane:
--> 1679         kfree(pdpu);
    1680         return ERR_PTR(ret);
    1681 }

regards,
dan carpenter
