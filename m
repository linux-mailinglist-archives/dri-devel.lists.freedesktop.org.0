Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013242A445
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 14:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402CE6E95E;
	Tue, 12 Oct 2021 12:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD7F6E91A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 12:04:37 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CBK7GF030208; 
 Tue, 12 Oct 2021 12:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cyQRBNNWf6ULNxD/eXbR7miBqR1cyoS0gM4EmSzSVEw=;
 b=CI8DQYKhxTGZj7RYMTuG3oly3VuSYe6QGv7kaVjelrN1NF1Dk1aUiaF8ft2gDCGC+rUn
 bvzshP7WvDVjuNGcJ5Wcj+P0Ti9TSChG0S4CdhxnrWkYlFXNbup2AiASaHUyhHC3Z4fR
 nbZikUBqFnqP3CQtlAubOSY2YLOOHVr8npIHt2HNXP2BbkVoBSsW3yVggxOQNFMO5pHl
 Y4YAw8vs2YBjB3hOJzeAm9zriKk5RHdVpX/3nKCVEghFrwjFSIzVdhzMDlyAWKanTNn3
 T/OLvtO9oepS3vCreDuW3Db+55XVF1nzF7l7VMG5t1E5IiVZb+fyCrA78Hz4GM1ULBza Pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmv41mufe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 12:04:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CBt4Bx018584;
 Tue, 12 Oct 2021 12:04:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3030.oracle.com with ESMTP id 3bkyv8rmhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 12:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLUHUmSpS+iboeVma5aZikkBpylvcbZafaP9ebezssOHGvIPQbL5X7N7qNtwxXXsvzMjiuWw8YQr1PxRhTG5NzF6ZlgfAYGPUylw+5CkYYMnwYIaTD//RHdYxuI1rDCeaxgzXw3shaAUiMB/xKau+9zYdza5WPNpRZiDwTpwOed36JsPtmUz8h14hfyvYBsDHQO95gvzHQw1yktjz21aP/ZoJIvLZlDp+JJ9/YD4KU8ipnhJYhkq/InbD712egTB8TGWhVLR54240rp1JrV5nzsEkZqMU6XUclkfVOzGWvGtbwHE4s805bfQls8MWDK/+449cy5VscAxuYnUYObSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyQRBNNWf6ULNxD/eXbR7miBqR1cyoS0gM4EmSzSVEw=;
 b=hFN1/iPQh7KtLV4b4pNy9ePCsGUsQFohlxwGwpyBP6Wrg9imRkddspfiYS6dvZHGYp1M7ReCI6t5nEUYJX5fKR3qMWpLl3waSe83kUxMn66M7FwbjWVkrfEQcToa+PUjdG8VbfdWo0qyyX1Dj8NWm0P6dpf2NXAcKB4wD9KkNDarq/Ok0SgT6o1wDurM3bvRON44OlmbR+t16yAWrQmZ0IiDMx7OcYwC1x2K0RPFvj7sY8LYfVB2D5pkdRN+EfdxEUtzmDkrOT+5nz7mS6SPp+tt3XnJjPozcNCVoo85nBD27DTDpj89UI/0cUzD9WAHkvgyGvN7WLjB2NSpMazakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyQRBNNWf6ULNxD/eXbR7miBqR1cyoS0gM4EmSzSVEw=;
 b=qAf6jh5GGiwVexPLq9qVgNKjYySrIh+6wwsW/DRvUQYkmLKLKhYM23HUA7jD9jVVExBYTZDMS6mabVN9WmREV/d9HJDfbjWGtGADdhrrR54P6byk8Oqik+/rxsAMFfUFpoQL4p2uvD1StPVhfQKbL07VTIc+i4ick2mOUMSzty4=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH7PR10MB5829.namprd10.prod.outlook.com (2603:10b6:510:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 12:04:16 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::958c:1aaa:ad5:40c6]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::958c:1aaa:ad5:40c6%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 12:04:16 +0000
Subject: Re: [PATCH] drm/panel: olimex-lcd-olinuxino: select CRC32
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20211012115242.10325-1-vegard.nossum@oracle.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <f12a25ab-cd9c-2831-323a-328b49352349@oracle.com>
Date: Tue, 12 Oct 2021 14:04:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211012115242.10325-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::6) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
MIME-Version: 1.0
Received: from [192.168.1.13] (86.217.161.200) by
 PR3P191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.16 via Frontend Transport; Tue, 12 Oct 2021 12:04:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dd2666e-82aa-417a-989d-08d98d7869e5
X-MS-TrafficTypeDiagnostic: PH7PR10MB5829:
X-Microsoft-Antispam-PRVS: <PH7PR10MB5829CC86DCCE07ECF362B4A097B69@PH7PR10MB5829.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8uV+wbtdivkEWWMNbCnU7PhOle4A5g2g4j+JDbxXbwgnzYTg0NBuHQhcBVY6rDTVWG/XmzziL7cQPOYP4hY92G7n0QMsu+IfUv/NoHyTpIN+IIIyBpTLs8vyYiARM6FtrLPiiDd4xlYQsaGIimtTIC1FFM3WdGX+aqTIKjO9gSfxXEDZsL3c1AaB43kdwYTOnKKk+m6QBYAYmbaDfXtvY3t1ILrxUecr8XWhWPYI+e+lIC3L6tJezOxswq8gbSMR1FCeEHbniL/Nwh0SF3APRgS+/M68+SS5payAZ7yxRjZIRzdgsVQUWybm0xJBN/TiH5jcW1/SJJZ7i69WRobuGTB9sXESiPDncy2W5k440r9FvJ2BZ61ISr9z9vHS8nEnH0+PYQ9fO2zGaTmrgHldU0w/MPHFAE4+QEVicXsj0Si+4HZc3eF1oxoUVU1O3Ys/I537sDn4DtPGTpA/DmoU0QNvLYyP66uqD906CKkSul2ZEYlhuY8rmmWsgibAAXszlaYW/6Of+SciIUvitb82sljN08VPL3UJlE69X9nXDzkDyhEIuCPho5blevlvA08qhdnh9f1KmVRavsfZ320/1XSmj6rJ8xd0/4xvN5xTWzSlmXTtFFFLo8AE7K4+5PNiH8nrMSXqyXFwa4Y5qE1WRrXyZurr/rdNuGxa2zaitPZdLNKplRUJgWqXjWETnhJhE53cEQZEGdR+vVRFhKXDrwZHmvqi3+n7abvc7auGqQEfURHFJoXeHvbQSOtdZfTXEoeM8rrTQcRPM6r6Y+mSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(316002)(2906002)(26005)(6916009)(5660300002)(16576012)(186003)(8676002)(44832011)(38100700002)(38350700002)(6486002)(31686004)(6666004)(36756003)(8936002)(2616005)(86362001)(83380400001)(4326008)(66946007)(31696002)(52116002)(66556008)(956004)(66476007)(53546011)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTAvSGVlQmxrOGQyT0Uva1dCWG1Sa3h1eFNBT2oyaDByYTBGVnFyN1JqQ0ZK?=
 =?utf-8?B?UXI1cDVyYUtuRmUzWmdnUk1sdWd5akdwcVZJYUI3VjkrZjBSeTJPUDlnLzJN?=
 =?utf-8?B?VDM4akExbkZ3OHdJR2doSzZoMm5QbGhKRjdKR3JHYWU4ekhuUE5ydHVlTHZK?=
 =?utf-8?B?dFpSc0lqaGd0WTNMV0oxNkkreTVYUXRnSXVmaU5jYUxKMjNJdjF6VXlybFVD?=
 =?utf-8?B?TzgrNVJLV0VVemtlSndaZVJEd2MxcUFxNHMrT1pBZGVLZUc3azR0QzZrYjVi?=
 =?utf-8?B?cVF5ai8vNVpLVjdJeG5QOG8zRnpERFZlVm90RkIxZ0NiMUh5SzZyMCtpaE1i?=
 =?utf-8?B?SkhiemY4UjRIRVRPWWtPbmdYbjVrOE1rSytxN3IvWDd5a0xDKzBBZzh2eFA5?=
 =?utf-8?B?amlDQ2tuNGxFUENBeFNsSDhSTDIwZlRJMHVrc1RGbWxpakY5cE5pbkUxYlpp?=
 =?utf-8?B?Z3RmemJlR1JFSU9rTmtGNjB5azhWaTg4ZWR0YmZVckl4bW04eGM0enhrVGdJ?=
 =?utf-8?B?TTJCSTRaRUp5RE4vZ2E3dmRLb2JnTzFONkMzbXVDem13L1pjK21HK24vMzdO?=
 =?utf-8?B?cUNvOTRmWFRVL0JGQmh1NkZiUFU3c2xXNDR4azVzYUdOb3RFVFo3d29HSEFz?=
 =?utf-8?B?VmVreEJDdDNRZlRQUWFaa1I4OERpWXluZExqR3FtZDkrUjVzMGJjK2IrY1dr?=
 =?utf-8?B?WmVxTE5ZbUgrdWN2N3pENWppeXoyUUZmMlJRaXh1c2pOZTlNUSs0ZFFaeWw1?=
 =?utf-8?B?K0ZrcXNneGRCTldJamxmMXFrQUxheHJFRGx3QW5DS0I2V0Z4VzdhMDg2Qlh4?=
 =?utf-8?B?V1J4SU9oUEdhOG4vME5nK0I0dTRwVUExeFFob3FTbG4yOW1oaFpNZTdOeXVV?=
 =?utf-8?B?eVBDOHRRbW8rVFN1T1JDOXN2QStOYVFKK0lxVFNKQm9xb0ZZUVlTc01YbVdF?=
 =?utf-8?B?Q2FsYk5VNXBSMzREOHE2QjNwQW5yN3g1QWI5aStJNWY5VS9HTHY2STRjbXUx?=
 =?utf-8?B?NFZYUytXejhtbHNab08xNFdXbE1VOVp3NTBRVUJCeXFjVTRGQzZZWEk1L2I5?=
 =?utf-8?B?NDdoWGdVUThNUVcwcHJLQTNydyt4eE1XR3dTT1JncVZwZEYrekxDRWw4V01q?=
 =?utf-8?B?YWVaRmY4dEl3RjVQeXdSam9PNFlNZFQrWHFHakl3TGNtazFkRnJXcy85anlJ?=
 =?utf-8?B?djVBZXIvczE3U3FKc0swZWNoTDFrY0FONm9HVGlkdVNBNlBSdEJ4NkdXVCsv?=
 =?utf-8?B?MkRaQ0VOV0tTQmUxc1VHTk16Vk93S1BxT1I4eXNHcFU2ek8xd1QxZ000WExK?=
 =?utf-8?B?QmxnRjljMU9nOVQwNTZlbjBOdXM1N0pveVZWSnBFOWIvN1pkblNqeHM2bVdZ?=
 =?utf-8?B?RXFpczFKMUdjSnJJNVlYM0pXVUlOcXBoUVU1TDRTeVFGK2cxMm9UMUZuKzBv?=
 =?utf-8?B?eVJsaEtocjg3Yk5SakNIWXNJQWd4M0RLRXZwYmQ2aE4yN0I3U09BMTNHVlpJ?=
 =?utf-8?B?b2tReGhodHZPTDFmWVRWMWN3a3JJUFRJUFpxMmE1d01pMkx2a3lidFdVVElC?=
 =?utf-8?B?Qmk1QzROSkpsSjJZU0I0ZnQvRHphL3EyZkpOdXdGdUMzOXlsOW5QMzdxMUlC?=
 =?utf-8?B?QjRRRTZqaUhWTzB6ZFVzaXNReDVlNnFDcHVYSjBWQ245VFpjemZ0MVVSRnlE?=
 =?utf-8?B?UlNZL1hpR0xFbjI5bDREQURVWkFGeXVqQWhWQ09lSktIaXE4RER0T0x0b1dZ?=
 =?utf-8?Q?Qg2XfFh+qM834KTkBYXJ4KqpfKMlJoH0D/+WN+R?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd2666e-82aa-417a-989d-08d98d7869e5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 12:04:16.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaU5TVoRyJ1u+Q1tVNio6po4lN71bllfzwc0dPFT4Bsyee3lQRoH2xNaMnIhON9RTxqBU9y/xo1aviTru9OEZKeaQxIhKR9xzWzjwNqi6XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5829
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120070
X-Proofpoint-ORIG-GUID: uqzR8VMdQaMH8iwCwLZ0vxk_YxjwBy6s
X-Proofpoint-GUID: uqzR8VMdQaMH8iwCwLZ0vxk_YxjwBy6s
X-Mailman-Approved-At: Tue, 12 Oct 2021 12:21:56 +0000
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

Hi Thierry,

I tried sending the patch below to Stefan Mavrodiev <stefan@olimex.com>
(listed in MAINTAINERS for DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS)
but it bounced with "No such user at that domain".

Will you take the patch and/or update the MAINTAINERS entry?

Thanks,


Vegard

On 10/12/21 1:52 PM, Vegard Nossum wrote:
> Fix the following build/link error by adding a dependency on the CRC32
> routines:
> 
>   ld: drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.o: in function `lcd_olinuxino_probe':
>   panel-olimex-lcd-olinuxino.c:(.text+0x303): undefined reference to `crc32_le'
> 
> Fixes: 17fd7a9d324fd ("drm/panel: Add support for Olimex LCD-OLinuXino panel")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index beb581b96ecdc..418638e6e3b0a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -295,6 +295,7 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
>  	depends on OF
>  	depends on I2C
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	select CRC32
>  	help
>  	  The panel is used with different sizes LCDs, from 480x272 to
>  	  1280x800, and 24 bit per pixel.
> 

