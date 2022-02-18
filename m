Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC54BB338
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 08:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C470D10F0A8;
	Fri, 18 Feb 2022 07:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF310F0A5;
 Fri, 18 Feb 2022 07:30:14 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I4Hraw019462; 
 Fri, 18 Feb 2022 07:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=izyeYj8wZtI3IIhRJjsTlB5n/y9JaNOSELyacT4VVfY=;
 b=YNXcX9y5FMXB57xOHhTVUmq2uFC3ZtHs3BpDhfpVrQZYDtMyTbXnTMqrtmsw4iSZkZan
 5tApN/ZqgXg1Zk/xlpfg18f1cMMqbTyTRf83L8JDJ1dlvmWLqqLK/UtR2TaJWqpkocPO
 gy9yiPCwrtw6ea/67cmNVYmFNurDiFaL0dUZoL42CBRp+ef1ZMic9baltI168WQ5jQCv
 NYLZAqeJYjJkPZpVyDnPbZiuhhr5gROo24ZZrhVaTyiTe7onAbnDgoAui5WAgK6bwJ7E
 yiBNUh9iqCWkWd4Hg6+J0uvVLTb6SYlOJjUSBvTQTMIqJ8ql6qU6p34wk628Vjy+crv3 gA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8n3ffv45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 07:30:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21I7LMQr034311;
 Fri, 18 Feb 2022 07:30:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3030.oracle.com with ESMTP id 3e8nm0qs12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 07:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV+ojlfgIREBUsfERDpwqLObs2ZMFnY7UQGntGoH6glicCTErshc+ACFHbZnpY7pPmf/J5mztJXQbhMielIOwP6gJnMi9QdZuS+EtiE/NZ1+uqtijaRtPmsin5Bs3TBsCkJkHtoqgULXiw/oYPJPbmOKr9Qn0BXbYIwWL0lBMNSr/zL/q6Y40VNNC2kP/rYvXADG3QIDr1mTtCmnYkLeEoZ+O/rhz8DzBNxKU7DYwAfFl1F0ZRRiX4xhzQk1BLpgvtQWih5Rze7JmAcpTa0YDWX0eaBuSvXBExZcxPSMSTMksyVpal2FMB48DF6RsHzIQ7d6w6LD5B1uiYFInWfZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izyeYj8wZtI3IIhRJjsTlB5n/y9JaNOSELyacT4VVfY=;
 b=eQ9vtoFhvkTOV7tiJrsumLmwep9gRT4hQaggY8quxat7PMxvTh+IWYA0V8Za0OsCSZUL6r+/4gdH1rjnKVpQZft36C7ZzaXRh6D3Hv5tMccbZlgsHVAUCkvM61mVTdNNAg8D/Vblv21/MkC8G9a09VZdDejcCs5oq6gW5/xbv4aluwsy3q5ErEbANPKDPNLN7/HPQs3RVOZciVmX18X6myRytC+PZxmQiM+UU/NRnCoPSYJRbV6MT7dzPb9X0oNf3X+D/mN9CaAy0vfuEFE4qGRtl0P2IZElvSlrJ9XNyJg5JYq6UwlX2G8UiZJSIHOZXxHUkKev+2aX0OfK96Ji8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izyeYj8wZtI3IIhRJjsTlB5n/y9JaNOSELyacT4VVfY=;
 b=mJcAaZegjs3env/RARPWtlF7raPW7OLIRTNNC6rca2zeTiJPnGVY6c9tWwuIZKfIU2ATO53PUsbrFhN1iskL2qI+mcpY9YX7R3GXj2QMm9nmOuqGVjLybe5Imi9qvzNwbl4sE4gGL0rxqcN+oBOd8siufXKI9iqb4w2xtGnQ40g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3871.namprd10.prod.outlook.com
 (2603:10b6:208:180::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Fri, 18 Feb
 2022 07:30:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%3]) with mapi id 15.20.4975.019; Fri, 18 Feb 2022
 07:30:06 +0000
Date: Fri, 18 Feb 2022 10:29:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: david.yatsin@amd.com
Subject: [bug report] drm/amdkfd: CRIU checkpoint and restore queue mqds
Message-ID: <20220218072955.GA9278@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0119.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768e1866-9dfb-492b-442b-08d9f2b07c1d
X-MS-TrafficTypeDiagnostic: MN2PR10MB3871:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB38715E4B731981554A793AFF8E379@MN2PR10MB3871.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jszD7wDt8poszkA1qEaK6XGGJhaq6oIjg72thuUG37SY5CGuLCEcIZHwHn9jm1U61U1JyrQi+T6JEpDVaSFcA+8URErlKafhzqVqZaygn+zth8PoX0db9fh0m3xAaa7F1v5+bjynZAgc9x7FoVAqlmCjAHnTyvOswpOS9Ky2yLGX6Qqgr3eB9bHMbLknQc1xusu7TbkhsLmAmPttW1nbJri4FCdRu/NTtRrjGq7RZCFHbEqvjIRjfLkPIkOT7n9jY9ZjDkexbK1Kl4F7a2ZBEAdaeokeMKFBzE98DXWVRFmbRYHw0Y36I2E92MHEDAyKyfUAc19U+bVEDIbTHFsqY5gK4yCPI915SD2x4bfDy4w7wPnLypqNpMxjRTh4inCCNr2+P8OcxjR4cpmYqSMrDbKgmWNhHK8h6401gsEwtrIHf0/x8LJb0+QOAYAawrnBsLa7g0LJgoQZMd1uk0nje2bA3Au9EI70fhyiUWsiElJxwEhvyQiOD8LPY74ef6hIni/5ys/R0yllr2t9cboUQnUMssXNyyL9vrNNUF0+8GAXrt65a8Fqi6MQKibY01nT0Iqtqi9gqBietelr5L6rEssFsdh4gweD2m0VapP4DX6Tv1a8ZZ4+NssXczfTOuw7K8Kc1A4gzpIh39CpwsCw+z3oF7VaxTV67xzBj2a8WN1lRU7SE/JtpeBrrP9BIE3KQalExApVTg7HC5k3N9BL0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33716001)(508600001)(86362001)(4326008)(8676002)(66556008)(6486002)(66476007)(316002)(6916009)(66946007)(9686003)(6512007)(6506007)(2906002)(33656002)(6666004)(8936002)(83380400001)(38350700002)(44832011)(1076003)(38100700002)(5660300002)(26005)(186003)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qTuNyWey4swvLDPe+iU6Xi56RDvVIqMlHkeXQGn/VWX2Zvt4TzzM/+3d8Y6M?=
 =?us-ascii?Q?Z1hqTc6vAvwKKy559y7rreHZir0H+Ym1vc8pioBiqHnZSnCU24/BSuXpy1SO?=
 =?us-ascii?Q?OVs0LHKSAT46+s83H6CV8nJVFLYuW1LjTy/xc5bUKtHdJZtK4zguAhLsad+w?=
 =?us-ascii?Q?5qaRyEur8sYWv9FWi7LYtUTab8ddK2MvGfBrWad9lORw/X3mdcoMGDMoxDG9?=
 =?us-ascii?Q?Wig9fx48J1582qa+c9kuXI+jyhc6+UF0bJ2WDcXnBj3anWq8q1PQanVpgTqD?=
 =?us-ascii?Q?VTbpOx+uJAdohrAwzPimvUHAJZ2rIPJz9tk/bhseaJ6UvjcRT+mWR/VaLr0D?=
 =?us-ascii?Q?KFzKmUjuDNP+O4fQLu2b3MOoAeP+exTfycgxp/luT/ODFW+0IIesAM9Q/b9n?=
 =?us-ascii?Q?c4ijLqQ78C9GUeYaAMgF1//V46/66X6ib2pp8rbsVeN5aPgMoDjyZaIt2Jof?=
 =?us-ascii?Q?EuVdoN40X5kq6DEW4JGwpa49n7d1Adc8G02dU0T+Ljk9a4yfSNVvedw0UClF?=
 =?us-ascii?Q?Wd9P0Pufr/+R9y0gVljRBfDX6MlOAlpKwJBa4ta+CXbqXu3EkFusNASZ/u6o?=
 =?us-ascii?Q?hSwKcpu7ZCWJ5FPOyQMhhCbVueniff2FqJbfaLLFzF4LcIjgHdpYu+ayHdjJ?=
 =?us-ascii?Q?g2aknyU8mYuBdR3bsQrRC9RFFMTssoqpW4AFJaOoBklbPritNpZgkaGKc/x4?=
 =?us-ascii?Q?mTY4nmP+grzr4qMBA9J+/UWVlvD1tSZwfdcpQRxbKSnAk/Us55IWe5IXyjBB?=
 =?us-ascii?Q?6Emhwo0DP9/l3T4FzDg7ytop7URI3wpNhe+yPT7ADWMKgKGd42kgB/Xhv3Yb?=
 =?us-ascii?Q?Qg6AXzQzv+tJnJHLmcDNRsPYfFlpllSRbCWQHZ+ZHZt3vTpckw3UhJ0RmVfA?=
 =?us-ascii?Q?RGSlrwFFQuHPVdHnnAoRWF5qbPvSqY/YwXZPbHPo0MvHDVA6PHs1AQ0FKUZg?=
 =?us-ascii?Q?tFz/dDZOl3Ho5XjoRpIxFzeDhipGnzvSbIc/n3ATZzvTL+/KaW9odbwFgmyG?=
 =?us-ascii?Q?74MaC7iK+tWwzRMGMCF0p1sNH25vt3ETrjG+gjuNhE3jECR8hhpuxa9I5XN1?=
 =?us-ascii?Q?LwPcdEa9R+hiTStWI5XozoXxM//cXvzq7C6tEuckyOzPEmsXIqUWxAmtxK6I?=
 =?us-ascii?Q?rMtDKJzV2RIKgFE+oqNn4iVtcip7EFXMHoqhfvGRy75JpHwZ6QXvT5lKL4d/?=
 =?us-ascii?Q?Q7TOOdHXW02IgkMnR6qYX+WayZ7GnWID0AqStfCMEkx5i5r8bYaOZMS+suaw?=
 =?us-ascii?Q?1Nv8/LazNrDHeWzmJt17O+sH1dVW985Jl0DJzdk2dsRzoVV0biRw2Vce+Fsi?=
 =?us-ascii?Q?gMmbeK06rQc6vJqvFPOHjIjK5BJWbvC4DnNdNh07QMsAjgv4+iU4LUsX47uR?=
 =?us-ascii?Q?DJUFX4lA6q0ylvL6Ur5kCd2rEC3TtJtpGDuZffk5pzDnMA+uaSRqeHRzZZEC?=
 =?us-ascii?Q?ccwpYKTkVMMKAwP/5yPkBMQLEJ/uOOt7tEgr0BfuTCC+RGN112vStsoFOm/2?=
 =?us-ascii?Q?Is+fFwHNaWnkFqyNW5xcF+Nz6bqQL3QwNBS2rRMWspCSChVb6VqQRmy53yYK?=
 =?us-ascii?Q?9jiybV+BeqXYludrrrjvcjh1k9jCsHF5m5/wRwf81mRNQZ/JebNU8F4L8TV3?=
 =?us-ascii?Q?t6/rsAr0nCcsGy59t9C9IQdy3xD4CCIW5fm9/9FhrSTYGpScS7a1VBh/5Ke6?=
 =?us-ascii?Q?kzCBDg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768e1866-9dfb-492b-442b-08d9f2b07c1d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 07:30:06.4000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qFDwokBxgDc0vhIOkFcnD/tK3PyzZlCs+T9JKOluq5KU8zF6aIm6qS7/o8I5Jy/Ir9XuS7o3pcDDSTho2Muf7LAj9RhYN6QHzsmabMmVvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3871
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180045
X-Proofpoint-GUID: 0cPuoh1haJWEA7TlTzApyfOdYxBVhORt
X-Proofpoint-ORIG-GUID: 0cPuoh1haJWEA7TlTzApyfOdYxBVhORt
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello David Yat Sin,

The patch 42c6c48214b7: "drm/amdkfd: CRIU checkpoint and restore
queue mqds" from Jan 25, 2021, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:344 restore_mqd()
	error: 'ctl_stack_size' from user is not capped properly

drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
   762        int kfd_criu_restore_queue(struct kfd_process *p,
   763                                   uint8_t __user *user_priv_ptr,
   764                                   uint64_t *priv_data_offset,
   765                                   uint64_t max_priv_data_size)
   766        {
   767                uint8_t *mqd, *ctl_stack, *q_extra_data = NULL;
   768                struct kfd_criu_queue_priv_data *q_data;
   769                struct kfd_process_device *pdd;
   770                uint64_t q_extra_data_size;
   771                struct queue_properties qp;
   772                unsigned int queue_id;
   773                int ret = 0;
   774
   775                if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
   776                        return -EINVAL;
   777
   778                q_data = kmalloc(sizeof(*q_data), GFP_KERNEL);
   779                if (!q_data)
   780                        return -ENOMEM;
   781
   782                ret = copy_from_user(q_data, user_priv_ptr + *priv_data_offset, sizeof(*q_data));
   783                if (ret) {
   784                        ret = -EFAULT;
   785                        goto exit;
   786                }
   787
   788                *priv_data_offset += sizeof(*q_data);
   789                q_extra_data_size = q_data->ctl_stack_size + q_data->mqd_size;
                                          ^^^^^^^^^^^^^^^^^^^^^^
ctl_stack_size comes from the user a couple lines earlier.  It's a u32
and so is q_data->mqd_size.  This addition can have an integer overflow.

   790
   791                if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {'
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Which means that this limit check doesn't work.

   792                        ret = -EINVAL;
   793                        goto exit;
   794                }
   795
   796                q_extra_data = kmalloc(q_extra_data_size, GFP_KERNEL);
   797                if (!q_extra_data) {
   798                        ret = -ENOMEM;
   799                        goto exit;
   800                }
   801
   802                ret = copy_from_user(q_extra_data, user_priv_ptr + *priv_data_offset, q_extra_data_size);
   803                if (ret) {
   804                        ret = -EFAULT;
   805                        goto exit;
   806                }


regards,
dan carpenter
