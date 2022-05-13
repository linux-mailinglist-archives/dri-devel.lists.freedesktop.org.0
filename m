Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD53525FAC
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 12:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819F710E1F3;
	Fri, 13 May 2022 10:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0779F10E1F3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 10:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWSUT5XAdmX9wR1Lw1/rWJfW+kv6rwFzW9Y3bSkkP9FevlY5UpVlSkaoSwJhzfZLOc2xmE+e8EtqF6USAlUJ70CB4fiQMj7OvMNB+MwvUXQzZlmvilQQwgezJTJjGAOqzpwy/5GarDSN8qdCsRbaSyrqAj4jqCoGbtoOa/5wPNe0cWZAJGk+AYd/NFVeon372nSoOqx3nwv9hbkQBMssOxvDfXTL9ORa5/VauV8032zFzwKjN56DH27e9HwmxANmlQVWCUON5gkzOFmPZx2ESz0Sh8oVDIVC+NSEaPqWcGDBYJ3ZcddBNCEjNXrrjigqWrFdixfh8hYSizSc0GD0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpM4pK8TlCwIK/zxdCb0M3Pa6YxlkujeJ8k9Je8S6Yg=;
 b=cgeiWlKEZ8VFMepnIZkUuQFCkVi/ydh4KissbvmhZUo3Bg2Ox3NzkGPbiOMqHP8PjufigdDSN/p9q/SPgIwW93fsFtZP+i9MP2E1ePR7o/zDiXrNry8kb2QXSsZmU2oM7DbfiWbkaxPvmFh97QWtEx84emITXKq8g4wRz21Vfhomm9Igp/xbG8/JWz7SPtZnihh6H1l3xChCeQTty3fKshu80oXJ9/XpTxcQRhRy6r0Q6R9wPSxlfARfwgC90rrDqW8eHg8/oH+Y513TWhNl1P9/01mkEQmRkNJPjND+K4JjaBa7wTayHMmWG6t57jKGYS4CzYeFdLC4sCdzsPORTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpM4pK8TlCwIK/zxdCb0M3Pa6YxlkujeJ8k9Je8S6Yg=;
 b=VB/AT0mKK62G+12iEWksmmUKDhkCXLu7t5gpMH7RpiVLUOPuU0lhiNYA1+TCI2/yAqKk9IJ6o3q5NBJZH5EQ0R/6UuNd4k0Qo3+0Y6hvmnWd5Xl/oXvWw/ug7xLJ8hVJXOzGAQR/7gz1S0MGHjXWKIbZQBRVXZiViyi81cfRQIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3561.namprd12.prod.outlook.com (2603:10b6:5:3e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 10:29:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 10:29:57 +0000
Message-ID: <0071e117-1d91-b086-7cb1-976b2a1c3498@amd.com>
Date: Fri, 13 May 2022 12:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
 <Yn4u0AG8iC33S3jO@kroah.com>
 <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0149.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a54ec990-dd16-4d9a-7b28-08da34cb8695
X-MS-TrafficTypeDiagnostic: DM6PR12MB3561:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB35618FFF00A215CD8C8DEE8A83CA9@DM6PR12MB3561.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fiviNrok3ZFUxYqOmfeLzJtqdeh+ApSVRI0uJj2bWZOteFmqhhhtATRiyoM4lmlZXmxUg3DpG79X/6qzxAqG8LOLEQ2i9/ShUyMTpNRG9dECAIqG9dABKV/eI3YpSjZ8u0CgQ4DEE9w02mBTKDSLO1EIssWp89DJkEQ32lNuWY1ZNX5yeVyiQ/oluyluUfh1K/C9abVi/dxtdXSYVSXeS+7hFDiLEQfXmona7U+Ny0QQ/9tjc/ZmtnF0bzhF4EoP8SBaS5B8cyIWhvldJ5zRHXvfwEcmtqBg7TEZsQzkFAN4gNCwK21g2IDbTgBwbcpIJ9RBmpY9gnNKq8/xEJTHx+fVzR4UMVsVDlkoA6ZMZfzmxXPgflZITtT45+8KOD3oDgomrEIYa3DAW13x6H4z2YXzeRL/YEXIjMGQcXpZ0tOxl9+0UV05YoRiCG5eY89Z8aEm7NpDqov3r6hHRIdSQLMazcATwin0UqZd+NMTbRkkjNyOQriOZ4B4i1Z1ECRtRab1KlzMYXYZS0D658T3xAEXE6RoHtUV8KLEAGNpemrju57H4ZaCygEzFYKLUddNPpSN5xJ9ZXqcWfyInLkI3RvsQ6QFMXtZvbO2l6NVmGfApn0IQJVq6P49vh4TNqi6TjezcJsPT/2lab1HQNNS2idtmhA/WdwnYKiyvHgmncHUmFqkGt1d0aS0aDfazyONHubnpJHSFslUxwrE1W+AYws1Wr1odMEyThciNZVGfrkEnwBX9J7aqWGHJv3mBfkd/9T+0xc7t3ZCV6j2NjgeUQ/p3Vm10QmLhkm9uS21jOfTNVoE3fRHutzqOK/QOJyd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(4326008)(8676002)(66556008)(66946007)(66476007)(83380400001)(6486002)(45080400002)(508600001)(53546011)(8936002)(186003)(2616005)(31696002)(86362001)(110136005)(6666004)(6512007)(966005)(6506007)(2906002)(38100700002)(36756003)(5660300002)(31686004)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDdLd3kyN1pNMWhFa2xFcjJNZWxxbUROeWo3WkRna1NCYlhTUlI0V2VBNnJh?=
 =?utf-8?B?ekE4S0dYU3NOa2ZXZ3BWT3IydEgxY0E0Tkl6YVBjUjVCRDUyZkNYSHY1WVBO?=
 =?utf-8?B?VVArOEhmQVFRMVJ6bWpBQzFkaStYQmhwMGtxWSt6L0M2RXk2S3cvOWVOckxs?=
 =?utf-8?B?MEJGOWdHdFkrQmJwczk4L01FL0poK2lwa0grRUxBL1RpRkV0VHJScUw2bVY0?=
 =?utf-8?B?cGtZejRtM1BlSURmQTdrcy9OVmJWTDRORWJUTGFVS0l1ZER0QzViSEppWDVj?=
 =?utf-8?B?Mkp2TUhUcG9yWEVpMXQybHczeE9pZkFRU1ovRFpNaVQ4SVVUQ0hhNnZweDBn?=
 =?utf-8?B?SWhQSStZUCtuUzg2bVhyQlVYa0tiNGlPdDdRcXlMQ1RIYStSZnlwbzdWbkwr?=
 =?utf-8?B?NHBoeUlMd2lFQUY3TTFDV0cyczgzcnpZQUxMZDVSMUVWWWtCSzNJKzJZTCt4?=
 =?utf-8?B?dERlYWY0d1NsRWdFb2daTVl2Q2RnQ09kK0g0OFhxaS84dXcwblN2ajFIQ1Zy?=
 =?utf-8?B?NWV1YzZkR2h2YmRldWJRcllZcXl0NmFDd3VDd0s4UENlS3pDdnlDU29rdWY4?=
 =?utf-8?B?aWJLNzMreUhuNlZaU2RuV1pGSnh1UGhTTFhOVnd2MUlNZDNYaXFVMDE1bXZE?=
 =?utf-8?B?QlBtV0xSSDlrcUJQcitqZDdib1NPVFY5RjYza2xiSU9FUTROc3QvZk9SVHdL?=
 =?utf-8?B?OFNDQmNHdWliaTVLRnBYemRKL1o3WEl5ZU15cjdMNEhEbm9wdG9rNVFNVGdZ?=
 =?utf-8?B?SVZGVldOTEoxaWNmL1NNYjA3LzdDbm4xNzYzTHJydzlPeU9LSmFIenRZWE5Q?=
 =?utf-8?B?cG5QcVpHdUNzNUZNSFVTb2JqVHhYcGZVVnl3WGFzcUFLWElCOFNDeXdsTDRa?=
 =?utf-8?B?N055bXJDamhlRE1FZENycUdRMVhiTU9YMHJ1aWl5S2t2a3RuaWR4OGF0OHV3?=
 =?utf-8?B?M3hXZVkrVG4ycXJuUGxXK3FDQk1HYTE0SlR6T0llRVQxZnVJd1pocE9tNFVZ?=
 =?utf-8?B?MUI3M1k1c25YekdZVUlzWU51c25vbmV5bUNMeDFPNFFzbHcxVUc4Q2F0NG5i?=
 =?utf-8?B?OThQY0ZzVDNJWEJVUVhUL1E5UVJLR1dER082b3p6cVpiSG0vSFI2azRxRENW?=
 =?utf-8?B?Zkp6UXUwdWplSU9kUlBpMlpCVi9yQlpoaXQybzNFRHhPeFVHcnZqUWhyYy82?=
 =?utf-8?B?MWlZd2FXSnNhcE5od0E3SjhWOW9ramp3N1pSUCtvOUJ6Rk1teXFwaTNhRFFI?=
 =?utf-8?B?S1U3TEVxMmxUQVhoVDVpT0JzRTRlVTlIYVBKNVFBa1hwOXVESTdZTnBFSUtx?=
 =?utf-8?B?L204S3ZBU1RubXdaR3dDaG9JUWNnOGN4aUNkUjMwZC9FOGVLM3VVTHBweTMz?=
 =?utf-8?B?Q0p3NlNEQTNaZDhyVGhFNDFFZC93bkJlNjY0U0g2YkJMLzliNHlwcitQU1hq?=
 =?utf-8?B?YlA0eW5Nc2xCcWlPWlJxeFhaaXh0bHpBdnRCWk5XTllMdno1Y25jL2k4K0hZ?=
 =?utf-8?B?bTFhVk5SS1VaRHRjc0EyUEdHZWRDeGlEWDlDVmtndW9yTERER1pzeW9rRVJn?=
 =?utf-8?B?MksySC9TaFZkdm5ma0pkaTl2UENvVEpvdVVPREFCdHNPbktKWTJQbEEvZWph?=
 =?utf-8?B?MGsxRzgyNDNkWnVwazRaZG5QMEJaMTJNaXRJemRsMGw3N1RTYVJPWVFqZWFr?=
 =?utf-8?B?K0gxSTVzTmY4T3ZFbjBleXNIVCtWOUVZVGJtQVh6Vjg0OHlSOXpQQnZRVXNp?=
 =?utf-8?B?ZDNka1ZTUTNZVStxV290WXFWVGkwMlVNY3dTZjZIbHQ5UzZ2b0hoNldDL1Bx?=
 =?utf-8?B?UEZLRmRDYlFqYVgzUHE4cGRTT0VSSkswZGlDdUpnNm5VRGtSeklDWFJFcEdM?=
 =?utf-8?B?SXd5S3g0bFZtZVphV3ltWjFyMDVabHdZQlVDZEtpcENNVFVqb3FlcUpIdVIr?=
 =?utf-8?B?N3JmWXl0RGYxYVhYSEhNMnNLUE41MmRtT05ERGF6UFQ3L08yR2RFbUdkbkpt?=
 =?utf-8?B?UnZ1TU5KZVIwLzlWQzBGNVBRaEhhZlBnTzNHLzZvQk9GSldJdWJtODlYM2Rz?=
 =?utf-8?B?MkQ4elRKSno0eGd6SW50WmcwNUR5MEhjbE1OVjNRYWhsOWFhTllzSUdCQmFu?=
 =?utf-8?B?WngzbitkNnpQMjFCWGJTQ2ZTMEZiVmR1WEMyUzh1Yk95elJWT25KellzdHhq?=
 =?utf-8?B?K1p0eW9GSG9QbDBoaTd4NFA2TVEyTXZ2NDBZdG1rTEVERnNRVE1FR2RhMnJV?=
 =?utf-8?B?c1NUYVkyNkNmaG5FM1E0eDdHL3lJcC9ZbzFVU3JhWm91b0s2dkZlSkRwLzNw?=
 =?utf-8?B?TW9IdzFuYVdzWHNIKzdsbkdLMWtNMzl0cCtHK3haYUNPa042eGJvM3hlS0s4?=
 =?utf-8?Q?3StzVOMqE6Hfkm+0CPz9e0f72phwMiBnhm2bA+AOlI5Y/?=
X-MS-Exchange-AntiSpam-MessageData-1: vjy6VE5dR9X6xw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54ec990-dd16-4d9a-7b28-08da34cb8695
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 10:29:57.1357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3w/C8jtSEiPSMaOCumiF1ffqhjARXm2OsCyTnDdoUbL5bnRL3naUsbeGFSG26jz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3561
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, hridya@google.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.05.22 um 12:18 schrieb Charan Teja Kalla:
> On 5/13/2022 3:41 PM, Greg KH wrote:
>>> Reported-by: kernel test robot <lkp@intel.com>
>> The trest robot did not say that the dmabuf stat name was being
>> duplicated, did it?
>>
> It reported a printk warning on V2[1]. Should we remove this on V3?

We only add the kernel test robot is report when it found the underlying 
problem and not just noted some warning on an intermediate patch version.

> @Christian: Could you please drop this tag while merging?

Sure, I don't have much on my plate at the moment. But don't let it 
become a habit.

Going to push it upstream through drm-misc-fixes now.

Regards,
Christian.

>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F202205110511.E0d8TXXC-lkp%40intel.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C00e38dfb74fb4fe48b8408da34c9ee77%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637880339170888363%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=yH%2FBg2Fjq2ohEFKLgw2CcYEeHiUfgPLlsJaRnt9cKLo%3D&amp;reserved=0
>
>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index a6fc96e..0ad5039 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -407,6 +407,7 @@ static inline int is_dma_buf_file(struct file *file)
>>>   
>>>   static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>>>   {
>>> +	static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
>>>   	struct file *file;
>>>   	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
>>>   
>>> @@ -416,6 +417,13 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>>>   	inode->i_size = dmabuf->size;
>>>   	inode_set_bytes(inode, dmabuf->size);
>>>   
>>> +	/*
>>> +	 * The ->i_ino acquired from get_next_ino() is not unique thus
>>> +	 * not suitable for using it as dentry name by dmabuf stats.
>>> +	 * Override ->i_ino with the unique and dmabuffs specific
>>> +	 * value.
>>> +	 */
>>> +	inode->i_ino = atomic64_add_return(1, &dmabuf_inode);
>>>   	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
>>>   				 flags, &dma_buf_fops);
>>>   	if (IS_ERR(file))
>>> -- 
>>> 2.7.4
>>>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Thanks for the ACK.
>
> --Charan

