Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848D30F00B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 11:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5686EC8B;
	Thu,  4 Feb 2021 10:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 04 Feb 2021 09:55:19 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191286E02B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612432519; x=1643968519;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=gd7QA4AWB7FA4i5Kbfgza5KDDdkv0s+nDA7bVYRKKI8=;
 b=YJ0sxJYSXtOBKgOa6bFm4bjx0OnFP/gpRdDIFSGU4jZbxmw3QM4ae8X1
 4D9oDDUGyckFPQXdKbjOoxm4fMPE6/loOliZEChWXFYtquNzm6aZrRzs/
 dNflJRK2xQJ1gYnwEh+hT8zdDNuAVSAc7Ofpk9DBIUUsde/29ePz2ptYq
 o69gXRq97OibV/Tnp2mvtNspYezWzY5YYXaEiwIF6sev7VzjcCSsI0Gxi
 ScBSyHTyDaDjIjLvkrsGd5Rjeg1ig03bXDpd6BFCeHXhOsUWQvU7Gk1Q8
 RZusLH+0nvOFNWEmsA/VPOWwPMnoZJfXxSgN3BRZQzp7NZZTp8AxMCIv5 Q==;
IronPort-SDR: D1USvyEpXz+XNiou1v1kYGw5c/j+epb3+MiIwpBLoj4p2Zl5HovtYDbGx8zTYQbJRvAqOazaLI
 415rJYzbYxbQtlLqjcXDbQB03hYCnav4o/T5wt+69bR75tzND4gHMi8nKNB6KUZH5NL1ayl7cK
 jSbKKsou6HhFJ+73J+HB4t0n5/ez2tUvTvqM/Q60UgB+ieHUD5yyV5wCATSINQmbuY2rrOAEH+
 MOFazQMrdwvdRD5fPwTdcCv5QvxWaBPfjqV9g6B2N+EWpW5dv1TZKhvY8OdjIpyD0SWCZ8Ccxl
 YIU=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="160290653"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 17:48:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGgoeZ4mwyBp8/v9WGEwK3FoeMRuq+P5lr6IBNW6WrOgBx4BFcJIzMkJy1lYh2zjiWhlIRvDmpYyEBediDOVl29m2QElwMnH+LlZeeIFk+7SEdTOLt6rso39QSwUeC8QM+M7imJehGS50kdb3IkvxStxUOHJ31AuovAwUFnR6kOL0pwCJgUirhQfnPNhFvsmLvJXKv7pqlzj7SDaRqDXBqbK9FtO/L/sMLUwDc19oThRcR826vH1mxJJ49fUSM6j5erfz17SHp+917rcrVvp1y6qMDwnYd3iIaqfzKmoeCBYzdB4kNjjXBQs4oR4TkVfmC404Jy7y94MQrcKvQ5sgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHJVeHbj65VgWAEISnlLC1Sr4NGh+kUSEccQWdH1flM=;
 b=RbX53Ts3f/bzytKOZTwcmA0oQ4Ol3zDRXHD4HyOr44cUAxJiTgjzAmOQDOkQIcv0lsb8ldr6tSql7A1m4PKB3lyJeanfKKMupQNNQg9Fra5JGNRuI/dgHBdJbiglSk4NYnumUKnMjRHN2wG0dYkW88wUoAc+hW46M6JJ4hOfIagaQIiKblJftHqDfAV6lmlqQGuHcQii/MvVuR701HpT+Aw3jJq9y/zNwg3jdRkankGnqd/YbboJ7of1GP4NCkBxAHNvoXA1ubulT+jnocXlLhPg5A5QcQBhJbPGRchztCkW+D7yBIptOpt6fJr3dSZXk4Oa/anFH+ZHxn2VHyyYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHJVeHbj65VgWAEISnlLC1Sr4NGh+kUSEccQWdH1flM=;
 b=L/SPFNcvndGVBwdBPJ4EBJpSJcwLsOz6SGgeXHRQzI1ZQOUCnG4uIJW7lHVFKJ/XsB0Q/5fa82xtrKNfh/7JkgodWqy03TvKioBvD/W8f7cD0Mg44jMB4/FpqRORRFS69bWjR72P0jjwsoUthZYyBMVLDdXV9Mx03xUk4nHb0Z0=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4544.namprd04.prod.outlook.com
 (2603:10b6:805:ac::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 09:48:07 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::c19b:805:20e0:6274]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::c19b:805:20e0:6274%7]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 09:48:07 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Yang Li <yang.lee@linux.alibaba.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
Subject: Re: [PATCH] scsi: lpfc: Remove unneeded return variable
Thread-Topic: [PATCH] scsi: lpfc: Remove unneeded return variable
Thread-Index: AQHW+sijbzLBfbFR2kKjDSIaB//4Lg==
Date: Thu, 4 Feb 2021 09:48:07 +0000
Message-ID: <SN4PR0401MB3598D8B3DDA6C490AA934DE19BB39@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <1612424125-91111-1-git-send-email-yang.lee@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:1542:e101:51f:6b4a:2171:57e6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d3afe46-ab52-46f2-0509-08d8c8f1f983
x-ms-traffictypediagnostic: SN6PR04MB4544:
x-microsoft-antispam-prvs: <SN6PR04MB45446D4B6ED14E46C792580A9BB39@SN6PR04MB4544.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4HB5RzVY7oLUyTyzku79oHw2GfhIU8143LXRN1LCXqEwDcocwV50a5k09eJGB+gGtl/hLqPf6neUNmXJ8FR6xUVpVG1EuQxmyeEJGycKXSujkEqabbq1Ssq0d84ejMdWPfS8e3+asZGUeeZv5dawRv9YN9kBr1HCmuhzu1nK7o37V1LlW+8ZkSdqUz+eyZ/aWs8oBu1tSrgllsc80S0rJApIN/ZdSm6rxENtcKdv7Twvv+tzXlI7ytg65Ett/71WWaJD0gssis/7xFSwXuY3cKPbR/TsPIDITX8Ki80e6sc+BNIyPiyXmepCNdlKCWrQF2lI+fS1i09bGCeDPtKq59PC6AsQDeZdzMNsu3jfHbJYpWWOypRfyU8fejtn0/8AtIcyJR293I3ijA+81qieuAqt0jHEhaiftuz81Ys11nqlYlAI1oUfLECrqPfuS8U9gZlWfFNwqkis92ZktSim+89fYrVnODvn+wILkN2v1hK4KXJZKAv7EeL5xo8BxTovyWYuhtLE9JdGEjkKI3Vxaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(5660300002)(86362001)(6506007)(55016002)(8936002)(64756008)(478600001)(66476007)(8676002)(66446008)(33656002)(66556008)(91956017)(76116006)(7696005)(52536014)(71200400001)(7416002)(54906003)(53546011)(316002)(4326008)(186003)(83380400001)(66946007)(2906002)(9686003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SE6Wl1AvA8aEx+i6RTMA3eqLzkYOA/b8rn0vli6g4ViQ3T39wS5iT8Zq64Ob?=
 =?us-ascii?Q?v0NQwJ3/p3HQGGRxp6dNeNzkDwknfbu3FEEk0+TYT8LX7+//R27M6MLgH/dh?=
 =?us-ascii?Q?39N6BGz8vB7mVr7hDA5y/PGCMtsYFrgemP8tnlXNoI+xAgk5ft7D/XW+dmFR?=
 =?us-ascii?Q?tc29/4u3UsMy9BxTUdMWMMtPydmbdTJ/eb/BTkwd5u+TM1A9+vWMxQCfbfZD?=
 =?us-ascii?Q?x/UDwMFJmTxE3gSd8TBo5GNrCNKvqaIYv93zAkuA+vcXjX9a12tWDl2QFfn8?=
 =?us-ascii?Q?B2H75GLCxg3ofdB0LO9YJv5G3vn8uBjljZ7LsE0ynjYq4ENJm4EmXXNBUwrX?=
 =?us-ascii?Q?qCs/AjZbo+P17G3PiipwEx1OaRncAiGgM/8l2YOOJwkD4JwP29X70bFhvZWx?=
 =?us-ascii?Q?YmApW+ynBS8ODae1+mCgW5X6On7spgMEoSTpeLQdKPXMox6d5xFqLLYrzO/1?=
 =?us-ascii?Q?LsOKS+ew0n0aZE7AxMG0dRC/mIfhtb2BnCji3kThbc/m1afHuVLjLzOGNmVL?=
 =?us-ascii?Q?6/2abUfhGB7x+31Dhp2DvESoZk0saYtb6CDLmAfp8jDr2yAgDMLPQwssK975?=
 =?us-ascii?Q?bLJOT2nFOdCucCutCCTxUEH2BHJGHQtBzUEEYdTSMc/Dr7RGbI4Ztk6oXAnr?=
 =?us-ascii?Q?oomc99gEmJH6jrhYBVbnPRTSz2ZRD3Xzb07P1wJP0+I8swEYD9wlYCinMIbo?=
 =?us-ascii?Q?Pjt5VhVOeX1KTrfyIo6q0/tCI5/VSNTNLI4gjcfl8EndQN5jFGWJ6ydrnLlL?=
 =?us-ascii?Q?7Av3nfdiiku2EsD8m2r33U5N2sE2emK5OjUUf/T00U1ZpU8JasEL4FKVQi8O?=
 =?us-ascii?Q?zvhwgV1KLIizdtXFwzlAIvPFkZZFzJr9U7kXP/0oaPYv3BIXnMyxp9Cf5kEq?=
 =?us-ascii?Q?DL1+9hp2+8SPxlAitf0iTn7pgd34ooWLkiF0aiiz0AdSnm/QXOEh0lvHd8F4?=
 =?us-ascii?Q?6zPJGJ3jk2MyhloXxMI6hQyjnDKx0pzzy1mNpFUGhLnfau3viXwrK7+G0hPz?=
 =?us-ascii?Q?rkx2+69fbjlu+yusvM/DfCYvjFl8BVCI3q8O9Rny8KKZTnDYl3OXAqbv4LOC?=
 =?us-ascii?Q?O3qWCIj1oyKhqt40N4VonYvq/KvhHPTNd+4AY1twgFz0XnPM9XahpRPMo+mK?=
 =?us-ascii?Q?v+iXw/PkuWyn6a4E5wwONFV6XWyd9JGw/A=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3afe46-ab52-46f2-0509-08d8c8f1f983
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 09:48:07.0492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhALLuAvTikj9BwS2dN5/SlBFdKxC+wo4wGmh6bM2U9tlWBwo7Fua2c7Rmc1GDdk0pn7qOxMwPpLHVogh3QCsJqPSXqmoF5yk+YfRLKYb7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4544
X-Mailman-Approved-At: Thu, 04 Feb 2021 10:00:38 +0000
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
Cc: "dick.kennedy@broadcom.com" <dick.kennedy@broadcom.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "james.smart@broadcom.com" <james.smart@broadcom.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/02/2021 08:37, Yang Li wrote:
> This patch removes unneeded return variables, using only
> '1' instead.
> It fixes the following warning detected by coccinelle:
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/scsi/lpfc/lpfc_sli.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
> index 95caad7..31f97f6 100644
> --- a/drivers/scsi/lpfc/lpfc_sli.c
> +++ b/drivers/scsi/lpfc/lpfc_sli.c
> @@ -3376,7 +3376,6 @@ struct lpfc_hbq_init *lpfc_hbq_defs[] = {
>  			  struct lpfc_iocbq *saveq)
>  {
>  	struct lpfc_iocbq *cmdiocbp;
> -	int rc = 1;
>  	unsigned long iflag;
>  
>  	cmdiocbp = lpfc_sli_iocbq_lookup(phba, pring, saveq);
> @@ -3501,7 +3500,7 @@ struct lpfc_hbq_init *lpfc_hbq_defs[] = {
>  		}
>  	}
>  
> -	return rc;
> +	return 1;
>  }
>  
>  /**
> 

I suppose this is in 'lpfc_sli_process_sol_iocb()'. It's return 
value doesn't get handled either:

                case LPFC_SOL_IOCB:                                              
                        spin_unlock_irqrestore(&phba->hbalock, iflag);           
                        rc = lpfc_sli_process_sol_iocb(phba, pring, saveq);      
                        spin_lock_irqsave(&phba->hbalock, iflag);                
                        break;                                                   
[...]                                                       
                }                                                                
                                                                                 
                if (free_saveq) {                                                
                        list_for_each_entry_safe(rspiocbp, next_iocb,            
                                                 &saveq->list, list) {           
                                list_del_init(&rspiocbp->list);                  
                                __lpfc_sli_release_iocbq(phba, rspiocbp);        
                        }                                                        
                        __lpfc_sli_release_iocbq(phba, saveq);                   
                }                                                                
                rspiocbp = NULL;                                                 
        }                                                                        
        spin_unlock_irqrestore(&phba->hbalock, iflag);                           
        return rspiocbp;
}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
