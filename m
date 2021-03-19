Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FFD3413D0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 04:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCBB6E978;
	Fri, 19 Mar 2021 03:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE3D6E978
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 03:49:21 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3TwWK075130;
 Fri, 19 Mar 2021 03:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=UthS9+OuPzsv+GwjTPx2CqQssK57m2G4QicRUzlbYS8=;
 b=YPNJrRBLAXWZt5o1H4JXjjH4+xg2X+HibsR0p8swnrl+5GFj+mUgX3GJ3cH37W+ICWOA
 EcsMrdLOOJlVfbH0HNBmBTmigcR2P4joqAR0L8UO9Zqm74V+NsggBoJR/66aFo6Svwnw
 4/9ETKTP4756CrKzxWIdqWuPvdLsO7n55a57wFQJ4rTyl5l0+JE0hrYimlzhM7oJzHOe
 VM9/6CX7SjZCooL2kpZ54/JhXzOvCNetjHMIVXGjWrZJompIW6a6ajCHmEkfCG9Ft6dp
 x5KPQVihJfyYvPUuTMqEzXhfO6Xs5+mXzTac/+IWxcsr82iEtsETh+6EGJNVX1OexdCn vQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 378nbmhhdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 03:47:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3U8OF175064;
 Fri, 19 Mar 2021 03:47:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 37cf2v0dq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 03:47:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxqbx/z2+mX9Ec3lQTSyV4cP0V5VubUPXudWbJDMiBHMJSHF/rzy7oI0TwI7K9q7m8cr+oogXQ4qGQmIs7q8+KgkGkIEnigmhsTqWRoXSO65j6K6VKHLNaE3+iHQBn6guIa/+H6yUCPJ0jIXi8eXesFUx1t/nDU82+ANBcjY5vDOKZzw01pXyG+HYGb3Y30UZCtzbeqLKF5GRTy8JkRth3EEIB1KG2Dbqu7zgDHWuR+gPNSyr0aEXuWN/MOdhCDVvbp90ud6WoSQnerTC6rxx7aciHGVTFn5ce0OexxQLpOup4whtvqwUw57sbDnoOxl5Bbstt1b/bKXhba05qrtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UthS9+OuPzsv+GwjTPx2CqQssK57m2G4QicRUzlbYS8=;
 b=nc/ZVNGkwLxwN5JmcI6/F6GWdSfpZE9d7DDeMmYOoKE/eIDAHl8Z1hQ36BRWTwd6jy95NRZmCJNKieY/qf3Y0kzTTE+2NIjIsUO5QNqTTuKZpvqigDPqjkYopy8huj7CdA4cVjsz92AwSnTdP/ULKEsFwOT50xPbqSXqpmvVedHSjrF9MV8PHsc1ADF+HBSMaC9qqJ29rx3PTJwVjFLiLeDiLwYBL5vwDoVCVPbJR1zbuDymkMuWqJlMR8Xqv9ldX6qCqH/HUq5NZHDahRhWBYXT17z/tOECQFoU3fyFAklM/B3AHpuHpGOVaiJP4l1LSZsMI3aFJKJa9T6CSaJfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UthS9+OuPzsv+GwjTPx2CqQssK57m2G4QicRUzlbYS8=;
 b=VPexZkc1vaD0tFK43L8hHPRE4RT4ESwFypXrvK59kGQSfJc6pxqReCvvhomWD2NLm+ghP/KySSpD8czg9/jPg4NrEStybpvgGnnHb6AV3X1EHpOcdMDbdpWRtt0He9o97mGtQaaSdRUQRYHMfO70pXjS6GfQm3Zr8T2a+AkgE+8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4470.namprd10.prod.outlook.com (2603:10b6:510:41::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 03:47:00 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 03:47:00 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/30] [Set 1] Rid W=1 warnings in SCSI
Date: Thu, 18 Mar 2021 23:46:37 -0400
Message-Id: <161612513545.25210.6970303099516531669.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210303144631.3175331-1-lee.jones@linaro.org>
References: <20210303144631.3175331-1-lee.jones@linaro.org>
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Fri, 19 Mar 2021 03:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6921bf4-e4d5-4743-4c8c-08d8ea89a6aa
X-MS-TrafficTypeDiagnostic: PH0PR10MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4470987DB316C402E4B384A38E689@PH0PR10MB4470.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nSPbdjOMVENi5XTrwpGGaVtq6TFRhh707Oh0Kd4DiS3cftQKUx21/dQi3Jvzm5nJNpdZho4U2EyF+mNAPZY48yA78SICRY/9sY1zcvcTAvbi5CdrGwMIypjSjo6ztPSTORF+6gdfm0SlMMr8b/IDw3aboSC4QrMYI/4Bu9BYTHXAvpHSrXAkaWopS08Pj8LiC3HBZmpFPz2T+w97HwDsei16Nlo7/rL1483M5lAwoeLFqOSqjH4lq3LFQE2dkpD1pH8AmlZnneD3EL9qCjq+pTM3NhAEnJkxn35h8NUJqo078IQ62wg2g4/Rb7cdScprxL6LWCCDMYdUXGDvZ1v8UPWNbr6MFODEIJ2XSSJYIXoCd2//h02s5gZcM/j3aWlHrmHQtbYGZ4u101duIiMWMzMF5lyivK1cm1QiIMXDEBEpFn6voMyh8taItO5Y9TnZ6KwZlPOFEni6bmSbdhIjpEzkswhB5yp6H2B70Wxj3vMM+VDBAbxEsGXuJhkw51f9GSkADTIYKpmULvJA/+7cheYF05h9Tk7us2yV4aVWBzxS2wCGtqqy+Rn7BLUECvjBIZaTPuSBMhcqMDnokUz/95bv9IlUpRojrqAXBz4lVBdIVy/eZZq2BPPpzy/C0SVm52CUGPpm5u6YLqWwk5PghJWOklYqdU31JqWDUUqKXCF06uqO3OEczhdAYYgzTH9pN/xkZhCoJD1rqdLBSUAuVG/qUIgPspf9ylnTuT5hR4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(376002)(136003)(38100700001)(2906002)(4326008)(956004)(6486002)(5660300002)(8676002)(16526019)(66556008)(186003)(54906003)(6916009)(6666004)(316002)(8936002)(103116003)(86362001)(966005)(2616005)(26005)(7406005)(66476007)(7416002)(66946007)(36756003)(52116002)(7696005)(83380400001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tng3VFRxQkJxTnExZUk2R1J3Q2ZSNmwvTUQ4Z3VhVUNXZUhkV2F2M0pmcTFW?=
 =?utf-8?B?RUJic2RTZlVzL1ZuQUptdmFDUmozUDh3K0VsVWxzdDdndStlTGFuS3RENkxy?=
 =?utf-8?B?VDhzN3ZwamQ1L2h0ZWNyZEV4aG1WeFM0ekRZbWZ3N2ltbmk1ZnNhRUlDMUVW?=
 =?utf-8?B?VTRoTGFsNVZDYmp3TEdoaVpYeklKOFQ0bHpEQi95U2tkcU9DMlRXTjM4b1B0?=
 =?utf-8?B?a2J6dEptVWhQdW1sY041T3pUUGdlUDhFbWpaUjlvMUUxY2NRVUZ0eTFadGd2?=
 =?utf-8?B?bHc1dGlNbzV6ekVaaTFNOVppa1NDN1d2UE9iNGwyVFFkVitQN1lkK3VrT1lP?=
 =?utf-8?B?UDdNaHRXeVBZc3ViWEVLL3ZiNEJ0dVkzTjdHOTV0MzdPUFl6bjhtRUlTandn?=
 =?utf-8?B?YWVpK0JycjRudVFFSW9SQ2RyQWdVQkVrQ0hNcllNcytaQllJbUhocm8zUEJ5?=
 =?utf-8?B?V0d6K2ZVeGt2NEpSbHp6R0IzclBVOW1Jc2FsZ3FDZlJIaExuU1lvUVZVTC93?=
 =?utf-8?B?YWd5RVhLQWtHS2YwbmhiTHZGaTEzK0FuaXJVNkpGVmNRT0ovM1JkeXQ5bjVt?=
 =?utf-8?B?UEhaVFd2YjI5Sk9Rc0piS29FeFNXOGlKT1lZeGpvdWNIbnBOMGtQMUh6ZVA2?=
 =?utf-8?B?d0RNeGt2Q25JRFB4d29QdmJXUnBwdFIzc2FvdkJvWTZLcUhCSnh4TkJ3Zytu?=
 =?utf-8?B?NXZ4am9MSlErNlRMaW5XbTRuV3BiTnZ3bnBuSFVTQmhNWDR4cDFWMUVOWGU2?=
 =?utf-8?B?blhlQmpIbGZtZTdiRE5tbElYSWp2QlZoS2gxaTA0Y1JZdDR3WWU0NDdYVS9J?=
 =?utf-8?B?NWoxNDZxUXJTVDc4dWMrS3dQUVhvSUowWEswT1JrNlF3SFRSdklEdnB5ZzEx?=
 =?utf-8?B?cm9WbGN2L2pZQ3dqcW5zZUpXT3ZoRUtMMXZ1cmFZSi9QckIvRUJUekZoMWpK?=
 =?utf-8?B?UFlEdkorR29VdG9BVm80VXhscFAwSnhEWHg0MUoyMVpHLzA1Z1MzRXNXK1d6?=
 =?utf-8?B?TW9lM2M4dkg1Tm54SkRBN1VPeDFPWW5qUURpUFRZMlRlaTJ2TTF1bC8xTE83?=
 =?utf-8?B?Q3RTOEl6MEZWYUNMcTlqQktxd3BSSFlMRjk0aHlKUWFJYUxIbElZUVg5RTdh?=
 =?utf-8?B?b1JFN2xoM2h0MXJSN1NEaGM3SFpuU0p4ZUZHS3VJK01TaCtURjh6NXZ3b2U0?=
 =?utf-8?B?dWlwUHJhTHVQbkt5aXNVWm8rWEY2c2xGbjdmbkhENjN2and4ZG5zTjNtZUN3?=
 =?utf-8?B?VFdIa3RHb21jbEdYY2djc2cvSzZoRk5lZnVZTmNyT2dUdlNqU2wxa1E4T21X?=
 =?utf-8?B?U254SVlpcjlqSmxnRXNvNHNDZXRpb256cStzTm1nMk1jSS9TZ2NsZDBxOXRO?=
 =?utf-8?B?elhveFgxbmtxMnhJbUEvYktzVXh3cEVydlo4NFJ4OVAvbjAybHM5RC9ycW4r?=
 =?utf-8?B?ZnNGcWZzdFdUUlNpV3YxSHhyeUN3NGZFVXh6QmlLODh4Ky82WXV4L3dsNFdE?=
 =?utf-8?B?czJ0dEZaWjdlNFpDTEYrVWVaTFhmdTBCQ1o3RXd0aVRreUNobG96SStwQ3NR?=
 =?utf-8?B?N3BaSFFDbDZ1bS9sM1N4NGFhd0Y0Zk9RWUwzUTdEblBzeHJQTW5tSk4wUXZP?=
 =?utf-8?B?RjhMQm44eWdSd2Z6ZnBnSnVUc1pvbmpzVGtNdDFxT0E4YUYzZVV6MDdPTHZs?=
 =?utf-8?B?WlliRkJod0k1VGh4WW9OOEJmOHhRd3hyV3FtS05TdmhsVGUzOWRzblU0NFVj?=
 =?utf-8?Q?I4Esa2lsUKZdH1mSTl4/Tn5FxgyRIGyXpPxbsKd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6921bf4-e4d5-4743-4c8c-08d8ea89a6aa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 03:47:00.3151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7/lV8MMnl7NDx3CH+6PITlyKI2WRi8lxUFyRM6DNkCLLYf82wxd1jxCOLrIXcZbxg0nQoRf67eIplye6dyJQATFd3MHbgJAlUhyG+dfLgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4470
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190023
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103190023
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
Cc: Atul Mukker <Atul.Mukker@lsi.com>, Javed Hasan <jhasan@marvell.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 Sangeetha Gnanasekaran <Sangeetha.Gnanasekaran@pmcs.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 James Smart <james.smart@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, "PMC-Sierra,
 Inc" <aacraid@pmc-sierra.com>, GR-QLogic-Storage-Upstream@marvell.com,
 MPT-FusionLinux.pdl@avagotech.com, Jack Wang <jinpu.wang@cloud.ionos.com>,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Luben Tuikov <luben_tuikov@adaptec.com>,
 Prakash Gollapudi <bprakash@broadcom.com>, linaro-mm-sig@lists.linaro.org,
 Manoj Jose <Manoj.Jose@lsi.com>,
 Nikith Ganigarakoppal <Nikith.Ganigarakoppal@pmcs.com>,
 David Chaw <david_chaw@adaptec.com>,
 Kumar Santhanam <AnandKumar.Santhanam@pmcs.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Sreenivas Bagalkote <Sreenivas.Bagalkote@lsi.com>,
 megaraidlinux.pdl@broadcom.com, megaraidlinux@lsi.com,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Saurav Kashyap <skashyap@marvell.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Jason Yan <yanaijie@huawei.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Mar 2021 14:46:01 +0000, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (30):
>   scsi: megaraid: megaraid_mm: Fix incorrect function name in header
>   scsi: megaraid: megaraid_sas_base: Fix a bunch of misnamed functions
>     in their headers
>   scsi: fcoe: Fix function name fcoe_set_vport_symbolic_name() in
>     description
>   scsi: megaraid: megaraid_mbox: Fix function name
>     megaraid_queue_command_lck() in description
>   scsi: fcoe: fcoe_ctlr: Fix a couple of incorrectly named functions
>   scsi: aic94xx: aic94xx_hwi: Fix a couple of misnamed function names
>   scsi: aacraid: aachba: Fix a few incorrectly named functions
>   scsi: pm8001: pm8001_init: Provide function name and fix a misspelling
>   scsi: aacraid: commctrl: Fix incorrect spelling of aac_send_raw_srb()
>   scsi: bnx2fc: bnx2fc_hwi: Fix typo in bnx2fc_indicate_kcqe()
>   scsi: pm8001: pm8001_sas: Provide function name
>     'pm8001_I_T_nexus_reset()' in header
>   scsi: qla4xxx: ql4_os: Fix formatting issues - missing '-' and '_'
>   scsi: pm8001: pm8001_ctl: Fix incorrectly named functions in headers
>   scsi: aic94xx: aic94xx_sds: Fix asd_erase_nv_sector()'s header
>   scsi: qla2xxx: qla_iocb: Replace __qla2x00_marker()'s missing
>     underscores
>   scsi: aacraid: commsup: Repair formatting issue in
>     aac_handle_sa_aif()'s header
>   scsi: lpfc: lpfc_sli: Fix a bunch of kernel-doc issues
>   scsi: pm8001: pm8001_hwi: Fix some misnamed function descriptions
>   scsi: qla4xxx: ql4_mbx: Fix kernel-doc formatting and misnaming issue
>   scsi: bnx2fc: bnx2fc_tgt: Fix misnaming of bnx2fc_free_session_resc()
>   scsi: aic94xx: aic94xx_dump: Remove code that has been unused for at
>     least 13 years
>   scsi: pm8001: pm80xx_hwi: Fix a bunch of doc-rotted function headers
>   scsi: qla2xxx: qla_gs: Fix some incorrect formatting/spelling issues
>   scsi: aacraid: rx: Fix misspelling of _aac_rx_init()
>   scsi: lpfc: lpfc_ct: Fix formatting and misspelling issues
>   scsi: libfc: fc_lport: Fix some possible copy/paste issues
>   scsi: lpfc: lpfc_hbadisc: Fix incorrect naming of
>     __lpfc_update_fcf_record()
>   scsi: mpt3sas: mpt3sas_base: Fix misspelling of
>     _base_put_smid_default_atomic()
>   scsi: lpfc: lpfc_nportdisc: Fix misspelling of lpfc_defer_acc_rsp()
>   scsi: mpt3sas: mpt3sas_scs: Move a little data from the stack onto the
>     heap
> 
> [...]

Applied to 5.13/scsi-queue, thanks!

[01/30] scsi: megaraid: megaraid_mm: Fix incorrect function name in header
        https://git.kernel.org/mkp/scsi/c/bbb2c0374552
[02/30] scsi: megaraid: megaraid_sas_base: Fix a bunch of misnamed functions in their headers
        https://git.kernel.org/mkp/scsi/c/616f6d8d9e16
[03/30] scsi: fcoe: Fix function name fcoe_set_vport_symbolic_name() in description
        https://git.kernel.org/mkp/scsi/c/276f9aa2530a
[04/30] scsi: megaraid: megaraid_mbox: Fix function name megaraid_queue_command_lck() in description
        https://git.kernel.org/mkp/scsi/c/d4f5ae21597b
[05/30] scsi: fcoe: fcoe_ctlr: Fix a couple of incorrectly named functions
        https://git.kernel.org/mkp/scsi/c/dc173575097f
[06/30] scsi: aic94xx: aic94xx_hwi: Fix a couple of misnamed function names
        https://git.kernel.org/mkp/scsi/c/577c65b07a55
[07/30] scsi: aacraid: aachba: Fix a few incorrectly named functions
        https://git.kernel.org/mkp/scsi/c/a80218c7c565
[08/30] scsi: pm8001: pm8001_init: Provide function name and fix a misspelling
        https://git.kernel.org/mkp/scsi/c/bd1050e13889
[09/30] scsi: aacraid: commctrl: Fix incorrect spelling of aac_send_raw_srb()
        https://git.kernel.org/mkp/scsi/c/4c4b8cf5a109
[10/30] scsi: bnx2fc: bnx2fc_hwi: Fix typo in bnx2fc_indicate_kcqe()
        https://git.kernel.org/mkp/scsi/c/52ffc08d9454
[11/30] scsi: pm8001: pm8001_sas: Provide function name 'pm8001_I_T_nexus_reset()' in header
        https://git.kernel.org/mkp/scsi/c/62690c056ac0
[12/30] scsi: qla4xxx: ql4_os: Fix formatting issues - missing '-' and '_'
        https://git.kernel.org/mkp/scsi/c/ecef0c9e6407
[13/30] scsi: pm8001: pm8001_ctl: Fix incorrectly named functions in headers
        https://git.kernel.org/mkp/scsi/c/3978e59b6d6c
[14/30] scsi: aic94xx: aic94xx_sds: Fix asd_erase_nv_sector()'s header
        https://git.kernel.org/mkp/scsi/c/3528b9abbd06
[15/30] scsi: qla2xxx: qla_iocb: Replace __qla2x00_marker()'s missing underscores
        https://git.kernel.org/mkp/scsi/c/52bb80f18def
[16/30] scsi: aacraid: commsup: Repair formatting issue in aac_handle_sa_aif()'s header
        https://git.kernel.org/mkp/scsi/c/53616df28199
[17/30] scsi: lpfc: lpfc_sli: Fix a bunch of kernel-doc issues
        https://git.kernel.org/mkp/scsi/c/8514e2f1e2c6
[18/30] scsi: pm8001: pm8001_hwi: Fix some misnamed function descriptions
        https://git.kernel.org/mkp/scsi/c/6b87e435e4bc
[19/30] scsi: qla4xxx: ql4_mbx: Fix kernel-doc formatting and misnaming issue
        https://git.kernel.org/mkp/scsi/c/e39c31a7435a
[20/30] scsi: bnx2fc: bnx2fc_tgt: Fix misnaming of bnx2fc_free_session_resc()
        https://git.kernel.org/mkp/scsi/c/a7f4242d1207
[21/30] scsi: aic94xx: aic94xx_dump: Remove code that has been unused for at least 13 years
        https://git.kernel.org/mkp/scsi/c/241b37ac5859
[22/30] scsi: pm8001: pm80xx_hwi: Fix a bunch of doc-rotted function headers
        https://git.kernel.org/mkp/scsi/c/7cdaf12ea50a
[23/30] scsi: qla2xxx: qla_gs: Fix some incorrect formatting/spelling issues
        https://git.kernel.org/mkp/scsi/c/f11c8b42423f
[24/30] scsi: aacraid: rx: Fix misspelling of _aac_rx_init()
        https://git.kernel.org/mkp/scsi/c/7df1daed3330
[25/30] scsi: lpfc: lpfc_ct: Fix formatting and misspelling issues
        https://git.kernel.org/mkp/scsi/c/964bc8c4adb3
[26/30] scsi: libfc: fc_lport: Fix some possible copy/paste issues
        https://git.kernel.org/mkp/scsi/c/4a4db603d0b7
[27/30] scsi: lpfc: lpfc_hbadisc: Fix incorrect naming of __lpfc_update_fcf_record()
        https://git.kernel.org/mkp/scsi/c/3884ce1539b0
[28/30] scsi: mpt3sas: mpt3sas_base: Fix misspelling of _base_put_smid_default_atomic()
        https://git.kernel.org/mkp/scsi/c/e015e0ded135
[29/30] scsi: lpfc: lpfc_nportdisc: Fix misspelling of lpfc_defer_acc_rsp()
        (no commit info)
[30/30] scsi: mpt3sas: mpt3sas_scs: Move a little data from the stack onto the heap
        https://git.kernel.org/mkp/scsi/c/2111ba8781da

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
