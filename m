Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2684067AE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 09:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FBB6E97F;
	Fri, 10 Sep 2021 07:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895C6E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 07:30:18 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A5RBDC013688; 
 Fri, 10 Sep 2021 07:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ZDREntCrS84JL3Tt9UwTvYnGZCQzC2gcnV2KKjxRVto=;
 b=ETyX195N6zuz2W+aTWWJ9mQdyJGCex0NFx8HFpOSOY4ssoflhmJz10KQNnDLgYugkZdk
 ywSNwXaOxtQkcDWruC9WSgWl+xfcGRVVSowmvMd5ONPXwnOzQR+ikjmCaPx6lyjZRX0Z
 O5+kjGQxtWbtnQ6IvuImry8hYc8Hpz8T1VgXy39KjFOO/dS6UJSVG/Xm4ZFmiuQMzjFP
 rWd2HmgZ8Ue+aUo/fga0iiqLMBIH3b1PLpL18osAh4oH/1/Im2AOPAp44lZPcUc/7P+c
 wBgQ6BM5x16K5Nxk4KKcomMOf/NzNZHPjI2fYVOTOGYz8ysWv6V2x2Ry6Cd2UCFtsUF/ Nw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=ZDREntCrS84JL3Tt9UwTvYnGZCQzC2gcnV2KKjxRVto=;
 b=yARbjBQ/crvPmFuJ8zOl29Ok1pLB5DNtGmLjpjArK/GRpufZoGW2tT88OW47XWjYHdMi
 FzBlvz36NF07KZrGbBZjin605M3KbXFL1e+YgbAM+OaMw57VSYUxFwDWgv0MLUzUseAZ
 f9pzNSbNPTikadnOsFzljWHCDlKpgbcXgVsncyHq5TygK2cR5Nx5h+8/hlVUeMmLq73m
 XHwf6/tDdBrV0ZmI2miGMsGNZkxiTIi5IcTC2/ZMzzclp5kD6ODTZL3G9s24i1jpLbVx
 K3V3meNpbp0nGB0ZQu7DwoPJE2VmbFO4PF9eMI6QPzBOzr4ZtNWsJg3/vJ8PzKqkc4wJ iQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ayty48yt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 07:30:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18A7QKUR146042;
 Fri, 10 Sep 2021 07:30:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3030.oracle.com with ESMTP id 3aytge8gaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 07:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB3Ox0eix6xfK3zk1H2RqFOBKAyq6ORptRjpg555XtwFJf6zjiGni6Fdm/rKBQ6ATGgD5Ic+/+1TNWjZttjAjoAUXxZ+G3Zgs36Zg7Nh1+OYfLjqSHidR5CXeYpttHMvaICavjHta9AJf2X9zyWyTawkaysIdiViHA3e4W6qp7dk83J8c16x9oYRg5zqmiBNz+eshvYPCngkC0xO2OVVm0XZG7chFE9IczCWagZqv7XNn+hpQaYq2ETReBGf3pHOnmICTy8RWksUjWZ/DkiOst1bo6WdidnE/SSS274vv2qY9x8HUk0YZ+cqw7asnG2CW8peDuEBKKlYvTXjmAbczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZDREntCrS84JL3Tt9UwTvYnGZCQzC2gcnV2KKjxRVto=;
 b=AZBdTWmS2QdgOVU/GJvH8yM/3elJV/W9FXtaonw63cZL/Bq540N5aizIrKdNf+EEPls0GIUU3cHvW4rGnfZ5Qry43HRzE9w7fc1kep9yBlkiORjq69YSOhZU8mkF8TnXzPZkPSz6ios8pymzetocdyPoFu3q+hEv9lmHbn6GkkyG5LcVrtgHMm4cPFJ+D0T66vAyl3SnoIb0EjzrmXWcj9jcBtUrxf9lKIh7R/Y8zBb3U1phpstRBWx2mm4QJ7+AKMy7PwLLCT6EFt8OOd2nawxwzginh1xO2Oja0If+pBmnHkr9KGgPDYoCrlb/QkVyDCHhuO7EOj34wWFl/zLY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDREntCrS84JL3Tt9UwTvYnGZCQzC2gcnV2KKjxRVto=;
 b=NsSoJhWBYP4lbx/0f+Vg49XTaqBZvPIbvHtoggC56VVVPbraSJiLRfjoFoVswShPgB/523XRb8e0Bx7A508kfQo3vrK1zQzZ8MS3fkkhw7w1ZkEfTDJlM6KylzBpIrBqFMMp/c/oCFlAJv2uBUv4cWtJQEixgv4OQS77RfPDkOk=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1952.namprd10.prod.outlook.com
 (2603:10b6:300:10f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 07:30:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 07:30:15 +0000
Date: Fri, 10 Sep 2021 10:30:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: thellstrom@vmware.com
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] vmwgfx: Implement fence objects
Message-ID: <20210910073014.GA32250@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM0PR06CA0093.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::34) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by
 AM0PR06CA0093.eurprd06.prod.outlook.com (2603:10a6:208:fa::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 07:30:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 934973c7-728e-4ddd-365c-08d9742cd4f8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB19528413694D053FBBEF5DDB8ED69@MWHPR10MB1952.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30H4ukyvjL6wwwl/nJw6FJ89+RF3jAlYwJ/XMMZQyIFdEX9UyFR58Lc15X1DdDdedHP5JZ6A2zcru2b9Nh+AGdKNiwk7p0lmZXLiVqssRB8dx+A3nAPP4K21Ahph7F8D3VdmXRzbTTXEQqV1KLeFWq64LvvJndo23YHmy3LJkqHbBJTqwtcFh7k3EVOg7TehUFsT7kMHpoI+EHuArWtReBjvQShoOUyDZNv3wJv2jQY9ywbtCmJNYHepEhp+mUhSnvd+CCM+olAvzSKi3tK8FfL4k7JVpgJzUihtTt2UOJjWezX1fi0AVly55X0jzJgihcz7VHZfIhavpnKbp9iw3+aF/LLX8Lijb2SHPj+4j/ZjVoLTZSbWfv1Qg3gzlzh1jT6rqI1vDgYT9BAATLRVHRXCw6KWCLP+QnxZzLzg3FQ3XkhnO6QDAeCbhbfZJUR5mJdy1j6XF+0+TgaXTqg81avnEtbOiMfdv8qlAX+KYPJ8rpKsHYJbjuuLYLy3quuaOXRm2jUdwQI6KLe7nuR5p9x5Av1OAKwAn9D3XNAoNknab1VRFwZ+E2PXTL4VJskyGs8JKp+tcqs0DPn0gWoz82xH89e5/8VP3sOTHIgYoZGMMzpbjcr05HqapzFwCxEUfeQPfFy14QDl+jynoTmH9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(346002)(396003)(83380400001)(33656002)(44832011)(5660300002)(316002)(1076003)(186003)(478600001)(33716001)(9576002)(2906002)(6496006)(38100700002)(9686003)(66476007)(55016002)(52116002)(4326008)(6916009)(8936002)(66556008)(8676002)(66946007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6n77ZrpIa1aK9o6cCtXRDtvL794X3ocGTHBGv+LFOMhmlMGeeG8EPcG2jz0a?=
 =?us-ascii?Q?Bv7J+KFXvRwjqu1md4AJte8qU2Ke+ODFHS5e9IGFRbzkPTT7qnhQVzthzr7b?=
 =?us-ascii?Q?8l0YblpDnFwv2oDPd0tCV+uyZnymua95TIXHYY1Js5ZRZ+HXd0JggpaJh2Yk?=
 =?us-ascii?Q?WV4gSfdVCRqGn57koWSnHU4iUc02fv7HNgqIMmgewOl++p/X0fP6qYZ4XSga?=
 =?us-ascii?Q?NY0WISIJcbbWKiNCF8uTUCjzcXqMbcg15U3jeeqekfX/iP2P4DazCMGoJYN3?=
 =?us-ascii?Q?FnhNI+pCisf0u3+qiycxpgDt8FkVTj8wW0yCPZLb4HwXvCgJqlIvCMW/VmY9?=
 =?us-ascii?Q?3XtTYTJtHOctUkZDfXzlFAUnPSzgci69vHR4WfgSaEb8k07biatf4veKxzwJ?=
 =?us-ascii?Q?zXcNrF5OsA0GXFd7lT9h2DGZB/TXGtGUjCfn3+u86E9VmK42IVrjbS8XWYYe?=
 =?us-ascii?Q?uarVswMVpm3RThqrf8xlYsTAIkmLF6OuFCIFtI/WlgJkM15QBaFLBzldn/8S?=
 =?us-ascii?Q?eSa8Wqu28voPD5J7kXMwmX7bcgwBrHXQcB/sXNPoNyO8sJ5gRNi8EbQYzRGy?=
 =?us-ascii?Q?pfuUNjk6tc7nkHxd7SNzMduRPOBOS2iL07HeNBbTrJtbwjz8ZsJKQ/d5Kri8?=
 =?us-ascii?Q?tlEwGF66550OhS1UfNIhyL2dT6+10V7EOd/RIuYyQc7LFH2wRZ/NJGM2LwBt?=
 =?us-ascii?Q?0qXS+ESQJVkeNi1nMFdIGaqMnINqkNK8yMK40Eew6X8Bm6jPNK1MRGITp9zi?=
 =?us-ascii?Q?ku3aYz6GdaM0RBUyqhdAHoSg5fFGK9Z5smQ4CFakAiY9+45Yd7hzcm45dp62?=
 =?us-ascii?Q?RCV+//pQ1Z9MPccfLXBrNFPCdtK9dbT+LW4f866nSCNnqKamtStr/fXruegn?=
 =?us-ascii?Q?Z+MatZ9uSpm4IhfYI5kMCcoJqE3SG0Aznof7kuiWDJyEGANQPPh2/2m39+Yh?=
 =?us-ascii?Q?mrz+li2ErzGt5ZUFnwRbA0cjaFeoJfx3IUDQafWXGj5gUHVAb8ecSM0RSpbG?=
 =?us-ascii?Q?yM7HwqnT1qYFH18U6246AMBDESfsMT+F5dvARMwEKU2tP2OEup7wGBZ3fyyR?=
 =?us-ascii?Q?EcrDB35mUZFU/ugQQe6IZ1v+Sorbn13ySSE0PUDU2N3tsjvS+Sx66BbPjt/G?=
 =?us-ascii?Q?1dLCWZq7SsPDmH/Fb8WGj9KGwihMDIVlls4cKu31kxmLwLe5S0rnO63S1V73?=
 =?us-ascii?Q?1Jfpm1k6Y3hPIQXnAYmoF7KOWixtPuoOHtORLFAel56I2F1wnbrdcIzbgn18?=
 =?us-ascii?Q?+OqUY8noRyENyoDSZlppQoybwhKQ34kpUo9HT3FKeiBWXJbVPE/bD8PfT62L?=
 =?us-ascii?Q?43QZiYOShxPXErYumawniaeZaafQMaF/XVc2+5k8Oe5BYg44XwJQXRDGn7SY?=
 =?us-ascii?Q?ICdC9fg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934973c7-728e-4ddd-365c-08d9742cd4f8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 07:30:15.1434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRX6Xuvk+2wL5r/2R3plgOXOB4NbTQ8HhEluqjie3PSWT5ynrS3kmWdYS7WMcwQjmnf/97rLGH5jmRznvIRgXFcfC01rKv4MiR6ueumz9q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1952
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100045
X-Proofpoint-ORIG-GUID: ZGvO7Vg-ek6tR39zF953hqveIOyhpaTY
X-Proofpoint-GUID: ZGvO7Vg-ek6tR39zF953hqveIOyhpaTY
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

Hello Thomas Hellstrom,

The patch ae2a104058e2: "vmwgfx: Implement fence objects" from Sep 1,
2011, leads to the following
Smatch static checker warning:

	drivers/dma-buf/dma-fence.c:790 dma_fence_default_wait()
	warn: user controlled unbound timeout

drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
   784  int vmw_fence_obj_wait_ioctl(struct drm_device *dev, void *data,
   785                               struct drm_file *file_priv)
   786  {
   787          struct drm_vmw_fence_wait_arg *arg =
   788              (struct drm_vmw_fence_wait_arg *)data;
   789          unsigned long timeout;
   790          struct ttm_base_object *base;
   791          struct vmw_fence_obj *fence;
   792          struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
   793          int ret;
   794          uint64_t wait_timeout = ((uint64_t)arg->timeout_us * HZ);

timeout comes from the ioctl.

   795  
   796          /*
   797           * 64-bit division not present on 32-bit systems, so do an
   798           * approximation. (Divide by 1000000).
   799           */
   800  
   801          wait_timeout = (wait_timeout >> 20) + (wait_timeout >> 24) -
   802            (wait_timeout >> 26);
   803  
   804          if (!arg->cookie_valid) {
   805                  arg->cookie_valid = 1;
   806                  arg->kernel_cookie = jiffies + wait_timeout;
   807          }
   808  
   809          base = vmw_fence_obj_lookup(tfile, arg->handle);
   810          if (IS_ERR(base))
   811                  return PTR_ERR(base);
   812  
   813          fence = &(container_of(base, struct vmw_user_fence, base)->fence);
   814  
   815          timeout = jiffies;
   816          if (time_after_eq(timeout, (unsigned long)arg->kernel_cookie)) {
   817                  ret = ((vmw_fence_obj_signaled(fence)) ?
   818                         0 : -EBUSY);
   819                  goto out;
   820          }
   821  
   822          timeout = (unsigned long)arg->kernel_cookie - timeout;
   823  
   824          ret = vmw_fence_obj_wait(fence, arg->lazy, true, timeout);

This is a new Smatch warning.  To try figure out places which can
trigger sysbot "task hung" warnings.  I don't know if an upper bound on
timeout is appropriate here because this is new experimental check...

   825  
   826  out:
   827          ttm_base_object_unref(&base);

regards,
dan carpenter
