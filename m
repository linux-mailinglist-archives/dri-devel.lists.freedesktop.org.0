Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEEA4547B7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 14:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B98E6E197;
	Wed, 17 Nov 2021 13:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4709E6E197
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 13:47:40 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHD5O9B009089; 
 Wed, 17 Nov 2021 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1FDhe4fzU0KvGay0RAZ2jkFuVeJ+zuHF452BNSMRCvs=;
 b=SRlnl6Qc6CRx2rV4aUSbaQuQHXJlyQQe72e1wTaXjUBc1nUXfMOookRVHwHL49JSUq98
 Grwcf4WSqtWdrRTdbK562WeTUYpwV/yVua+R2JZyHjbm7WvFQECIWXpBoWFasxwY77wx
 1w+VDZRuag57Kynh9SXKNJafM0J6pb6kHBCWj5HtbiYeCJfCudZqo7+32v0Zb0ejSn90
 JCvWZvZPrOdrdRpnWUW8IOPb3Ur3xjHVjsVOzZPgiShn+bwJiObY3a0vNTa8S6m1xcLl
 rveCyEdnLE5bFWESNXQvPOk9DQy1jCJHesQbbTO2zsCoLn1Wjn0ZzgPS/236F8t6yhmb GQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2ajg864-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 13:47:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AHDehfR158474;
 Wed, 17 Nov 2021 13:47:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3020.oracle.com with ESMTP id 3ca566yde7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 13:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmiOq28NBzC/CZhreEx+CvYAfeIVhrDKdUD4wXtbEgRbD07CiyzWSyOm2B3f/N4AQGqsycFb3at98hN+wy5wBz6mx3iyWMuZhe715OU4G0qiZTbELiDFhf1MuXtCVb1HV+imHUxKP3rzGLcOR+fzClGqkNrB/1rtq2ECZkuDJzqBPuAUAcC9hirSZFXjQIMEVy6x4PDKeN3jJSXndriOI/o5jgoDfVb2iFM9r1N/MuENDz27qGei6Txw2Bz5hWAtl3svyx1XfkcJH0+qAXAOl5QVFxr4gw6geMs2fvNArseYznRCR0YLiXAZ/nEDxL/hPCvBKgIAO2bPeIUN4tSMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FDhe4fzU0KvGay0RAZ2jkFuVeJ+zuHF452BNSMRCvs=;
 b=SWsiQ98JkMbDmgN3mlVxh4QlKugy8ArzOs/BRDS5cyCx7nPrsb+j+4rHIxwZms7mwpG2MMWqZK64yXWyTdPm7xP2sjNX+xI+RYaSTz8iA7sA6/Ld+DSEMorH/bzSgyK1Fqm5++Av7CuMA4Xu7BnqhlHSy0V1XB4dBbM8gAU5lYPStu3V5sKMwQd/oAXKRpStNsqphHWRk3NHrbYFMl2A5+vLyHatiJlbuLrPaaROwuMadzA7S9RJbdQzGyla3+JZXPZLtvuSW2tsZaKPKoVv6HPjSa4tiC7Xy5GmBB4thJvld4AoQPEVm6OM3SmcfyqehWP1fFKA85Sw+yk/Httz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FDhe4fzU0KvGay0RAZ2jkFuVeJ+zuHF452BNSMRCvs=;
 b=ivlC+HY9RmYB+ID0TexH76bA0jim5dBMLfB3XGtc5aMjjOXNBGY16OcMDhrX0vWz8QcpYOu+QRrsgWJ5Zisz+zkc9+cqg3UBRWOsI1sBSnkTUdmMADYwu9wTkx0OL2EJQCXfHFnfoUIn2z9SZ+rB6y553IfVsvAFg5R8kRxvTyU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1776.namprd10.prod.outlook.com
 (2603:10b6:301:4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 13:47:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 13:47:31 +0000
Date: Wed, 17 Nov 2021 16:47:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: xji@analogixsemi.com
Subject: [bug report] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP
Message-ID: <20211117134720.GA6968@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Wed, 17 Nov 2021 13:47:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ddb2eb-aea4-4fbf-56d2-08d9a9d0cd71
X-MS-TrafficTypeDiagnostic: MWHPR10MB1776:
X-Microsoft-Antispam-PRVS: <MWHPR10MB17768F42AF395AB4C3A0EA468E9A9@MWHPR10MB1776.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zSuBfofwJRlWu6sgXrB9d2lU893y0s/KhXCpDkUmNjZRA48fAymm1mAkxcm/UEldEocbkRjH7k4cS+nbCCiUkvw5O+qV+uNtMUY1VRYFQR+kWLNs7xP7JoLgDuT8IO5BN00FvENFrksE+0zxKMaHsZs2yNZt2xaBmMYG8V7QE8dGpr78hxXNiBdPfbHSet2AsacvqvxJt0XLLQQWtPLaObFvXhQcVmjtLqW+aSbpf4HLoHnuig9R2Hjjv7y9cZiOj7CqAa/DXXx1VUpZLTxr5+mUyQnQc4Dh0M1Nv8zRGkQQXRkb+G9N81fUPST3w9nKW4nMW6BdfeTGh/3UOwbXOwTRmcVSQhFkUJGpkJk8zIltDz0GrRB6AM2+IfuaMKhnufofKyJ7xM1SbAzBz8QO2oRwyJMPD0FAovVA6VsLqAEimvPlxYhZRYxI5IBJe5C3xIOiyeF5h1NdUZR8dPcF2mo9lodonZTdleYSPBlan4lVeVOv0bkw000Um7pInZQFSp+E5v1V7iGW+9qsJeAOXIRL2XFORHWfM/t+vg1kUxCii2G8OfWLwbigUVqeaULWKe6VDko18HFmYvwCa6XqOWND3fHMDSln6Na9XyTkTp+h4KPvME0LPmVYqTjyR5q8izGWhTVsdQw9TgsqPzb0xWA5+HGF+gw3w6ACCqQMEBCpdvW1y8HgyOsLsVVwRfi6cl/O9VWJj0m0AfXXXeiVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9576002)(956004)(186003)(1076003)(83380400001)(316002)(508600001)(33656002)(6666004)(38350700002)(66476007)(6916009)(8936002)(38100700002)(8676002)(26005)(66946007)(4326008)(5660300002)(2906002)(9686003)(52116002)(6496006)(66556008)(33716001)(44832011)(55016002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UwTz9fms9sCxc6ndPEYNIHBMkasii5y5RjdEWY5ERwVp6Z8WPCuAfTuD6HEd?=
 =?us-ascii?Q?mvUjYPtd/tk0zcQvPb5zzpkhPYauDyKx+F0LUAOYYgLYW7Q/DnZ9MFXFQplj?=
 =?us-ascii?Q?CApE4gpOWPE2ml3t6rQmY3kEPIfhih7JdkP3vC9A0wxB/1/fNGciwbRq6e1z?=
 =?us-ascii?Q?bWMnN5mpDNuPqV4HauzL/U0ergh8pdd3JUDZzVgqZRdLO64VkunNa6GoSTtb?=
 =?us-ascii?Q?yleKGxtkFu/Jn7BvQmr/uljhzFEfD3P1+29RcOrz5EY+VUqCS1S7V7YuZiwS?=
 =?us-ascii?Q?inHqalBW6BYdC3opkHzlLibp8Z5RHobIp2aAVrqjsb0k0G46NIlRjslo1X4R?=
 =?us-ascii?Q?eV2WLOyBYgk23qR+HWGybF37pkogARSdHSJ4Gex/z8NUKcF8bKFDLg6sU39C?=
 =?us-ascii?Q?qUoFDhUxcOTIEqGxYgMSk9yHnX/QHlUovVN3Xievp1IpnXDGvOEndnwYRI/H?=
 =?us-ascii?Q?oINvmJU5v40xiWSUIPeVPrwWYusutCn8+YQs+qzHqucbDjAilh3kGildvDXq?=
 =?us-ascii?Q?SpJyJdsB7AapYQCQkhfo0DOZrwYirfrJObhddRAgWRnNA9hhZLap0JiMmS4p?=
 =?us-ascii?Q?F5jNOP0KXdZjcLS1JaedM3uu7UgbmrdveWcmtDalP8CpDyJaWs6FO2rCx2oe?=
 =?us-ascii?Q?q6PzHFwLolju9x/ED7GwpF/89TXFtJsBoA03sQeEJ/w1+Vhfj07w8gcEiiw3?=
 =?us-ascii?Q?nyRz9H46Wb54WGQSd5zwl83ZjOMe9I3QNKFqAF49ijFxx5DPqbHJDkpZfSJs?=
 =?us-ascii?Q?kTBrUiDMDN6OpGpFXiZLHr10QgYtYWDz+ikWbp9A/sUylevqseR5DD1u32Kk?=
 =?us-ascii?Q?zhlvbuGbgjapAVRn48OuGUtkPL2aWxtN5nbisBYcjFVpP0DjE188Z+ME4PYN?=
 =?us-ascii?Q?KgCakoM2oOfw87ReWZlKGAHbAn81q6Zge9uuja8timlw0wDv8Rxaw0z0s6ql?=
 =?us-ascii?Q?DwDBJTPuokLCUjPvG/3HAq8xkxMAb4b1MwcBPDJ7GM5bu/BZDWeYK3Md55AF?=
 =?us-ascii?Q?jlHLdZnEk3huWpI3inuPhz+c/coF0SFDFG6ox9Qr1i6hJ+OJ8Ig62QU3nS4S?=
 =?us-ascii?Q?kcYy8cEbLimS30qR+X+e3YrmVlZkXAM/51IhaOt/EPrP2IzXUeBDrOCn6kB9?=
 =?us-ascii?Q?OEUYB4cEh6HL5I+92KQBap16Ep3N9YdkqPYE4qDT2cc5Vq8A7+mU8BVPOl9M?=
 =?us-ascii?Q?7dsKI4p1+hnpBNxYxrkv50dG7vjc6GO3GDAYobcLkHUeXwNcrH0NoD1BQXie?=
 =?us-ascii?Q?dRf6xbUh+LfiiU/A3Eoebj9wFmadqblK814iLxA4L+S4LVJ0jxdxuQwLPUd/?=
 =?us-ascii?Q?WQRblF9j1fJ4iiR6/FWCGw6feb2kRVGzgxzHdVRtVzLuSjO9+Bbxg5jcXB71?=
 =?us-ascii?Q?9l2Y5u4ZTFMDlTRP261NOgZ800wBIB1gdcD7Y6HyrmOevrnA68j1pqwLulC1?=
 =?us-ascii?Q?MqI2gRXfWGWEFz9axq3C+3XLYlPU0eqvZEguKXWOKC8ZVNQUDypze+KII30B?=
 =?us-ascii?Q?q7f9DIm8UtFMe05mndLcnEykQLgIuH9aHTODOIjZHbdT7VZeMj5PjZ3skERf?=
 =?us-ascii?Q?pd9XJMTijJ75qRiRxQB3rTV4HXy4VCND4wjKDRMohQeoFSigyV9Sj89tyOKr?=
 =?us-ascii?Q?N7uG1LiCuzVot12h38G6KKaYRYCox18/koVvcW9Iy+UzjxvR/rO1fEwxPD4i?=
 =?us-ascii?Q?OKyNVmoWrnX1ldHRL5NCC74PCtM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ddb2eb-aea4-4fbf-56d2-08d9a9d0cd71
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 13:47:31.6043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zh9frtA7EWuoM1RHHViw/PqMFJqi2qldX4EmBOmg/kdCcm7uqthwRSGBUHQTcSwAQFJWutAQeSlfC5Un0H01l4mCAQE9AkChlxeV7sAKDbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1776
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=899
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170070
X-Proofpoint-GUID: ugSPaGuERYP0tlyqifkluZ6Cp3KR1guu
X-Proofpoint-ORIG-GUID: ugSPaGuERYP0tlyqifkluZ6Cp3KR1guu
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Xin Ji,

The patch 8bdfc5dae4e3: "drm/bridge: anx7625: Add anx7625 MIPI
DSI/DPI to DP" from Sep 18, 2020, leads to the following Smatch
static checker warning:

	drivers/gpu/drm/bridge/analogix/anx7625.c:1050 anx7625_init_gpio()
	warn: 'platform->pdata.gpio_p_on' could be an error pointer

	drivers/gpu/drm/bridge/analogix/anx7625.c:1050 anx7625_init_gpio()
	warn: 'platform->pdata.gpio_reset' could be an error pointer

drivers/gpu/drm/bridge/analogix/anx7625.c
    1037 static void anx7625_init_gpio(struct anx7625_data *platform)
    1038 {
    1039         struct device *dev = &platform->client->dev;
    1040 
    1041         DRM_DEV_DEBUG_DRIVER(dev, "init gpio\n");
    1042 
    1043         /* Gpio for chip power enable */
    1044         platform->pdata.gpio_p_on =
    1045                 devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
    1046         /* Gpio for chip reset */
    1047         platform->pdata.gpio_reset =
    1048                 devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
    1049 
--> 1050         if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
    1051                 platform->pdata.low_power_mode = 1;
    1052                 DRM_DEV_DEBUG_DRIVER(dev, "low power mode, pon %d, reset %d.\n",
    1053                                      desc_to_gpio(platform->pdata.gpio_p_on),
                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^
    1054                                      desc_to_gpio(platform->pdata.gpio_reset));
                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^
This will crash here but only when there is an error and debugging is
enabled.

    1055         } else {
    1056                 platform->pdata.low_power_mode = 0;
    1057                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode.\n");
    1058         }
    1059 }

regards,
dan carpenter
