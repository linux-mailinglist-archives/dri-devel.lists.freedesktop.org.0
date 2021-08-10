Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEBE3E7B97
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FCC898C7;
	Tue, 10 Aug 2021 15:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F40D898C7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:01:52 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17AF0nek010586; Tue, 10 Aug 2021 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=vWODrt1xh8NPqcAIzE6/xzmv7c7iWyKZuG2ZR0tY03Q=;
 b=RfXvNXk/dtIcp3VH/GH3+LRPY1LTg22Z9IeF0jQL3KVn5kGy18IaiRAIxG2fJrnnI0O5
 NdNWUlxRCgngUodwA6cYMP1kMpayeEOa8nco+wE/Yy+9JJKuc5p4pycmOPrH5XJ52iHH
 vDRbxTLcsczsNEJZSG6gQoHwqRUS+uGWeri1mTDj8FDv1box8HD1J6zFZKWOzNT0rH3P
 4h3FyR7uhY12OC2/2Fo/NvqRNYVGP2TdpHnMatrJID82q3rC6Xt9OoULr0d4svrO7TLK
 LiZZ8VKSYWhojzAZn2abLXUDyxb4pjh5eeItAnQBoPCiEW5d9a/9Out05BWcbHBt0ZYK Tg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=vWODrt1xh8NPqcAIzE6/xzmv7c7iWyKZuG2ZR0tY03Q=;
 b=fKHcEnfh+I8zvoiOlnns3Z5MiLVqhewuUaMD3BXqeDMENvhbo2bKtaW7BUvWFBa+A7zA
 3xPa/7UztZqvIbvxzyXTN47eSSxjFflJysosePyerKFvLc5WqVOxywFH/cZ1/1fNoHhD
 xRhiX37+OJ3GEspIilzB30j8mhnOjSM7cv8wHs8BJX+Ms/t2w5l/8Wxxi3W53E4mh/NU
 6P+Mk0YttFpF4JD7SgFmZI60cmcBca4dzwbehdw4Bys4Lz4tk19KCOh8q2dcDYRE2kxZ
 RYHnGlN7IMILGpmWQc1yHpMD6W7SEm9+Xf10yxuPDlxzqlg8itaW4sZ/qEWvzwU9VURQ BQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ab01rbv91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 15:01:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17AF08tx181893;
 Tue, 10 Aug 2021 15:01:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3030.oracle.com with ESMTP id 3abjw4jchw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 15:01:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1goktrvun7kYZtU5CRe/BH5BLkYed5rsrNUT2TD5ccr4g9I0h2SpVKTu97Qfk5vmwWqobEpCcfivDq7jCj5O+X5GjvnUbAOa5957wiwnbEA/KcBQSqX2Lo4CuWeRstYETYSjfATbMtSobQb9rZSriBIbX0Ju4hd13FKKlQ1LeV4UITwLb4z2jcSkz48p1SYopoB4pPfi0VAprF0ZW+QGEuwZiABLMMt3/YPc7fsO+KZZSmDvr3qx53LUVn1mn4+LGt6tbzUPzAzbH7h9cXnRvb8kCLEGsFqy9wTFQch5glWZUli20ZE4YF0x65zhgp/Z9Rjrmk/N59GwybP3QIP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWODrt1xh8NPqcAIzE6/xzmv7c7iWyKZuG2ZR0tY03Q=;
 b=n+ZQqIG0w+V2zQhgszq1avfINEBw48CDsQNehMWtR7fEyBF+z+QFVX3URvPj/ziLNNXcMyS9nQDThODmDbwHHCbW7Ry9lIhZ7/YxdVvYxrMl9I2lLfsyjtRE7uPTXcgNaWOS6DCUt9kPv+k69DRUDEg5JASjeJ76TUPyJbEeXOP3lQ3ROfxEHRFQVCTI8es33vTULOE6jM8zgrsf1DQ2t3Zcr4mb+aVql2Sl4pAXfQ4xBM3UVnk60XE0Ra5gSoRWQu/BOk8jLyQRL9YXHYh8Ua3WQRwrtek7ViqEdVs18i3896T1aML41EWM6kVxO3iNsNzVpy8Uh3AW5OKIaX612g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWODrt1xh8NPqcAIzE6/xzmv7c7iWyKZuG2ZR0tY03Q=;
 b=yUdARmnBJ5rfH5Prl+t7ouC1UNzVGXoqLL7hqqK3jBFUR6ndJgc5lUNbLuQ5Q+qLIqnNIhmzNyG345pjghbwYwK8KH4WKp9AqKMvouo8X1dXV5NobDrLrr2YZ9n/ZZ8RGi84MFcKl0G1kOqwTSCUO0gFSBjdA2ce3q4vykL/5Tc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4577.namprd10.prod.outlook.com
 (2603:10b6:303:97::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Tue, 10 Aug
 2021 15:01:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 15:01:39 +0000
Date: Tue, 10 Aug 2021 18:01:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: syzbot <syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com>,
 christian.koenig@amd.com, dongwon.kim@intel.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Subject: Re: [syzbot] general protection fault in udmabuf_create
Message-ID: <20210810150111.GX1931@kadam>
References: <000000000000263db905c934be32@google.com>
 <d7bd2585-ef80-d2ab-c474-acbe238c54a0@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7bd2585-ef80-d2ab-c474-acbe238c54a0@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNXP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 15:01:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5c400e4-dfbb-48dd-d6a9-08d95c0fc189
X-MS-TrafficTypeDiagnostic: CO1PR10MB4577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB45778D2D1A8B61AD69DB57D08EF79@CO1PR10MB4577.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UreYLnjNU9mChlOFuvkdlUBE2NI0V5WJ4LVB/pYCDblUp3cIeb0pB3/sra+NFOmucw2948gduYWNGOxLdFdvkCGdyPhBZUNcra8xPpdnGpggqxFNYlHS2BeZw1q5/soLng4r86XbGPS++jbpr222PQI/Dmzi5NsWEFLeEhVj1Qz+IxojxAEmDioFMWdiiyTq/WeKQLxvuq5rjPhhXsB/kymMIOvW+iuqLJ3884u83mKHzIBCdOdwd/lJk2zzaAI0Jaj7/jxEDDwQnCxrOOfQ1s5QB4wM1MJuTFVdZPHSzOKcCKTrPsNqvIucLcwjzWVIchRXCS9fp9wDHJTVDgjE1T+wlL6m31V95zSCga995n0SrxZNInsU2hOoFay33MxpUjq5+Jx0aX51L2B2tXJqLSpZbgHfwk+Q0+eQWWwxV0HYSkj6koQn8vwz3ecv3M5tsiJHvNqfpf10+F3Z+zGs8lRtllbteUc6Y0Qtt9PdVkOGH4tpfyFEGWvZ16mmOOUTa5qOnN72wekbs1rvjL4Cbdm+27LQidBstSRtId9TkPRYTG4q1+DHVgNs+aJ1HDokPROBCWrk0cSSH2XvZx1qBPhkAyD+T9Jmdxw5aQuafJaqKy3chWlLn5cwqO88z07CGqM+IfabJtbAkwdMkyVqeBqM61xFqOyIuq+cjUH4SmpCswOEWIy8j8HDs/Rsdc760iC7hw/TIvApUPeexWPutCibNQSvlkSAlFmjdr6MztqaogCueKJxE3znMgdEvFcMTxJNmUq/E4rLqCIRz8F0jIwmsOqC72KSbHwhCrS/GKfZXmL1MGq5BpoJSlgc1jNGoMOg377sLb0AvI2WCFHvIMb7SCyF/M+A2nJX7XLt5DE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(396003)(136003)(366004)(33716001)(956004)(83380400001)(9686003)(26005)(6496006)(66946007)(55016002)(33656002)(4326008)(1076003)(5660300002)(9576002)(478600001)(8936002)(966005)(53546011)(86362001)(52116002)(2906002)(38100700002)(6916009)(8676002)(316002)(6666004)(38350700002)(44832011)(66556008)(7416002)(66476007)(186003)(99710200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vd+ap5XVt64T+Kpw1uOq8esFDDzfG3s/SPbDE08kr+01Bc6LVauUqL/MNPPQ?=
 =?us-ascii?Q?3jHsEexoR598ZUD44W5fmHRsEhJajg2UEYgmwATlzvYMw4/aBLw8eeYUm4JD?=
 =?us-ascii?Q?sn9bPIpk49Sh9kXSEzFKOMcbVUAuoztX91AMetj3Za9dk2xOAV5aehnPR9jF?=
 =?us-ascii?Q?z3J2qbI+D+o+jq7Bko8TmpxL9LCsnKcx953YjOmAarFCvJqF5+Upf2M9Aksj?=
 =?us-ascii?Q?rxH7sXSwzKb+EUXVNIVA0llbmvU6kZ6W32ml4jMjd4JYKtb6tU8Wvl9UAawX?=
 =?us-ascii?Q?8thlTyboSX/xg/H0lC/36uGtqWispglKOBdeF3WgXoOEBBQp5T/uDt1qRz+d?=
 =?us-ascii?Q?/1NEVAzAltBwaXAmH7sQXgfKsdRfoWibYn59PVMhzsNuEzWerJZQHnNw8boO?=
 =?us-ascii?Q?LpUgLrpslPuRbW19mQYbgbk/n5m40miFONqWm1OU1UI229xTIOvdmG5LJz9V?=
 =?us-ascii?Q?EBDvfskUv5d5uNy4SUHLi1aIRnO0pYaM1X5hpRdPboY574barvDugJIvZhgs?=
 =?us-ascii?Q?GbJvdGWT1bF1WQzceFsiVeE57qHMi5+oL8eHp+jNafIJfLo5q6yH4Kq+ZOLT?=
 =?us-ascii?Q?+6EkbAWmmpd32CCA98+VCf+RRcSN4rp5PiQjiTEYREdAw8tivwQ6nQEjuzTD?=
 =?us-ascii?Q?fxKMjNCYIev6OQ1PpBz2NsCZsacbLDNZyiNBvgET35sLq4t0HxEL4NVlrMj6?=
 =?us-ascii?Q?xivcsc41sAFlS718Sj461DS7MI/OsGtcjw8rnXRZf6cjotR3wzze08wMamwn?=
 =?us-ascii?Q?rtZ4IjZ0z6RvjN0IS9nVyeBVAWf8Hx9IKOPBv11z1hkRlPC+UNBvEIIFOVfA?=
 =?us-ascii?Q?GqerzcIQfyv3jMysjaADmsVTLYqokzg+AEe4d4SU32j39cMCBlvwcE4qBD4c?=
 =?us-ascii?Q?D/p2k1GQ7EUrJSBd3rsGkAytNT+Ux27CI834EPJuu/S3TL5UgZDdC6ut1yU0?=
 =?us-ascii?Q?r0SzDPcfKfFHmu3RckYoP8if4Q5QC3Z1wsep135tup6Z8hreSUDzcZkxwJtp?=
 =?us-ascii?Q?1v6YH2Wnn7nzk0ZyG+DuBpzp9/A5s2Q6+ObxTIegfH0JuBvnBlq6H2tzbAmu?=
 =?us-ascii?Q?XQb3oeRWkNF4WbeNIPGBw+BQGks3Tdw/+hos+2yxRSz+p8EvE9DsI5dVz15P?=
 =?us-ascii?Q?qQcvgSdiRN4KAFB8fN4D2Jrqt05w8Sv/MzfSCkNL67nTStCNNrEeSmIDyCIe?=
 =?us-ascii?Q?DIkBv+tUWoNaQ1PDLsVcYuYea1QznnmclwGqfL2M7jyBwA0+udL+USMh9FqP?=
 =?us-ascii?Q?BnZasSjdZ8mDTFY9VzQCtoGkj8bL0ber6xST08yuncMxCWtMpB7l6yJxaBPz?=
 =?us-ascii?Q?ZQR+e+4tYHMkoDXPeHb8gfON?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c400e4-dfbb-48dd-d6a9-08d95c0fc189
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 15:01:39.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyQMhkzdjLxXEeTxy7kIlmF/KWCNj7rZIVVnGQ0uUg1pDpuo72toDXqtFD/KulgVAc3spI1wC37SM9LFtO2Nx9wyO/gPM98qcQDOPC884E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10072
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100096
X-Proofpoint-ORIG-GUID: 5mf2iG2RoznTcMYee_9gN3IopBC4LD2p
X-Proofpoint-GUID: 5mf2iG2RoznTcMYee_9gN3IopBC4LD2p
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

On Tue, Aug 10, 2021 at 05:10:56PM +0300, Pavel Skripkin wrote:
> On 8/10/21 4:47 PM, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    7999516e20bd Add linux-next specific files for 20210806
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10f15f8e300000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2f518e910b029c31
> > dashboard link: https://syzkaller.appspot.com/bug?extid=e9cd3122a37c5d6c51e8
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1181099a300000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b6fce9300000
> > 
> > The issue was bisected to:
> > 
> > commit 16c243e99d335e1ef3059871897119affc98b493
> > Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Date:   Wed Jun 9 18:29:15 2021 +0000
> > 
> >      udmabuf: Add support for mapping hugepages (v4)
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12f73dc9300000
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=11f73dc9300000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=16f73dc9300000
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com
> > Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> > 
> > general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
> > KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> > CPU: 0 PID: 6603 Comm: syz-executor127 Not tainted 5.14.0-rc4-next-20210806-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > RIP: 0010:_compound_head include/linux/page-flags.h:187 [inline]
> > RIP: 0010:get_page include/linux/mm.h:1203 [inline]
> > RIP: 0010:udmabuf_create+0x664/0x16f0 drivers/dma-buf/udmabuf.c:236
> > Code: 03 48 89 84 24 90 00 00 00 e9 38 01 00 00 e8 23 7a f7 fc 4d 89 f4 49 c1 e4 06 4c 03 24 24 49 8d 7c 24 08 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 0f 85 d3 0d 00 00 4d 8b 6c 24 08 31 ff 4c 89 eb 83
> > RSP: 0018:ffffc90002d7fc70 EFLAGS: 00010202
> > RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000000000
> > RDX: ffff888023f69c80 RSI: ffffffff847e4f3d RDI: 0000000000000008
> > RBP: 0000000000000000 R08: fffffffffffff000 R09: 0000000000000000
> > R10: ffffffff847e50f5 R11: 0000000000000000 R12: 0000000000000000
> > R13: 0000000000000000 R14: 0000000000000000 R15: dffffc0000000000
> > FS:  0000000000935300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 000000002000020c CR3: 0000000018d16000 CR4: 00000000001506f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >   udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:305 [inline]
> 
> The problem is wrong error handling:
> 
> 	hpage = find_get_page_flags(mapping, pgoff, FGP_ACCESSED);
> 	if (IS_ERR(hpage)) {
> 		ret = PTR_ERR(hpage);
> 		goto err;
> 	}
> 
> find_get_page_flags() return NULL on failure, so this patch should work:
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 8df761a10251..c57a609db75b 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -227,8 +227,8 @@ static long udmabuf_create(struct miscdevice *device,
>  				if (!hpage) {
>  					hpage = find_get_page_flags(mapping, pgoff,
>  								    FGP_ACCESSED);
> -					if (IS_ERR(hpage)) {
> -						ret = PTR_ERR(hpage);
> +					if (!hpage) {
> +						ret = -EINVAL;
>  						goto err;
>  					}
>  				}
> 
> I am not sure about ret value in case of failure, so I am looking for any
> reviews :)

You're right.  Smatch is sort of supposed to warn about this but
pagecache_get_page() is too complicated.

regards,
dan carpenter

