Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520343B343
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFC76E43D;
	Tue, 26 Oct 2021 13:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7986C89D5E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 13:38:51 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QD7IVg020037; 
 Tue, 26 Oct 2021 13:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HzbWZoC/hBeHBh6bMTbJa0C8ei94wHXeQOGLhFaJ9VY=;
 b=TnnaBooSdgwck6lfqJUHxt8WZJAcg4vqbAJLXJneBAebaJ63HajKHaEKGVgZURH2IH1L
 a4LXUQjDBRaOlLyDereTQCZOjU/shlbVrpGjsePYHhSgFZEsB+HV+/rsqG7YYC8LqrJb
 ToWpMRmL2IxHfRDpKa68mfq8jMWGGj0XwjvxqxsfW9kXVKbAto3vRAQpjDscN2cBiJW4
 TysA78rq5hGlWbMoW6HWi/jz2emym6VVFokG1sDjAwWcfTbWRa8x/bhGMA0gpiR1tj4e
 lLq+TzmR5h0dp6YdAy5aseiCIm3xm5/rvJtA6tEYM9sQRPU/gQzpNgB2gyNTHMOvrbIp rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4g13s1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 13:38:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19QDZVQN037895;
 Tue, 26 Oct 2021 13:36:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3020.oracle.com with ESMTP id 3bx4gb0qqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 13:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2pCuHauh5PXoUoUGP/oqWommqd0QGPz+K0UbMXBDrfQCgk52s5PPnvY/4fJINH41f8AindOk+JRT/hMobvWqVHCN3lifwedNzc1+h7wKq5n29X6usbzDqGvNpZGJQ4/ZCDqPqKsSB/4FS0U967UT11n5F7QdjxlIcQH4qQHWfuR+GgP5PsGC3uXubfX64uzPiRZ7eV2U+cWWlcV6efOjXAbQ+/sWAOgDmaB7t8ZnFZULUT2aB+RJLwiEWhFlH6IJLgZPLAasL1ucaIcamlfwwTQ9AJG4JQ+BNlbhcnqj4J/yGEdUZrb89Bq4kF0qxRNK1uLb9E/3pugCyMULAHtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzbWZoC/hBeHBh6bMTbJa0C8ei94wHXeQOGLhFaJ9VY=;
 b=HKamofZRcfeDf0ogQuHjFHF5QL6DerAbsqdZW7EfqahNiAhUZUIwhW9DKWAFQhG9OomN+BXG/+cIs11P2RGwQO2qe9pYHXmctAnm/78nUQ9RFTsu6fcjrEwWYLLpwmYULOX2WS4JqagzReuW+Wt8YqDWM++gyxUAch1B+H7gV6wDq1Rwr0ri7M/07RXa9qy//5lFQh/IVepPeLgAQmhmaqx8hZ0c0x65veTdvqV4Otihzz0B+Fk5M4F9B3q8mZ9RvRouX8pBKaaWlmI2KO07moRvd537cNFm1nfKf+z/QygoeMSC1lSwpm6ly66Apnq5YjWsb/kHRLO33mrIckWb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzbWZoC/hBeHBh6bMTbJa0C8ei94wHXeQOGLhFaJ9VY=;
 b=RkPmT13cMiFUi136wp5NH30/nJ6JocVTS7bmhrv5pmh5qPbyev0PUn01QZbty/ER1W+7jnDfQZehbHENTLPTo//l068/z7HQZf7io+kJvnCFFBjNWjzBv66zFt/J7zS2xLvM333hLpY4S+g5/2q8Rr+fCx8MupSbX9WhVLFURMg=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN8PR10MB3281.namprd10.prod.outlook.com (2603:10b6:408:ca::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 13:36:40 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 13:36:40 +0000
Message-ID: <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
Date: Tue, 26 Oct 2021 09:36:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com>
 <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:404:56::23) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.233.94] (138.3.201.30) by
 TY2PR02CA0011.apcprd02.prod.outlook.com (2603:1096:404:56::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 13:36:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f596f6ab-3f90-4b42-eef1-08d99885a3d9
X-MS-TrafficTypeDiagnostic: BN8PR10MB3281:
X-Microsoft-Antispam-PRVS: <BN8PR10MB32811F39E634C749BD62217BE6849@BN8PR10MB3281.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXo6p8t+of+pXgMrbqWaQT188umvlw3y5bS+tRWVH7c5mqBbsrH9ZcedVI0YunrGzdYu8XSx0vSlYDkjzYqD2lL3vmOlUochLFne6kl1TbRDcz18vQOMklHWJhH6fze4pxhtny+h9P9TVYGGfjggBRXu5gzR5C/8N6zfdjf5ynaErmUa+NCaM8iwd2vVjSYK9Akb5E0we/pO6tdAu/xeL8Y0j6q54s/AYu39KAusq9dSL0UhmWZT4/lf2y4PjQVu+fpW5FdRJgAxgnxzXaNq1QDBnCzX+AlAe752Rhqt6bqaeWwemaXSzUHLx/RPXn6eXk7/bKF1mMZMrcua5HoZ7zJT3VjACwuSchTNqoGdyfwuLz6RTN7gqCRO4GavCgJ0Xj7wFuWZ4jISDUWhAFdyowurAcOPJs/cjI6/JorPkBm23nLGOV6DhkwS/+mQJ/G6Boi4Sk/MQRkpnvGiKk5JN35khO4kWfecX10MV0mDWg9uNDIdUd1S4YxihvA51y8oOjcnOpub5xczu4f3IDHUFGHX2VmIiN/8T7llgVGIEDXly5deFoJp4Mjz7hcCddURZ9XUfazCfqoPPiGc1nFdqDn09LN3Hr9Qj1u5eSKeGz/qverDaF54YYomNZgOFju5Dz9RmQJ3168JaTn7vHzHDma2n3Wm8n91WP7xP+bDIS4aBy+ZhmzzFthobQRxztlB0ailtoqXUdvkrAJsfRe5PG5q+eO8skqtiacJOPxKhN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(186003)(6666004)(2616005)(5660300002)(508600001)(44832011)(6916009)(36756003)(8676002)(26005)(316002)(31696002)(54906003)(66556008)(83380400001)(36916002)(66476007)(31686004)(16576012)(2906002)(4326008)(53546011)(38100700002)(86362001)(8936002)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTlFYWpTWnpVSmx5K3p2THBPNm4xUFVQeTV3ODBuUmJZbW1HUjYyVkIybjdU?=
 =?utf-8?B?NDdqbnFNNGpKYlg1bjZaKzFNUGpzcFg4MFhFbjJHOXQ1TWNHRjc0aEhBdmlo?=
 =?utf-8?B?cWxTRE5uenlDcUZ0TWJETDliTi9RSVF6akhTZ1Y2cGNuZ1kxT1JncGNrV3R1?=
 =?utf-8?B?aHJ0TE1mMVVqQ21tQUtVd3VwQ0xuQ0ErdExOQVJhN1BkZ0NxbFVoVkg1eEVE?=
 =?utf-8?B?YncyQ25xcnFJaWFENjNDTk01T01RcW9xUHVwQ3NCaEhYK1E5Vm9HU056WnJB?=
 =?utf-8?B?b1A3K3FPZWo5QmVKVzI3bm00QUNFWmhCcVkzR0w2YmdCNjIya200QXNPbVhr?=
 =?utf-8?B?TU5BSGJLblBzOWgwY0dJdWdGbEdYTEFhMUY4VkJJRXVhd09zUkp3Vmh4L3dU?=
 =?utf-8?B?VytVaDg2cnRtNUdJaDZxZEp3YmhoZmdJdVBrNU5USzBtbVpTUUl3OFV0T0dZ?=
 =?utf-8?B?OWVuMC9ocEVmSnhsdkp6cEk5RzFZNCs3dys3b0dlQlVxZjFmbWowUnRVY0dI?=
 =?utf-8?B?VGNCM0tjL2trZWl3TU9pVDdGc3M0YjFWa0tETitYYmcyVXNoWkMzaGFKaG9G?=
 =?utf-8?B?NEdybW5QajVpQTBVRWJ3TnlTYmVoUm9hWWhqQnluMkJVSVdSWEpQVS83cGNI?=
 =?utf-8?B?Rzc5R3B4VFV4RDFlWERJQi9kVG14WDdpVzFZKytVYnlWNTB4eEM1b0Z1NXVH?=
 =?utf-8?B?Myt3WDlWOUpaVHhFeFN2bjBHeVh6RDlIN0hYMTJTUkZxWnB6MDFvcE9jaWdr?=
 =?utf-8?B?R2NSOXJOUXZTdldkVGdKR28yclVtdHZmZ1RHeWV5amdmREtQY3g4N1N2N29Z?=
 =?utf-8?B?NlZLdGpERVlsbEZhUTV5anRtZUdrV3YvOXRsdktTMFJheUZBNGtqcTN6ckVu?=
 =?utf-8?B?bVZBc2lXOGtLcVRFbTQzazNsT09HRUwyNmNyOElPSFB3a0tlU2UxazVSNXZP?=
 =?utf-8?B?QzU3ZlZHOVQ5eDBnNDduYTJsYmtxQXhPbEh4empmS1ZPNUM0ZjJqdXRCWUR4?=
 =?utf-8?B?bUV3Q01LeXB6djhzWGFYYXlaYlZvcDBWVS9oOGkrS2hlSXdFU0t6b0Y4blV4?=
 =?utf-8?B?a0tCMU85SjIxcXNIQUtibFZ4VW5MMW9NaWdMd01MbzJhaWZrZEk0OUMrdXRH?=
 =?utf-8?B?d1VmQ2QyRUVKTnJxdnVoVjBleXl6UHN2SmlabkJSOXJrTDhzUUFPdmZPU0RR?=
 =?utf-8?B?aXQ0c0VPdUN0YnRwc0lKbndMaEtJdGwxSWVSaUhFalVEQVVtVk4zZVBIVlJN?=
 =?utf-8?B?SmUyQVlzQVR5SVJ4emF0TFpKVjN2ZFpndDRLVVdyVkFHaitTZmNTTmwzUkV2?=
 =?utf-8?B?cjZWaCtsWDZ4U2wxT28zaU1YWG9KbFRXNWNjMnZOcXpQY3BzT3Z6VStlcHF5?=
 =?utf-8?B?enZ3YmVBMUpHN1VaQTZuZTdjeWJ4YlBaS052ZnpNcnh1NGVUY2xXSUZWUE80?=
 =?utf-8?B?WmxMeWJQa2NxUGEvakh0cmtoZDA2eXN2dW1WakU4RldCM0ZSLzZnSnhPK2M5?=
 =?utf-8?B?YUttYW1mV05pOGJnMmVITTNGa3BubGkyamdTclJWeXRpell2RzUzczhDVE5q?=
 =?utf-8?B?VjhyVVBZUit6N2xwS2hQSmVtemcxeU9QRFdldDNpSndRM0VvUEpucVZDWUV2?=
 =?utf-8?B?Mkx3SENFQy96Wjc2eUx1cTF6SUhaSW90cG9vZkZmeGt1ZHZBblFjNWVRYUdi?=
 =?utf-8?B?UGRHVCtsanVxUTlKWWY3RFRlQTFFVTd6U2o5YjZia1lFSnZIdUI5NEVNNXFx?=
 =?utf-8?B?Z2RBcXpTeFhlQVU1YWxJMFRpY1UrWm5RUEhQbkQ3SHhGVWpKMDM5djRHVzlo?=
 =?utf-8?B?cHNnS1phVCtRa3FCVjlETlJPdFNZN3pyajA2cmJhUXkvSXFmUkpiTVE0R1J0?=
 =?utf-8?B?cGJWTU5Sc3hoVHVQRHFMeHFqb0VWMDEzM3Y4Q3hvN0JBL0JQcU5Pb2x2QldI?=
 =?utf-8?B?WWZHOURabzJUSDJPdTNzNjZDYjdUUXkwenNhdEJFUkkwMkExcFpKZjY2QkY3?=
 =?utf-8?B?SWJFbkh4Q2d5Wm0zNG5HZ1dWSWwzS3hoS2UzQW5OdHluRVlBY2FBUDRKb1J1?=
 =?utf-8?B?ZmErSWxDTXIxeFNycGZwM0tpdWFoSWxLemNTUldld2FWMVFFdnowcXRQU09q?=
 =?utf-8?B?SDZqWGxZbHJXUE1Welo1MEpYK3o5TkM1Uzd6ck02RmY4NHd0ZnZYWW1qcUlB?=
 =?utf-8?B?YkZEaEpnT1VkQlNlUnBGY3I0UlRqaEVpcGVTalpaNUNodHZXb1dKblJQZ05s?=
 =?utf-8?B?NzdQRHFmRlFDRW5hWXlBVE9Kbzh3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f596f6ab-3f90-4b42-eef1-08d99885a3d9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 13:36:39.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+2Z57inQH1HEuu8rN+sSurQrQVyaj6HRz/UIzfuUxW3sYnf6o/r3y79BwL141GowKpEiqGw5SFT2eHtBLITVly9ale4qBYJlRNw/dIKFaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3281
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10148
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260078
X-Proofpoint-ORIG-GUID: n2rutvF6dnefhLBpBqi1Lt-ALV4msb_T
X-Proofpoint-GUID: n2rutvF6dnefhLBpBqi1Lt-ALV4msb_T
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

Hi Geert,

On 10/26/2021 4:30 AM, Geert Uytterhoeven wrote:
> Hi George,
>
> On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
> <george.kennedy@oracle.com> wrote:
>> On 10/25/2021 3:07 PM, Greg KH wrote:
>>> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
>>>> Do a sanity check on pixclock value before using it as a divisor.
>>>>
>>>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>>>>
>>>> divide error: 0000 [#1] SMP KASAN PTI
>>>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
>>>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>>>>
>>>> Call Trace:
>>>>    fb_set_var+0x398/0xf90
>>>>    do_fb_ioctl+0x4b8/0x6f0
>>>>    fb_ioctl+0xeb/0x130
>>>>    __x64_sys_ioctl+0x19d/0x220
>>>>    do_syscall_64+0x3a/0x80
>>>>    entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>
>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>>>> ---
>>>>    drivers/video/fbdev/cirrusfb.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
>>>> index 93802ab..099ddcb 100644
>>>> --- a/drivers/video/fbdev/cirrusfb.c
>>>> +++ b/drivers/video/fbdev/cirrusfb.c
>>>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
>>>>       struct cirrusfb_info *cinfo = info->par;
>>>>       unsigned maxclockidx = var->bits_per_pixel >> 3;
>>>>
>>>> +    if (!var->pixclock)
>>>> +            return -EINVAL;
> This is not correct: fbdev drivers should round up invalid values,
> and only return an error if rounding up cannot yield a valid value.

What default value would you recommend? Here are examples of some of the 
possible cirrusfb pixclock values:
40000: 25MHz
20000: 50Mhz
12500: 80Mhz

We can plug in a default value, but I believe it is just covering up the 
fact that an incorrect value has been copied in.

I would think we would want to keep this driver consistent with the 
other fb drivers that return failure with the incorrect value.

Thank you,
George
>
>>> Shouldn't you be checking further up the call chain where this got set
>>> to 0?
>> The same pixclock check is done in these fb drivers:
>>
>> arch/arm/mach-rpc/include/mach/acornfb.h:    if (!var->pixclock)
>> drivers/video/fbdev/asiliantfb.c:    if (!var->pixclock)
>> drivers/video/fbdev/clps711x-fb.c:    if (!var->pixclock)
>> drivers/video/fbdev/core/fbmon.c:    if (!var->pixclock)
>> drivers/video/fbdev/core/modedb.c:    if (!var->pixclock)
>> drivers/video/fbdev/cirrusfb.c:    if (!var->pixclock)
>> drivers/video/fbdev/kyro/fbdev.c:    if (!var->pixclock)
>> drivers/video/fbdev/riva/fbdev.c:    if (!var->pixclock)
>> drivers/video/fbdev/uvesafb.c:    if (!var->pixclock)
>>
>>> What logic allows this to be a valid value?  What about all other fb
>>> drivers?
>> The "check_var" function, which is set into the ".fb_check_var" element
>> of the fb_ops struct, should do the check, but in the case of cirrusfb,
>> that is not being done.
>>
>> All this patch does is add the same pixclock check that the other above
>> fb drivers do.
> Indeed, several drivers are not following the rounding rules.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

