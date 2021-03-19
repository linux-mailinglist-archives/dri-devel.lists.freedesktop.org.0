Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EED3413EB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 05:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8F6E979;
	Fri, 19 Mar 2021 04:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 814 seconds by postgrey-1.36 at gabe;
 Fri, 19 Mar 2021 04:00:42 UTC
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A4C6E979
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 04:00:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3kwC2112410;
 Fri, 19 Mar 2021 03:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=NxNC+xUGROwOm5w90ny+8qdZvcMzo6fzrBms4oJbE34=;
 b=aV5CszRIpqD7CN+fIh6zv9BzFZLdFEcucTwtDj9wjDja13GLqSSpIAPEfTEplLwJiGDA
 tGGiKC4DNBs61DhFp7zNBmBJEJlk4BokxribGNDZJ9EhpbCz7GE0f2ErIfqXggINUTDK
 AMh/AOi/8QdVk1OsVLfuvOzU/GszwV0liDrM5HaBF3tGGOE9GkrfRQPegDNsgovn68WG
 dYO3hSz1YJLd+URS9wpQiohLmfJo+yGx81Dxqqd+RwfiT6pg7Akg0AVmQh9tokQcBsg2
 M1Db76D2s0my1fR1xBYlMnFOBO3pPtRjOJtRhBdJkwrEgLspAwH4N4yQlP5kbvSBfwQZ wQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 378p1p1fyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 03:46:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3UpxE154019;
 Fri, 19 Mar 2021 03:46:57 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by aserp3030.oracle.com with ESMTP id 3796yx0edj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 03:46:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miC+pIxStk/SKYknGILC7bur0hFlN4NpvPo33Jmh4yT5ZIp1Ci6uu73rH29yvLxtUX9PCdH8tj5gde/kk38s6FZujtcYe4H2eoH+uLwkB1HLIVJUEyt0HPdfHvRMP4SYInYuy3K51aEnulZ6twWF6yDksqWwd8sVCI+3hfCW4i+HYwxp354jJqOxNqIZGw6/ScpBzRVKRa5U1/nr254tJEfjSSm1ehhU1tZH2PoMZgxr3JR6ke5FW9QndjH4AlyxpGupWZ9sjLamDfUeZVa436Z1UoipVATEDqFerEXyQc9TfL/a5jSzvM13bGYnjO6UKdnFIUh/pkSx/DWq7sKGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxNC+xUGROwOm5w90ny+8qdZvcMzo6fzrBms4oJbE34=;
 b=W7+v7UnJzul8jMObPLb/9QOYKbHnO4ZIzb76YH+nskAFUUnwieFpFzMKOM4kc/rOiLfPemNldiUfkt9jlblkeHE8Co03KE5kopml4D7K5c7JOrP0KSgJgVQXYU+n/pofAbbr3jyt53WK/jefJ5pCFC55CUgJCXhcsZAoawiU4l8hSu1EvW9d4BC950kpM3OysGWIzWqZkbPIQu5FcF4R8g11AE3sqJ5E2IbFLsvPWjdFBmrJZ9kcwJ6jDYGN/AyO9IbfsUj2hclop6CRUZQ+in7V24BhglseMPW9rU/puXq97HIcRjMp381BwLQEYt22BztlzJrcZLiqJNCyWjQ/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxNC+xUGROwOm5w90ny+8qdZvcMzo6fzrBms4oJbE34=;
 b=vplb7WDgwST0J5ZKAU7oDnj2RQhqCMd0bbiWSV9v8WPvR6pOISgjwsnJQvTQaURnSEtYhzFrjmAc8w9tjD4Ew3jXoKKIdlMcL1fXzhL3mle04zUzScsI8P6d/9oLCe4AmHj8MP6f0laTHPJ8lCQ2KZfRHkTkbhzvDHDqkOF9cwA=
Authentication-Results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4616.namprd10.prod.outlook.com (2603:10b6:510:34::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 03:46:55 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 03:46:55 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, jejb@linux.ibm.com
Subject: Re: [PATCH] scsi: csiostor: Assign boolean values to a bool variable
Date: Thu, 18 Mar 2021 23:46:35 -0400
Message-Id: <161612513551.25210.2632381348720541366.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1615282668-36935-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1615282668-36935-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Fri, 19 Mar 2021 03:46:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66dd0c3c-d40e-4b10-8c83-08d8ea89a39a
X-MS-TrafficTypeDiagnostic: PH0PR10MB4616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB461629EFD4D5931EC94AA7F58E689@PH0PR10MB4616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSuIexVzSCZkDpfHd+uR9LI8QKGVqdZDYTz3ENj7rHNhV3Zvm7jJ4sxYjyIRUqpXhgRTMm+6Jvoj2m/LMof1vSxNEigAmQWyiREbRJV18TbwflRjzbjH4vNEJ9jBkyAmqOINa3n6A9+jHBCPScbgN2iNb/oRmiALaiH+G7xDjse7z+09lcWMVRCc6dIfZ2xnp+A7i3dRM+NruSSAXdEzIWV3OkI14rK8+BHnStkCXYzHNlNJGYmdCBWxl70m1EDUWkVf0IVYU6fDzUZQWtuy4Xkio5NXt0aTz1hvO7hDuF/2E7dYufMFvoJCRge4/mx30pPDcViNGpFws+vAgLPsNeaFhMQHyzNC/3qjNGxtdIk4myUBMU9Ij4VXEFUzuTCSX+6t8c/6qCOYma9uZlvjE7UkWhum0ZgdSueJB2HSG+sxk2bmfvjmhkIfjn/ikYMEynwN4hvEjvoLmj7xJo1lKDxLfr+Ys858fAGpJ0YSPDQ22aZoBq8VDwA1oN6+luD3p6hYVNTLb96sAAKms+wYCJFP8o9rJPLr2D6zCdpqVv3aMMa/mpfj/FW8+5DhkcJh499+h9dFBeTH9EidU1ba2MHkHFKwCiVCMk1AaYa/tfR1zehGmS2DmcMweEyC0gmOf0pwdClUZUfdRdJ1zQL78w5rcsXiltncI2+HrJed2Ffrv3CZCRIfSwC70rJRdvqvjgDIKr4935xL3hKaEMHFTObzOwnCJjP+OINNvkdQw7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(39860400002)(366004)(396003)(966005)(316002)(4326008)(478600001)(4744005)(6666004)(66556008)(8676002)(103116003)(38100700001)(8936002)(83380400001)(186003)(36756003)(6486002)(16526019)(26005)(86362001)(5660300002)(956004)(2616005)(66946007)(52116002)(2906002)(66476007)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGU1Uko5eUFkdzJvSmtxUm1jM3c4ZWYzcXFCbkN2OEtmVkR1QXQrYXFPMFpQ?=
 =?utf-8?B?M2RHUmpYQTNsQ296UlJHcVNXYSt5OTVFbGMxdnRJejdBWkEraFBuTlgvOHdN?=
 =?utf-8?B?Mjk0YkFuTEdORWRWTkZpVTl0OU02NnNNMkhpTG82dEliamVkMnM3R0dnT3d0?=
 =?utf-8?B?TFJzVjUveWNDT24xN3dmMk5pZEVaajJlbm9STE5yR3doazRpdHNnUWdIaGZK?=
 =?utf-8?B?bXVIWGl2L0RwaEsvWFl6emRBTy9xZkx3NmIyQS9hbEZSd2NqZmgzM1VRemZE?=
 =?utf-8?B?cG1mU2RWOTNyS3NRbmZrYndCWENMRlJoVWZqcHFGbit5Ky9ZZ0NkRnpQbjRV?=
 =?utf-8?B?TmgweHhzM0dFTHpFMnRqRm5CcTFoRkFDRHZRakJ4UzdaMTZXRW1LRWJnYzNV?=
 =?utf-8?B?VHZ6dWd1dXJqbERTTkxDRkJsaU1WdDh2ZzF3QjdxQmtlOGQzMW5IMWJkaXdT?=
 =?utf-8?B?djh2TS93S3dJL0ZpcjIrb0VZSGRGeENrMkNqWEh2WHB3dklsYlZBZUhLbWNN?=
 =?utf-8?B?RDBjcTh3cnVSNTFRb2JzRDhpTTZTOXErZkk1Z0w5a2p0L2NibzVMeS95TWdE?=
 =?utf-8?B?YkdkaVB3Z1JIMFhGRE9rSEVtMHFoL3dZMUZ5ZXlTWFJEM3JrM2w0aWhQaFpl?=
 =?utf-8?B?TFNUQ3BTcW9hK2ExMHh6Y25OU05vZnR3NVRaUjEzOG5CUC9HeER6OWFaTVhH?=
 =?utf-8?B?cVVwT2pkZG9JeUhqbkl3aWZQUEVMeWFiM29obENXRnlRYkdjQWh2dTB3ait5?=
 =?utf-8?B?dGtoM0UzS01zcG8reVgzL2ZkY1c3dE9neWdSMDljUHpmSkJEZ2FyTWdMYWlN?=
 =?utf-8?B?NEx5bFBDVkxVcVk3NnNQMUlPODl6NVd0NHo2MG85U080NDBsMzR6MENSTGJJ?=
 =?utf-8?B?WFdodzNRZW9aV0FtR0NxN21ycFhWZVJNVW44S28zUlpNeXhnS2dXT3BpcW5L?=
 =?utf-8?B?Y2pjQkFlTEZBRzA1ei9lNWZOZytydUxjMTFZeXNUNDFmZEhzbmt4TG5sQmN6?=
 =?utf-8?B?RnMyVTN2LzBsWnppeDBxZUN1SWlwdENEekJ1VGFNOG9sdDN3MVJhaG50T051?=
 =?utf-8?B?dUNwOHlBcHZ2bE84ejUzNkJJSzdlL2I1WmlKZDlPUUMwYk9kZWJUdlI1eHFt?=
 =?utf-8?B?VlRXOHNBcVp0dmljcXBwVEM4T0FJMm1GNk5rZ09CSzF2dkttZXcyNXRsRjlN?=
 =?utf-8?B?TnBCdW4raitYTERodUhreDNpUFFQMlNER0VQWUFXWEovME96MlZSOUpMUTQ2?=
 =?utf-8?B?Y3BNaEs2dElDUjhaRnArR3V3ZUNpVyt5WlBMdk5xVFB5RWh6MGFQU0JzU2hX?=
 =?utf-8?B?TmswMHNwaWRpeElNTU52d2lrWk9QM0s3Yi96eklwNjI3VzBpU3I5cjdrbXN5?=
 =?utf-8?B?UFdFNnl6WVppS3kvelV2S1FDakFxRFlyS2szdGRuYzhRL291VGQ4RlZvRXJx?=
 =?utf-8?B?VWg4TnNyMXhDN0kvTHAvNEtFZ1pOWlNCd2w3b1dSNUhwdU5NRmtQdzl5a2Vz?=
 =?utf-8?B?YmhOcld4THhLKys0RXcwZ05aVnJmcmVkYVNscER3aW5DUFh3VGFoZGp2S1ZG?=
 =?utf-8?B?MWRvbkdYTmdWdDIwVmZ5Q0NnTFp3aUE3eVdqbUFncEFlSXliQm9kdXlXYWNu?=
 =?utf-8?B?RGt3QUdobVJPcTF0NDNhWVJLSkc4M0NiaFhVcjNNREgyck5QMWU1UXM4cm9s?=
 =?utf-8?B?L1Fyd05UaUZlbHA1NkJwWXVBWHhOVU5pQVNQSktXY1RpbHVxeXh3eVYwWU5k?=
 =?utf-8?Q?BDzY6jeXd1UveO3hC6jmyu8ospv+cqFobdR9Ozn?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66dd0c3c-d40e-4b10-8c83-08d8ea89a39a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 03:46:55.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXiKe7Rkvon35oemNjeglm8pSz3zcjWAZaJHswVNTUSuDhk76DrA09OqSm8RtO6lfghS184z8Dm9KSArjY5Qmu9KK497SLEdyDYYbzlxFFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4616
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190023
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Mar 2021 17:37:48 +0800, Jiapeng Chong wrote:

> Fix the following coccicheck warnings:
> 
> ./drivers/scsi/csiostor/csio_scsi.c:150:9-10: WARNING: return of 0/1 in
> function 'csio_scsi_itnexus_loss_error' with return type bool.

Applied to 5.13/scsi-queue, thanks!

[1/1] scsi: csiostor: Assign boolean values to a bool variable
      https://git.kernel.org/mkp/scsi/c/2ed0fc2b9a79

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
