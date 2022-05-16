Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676D527E55
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549B810E02B;
	Mon, 16 May 2022 07:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7910E078
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652685221; x=1684221221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ry9fillzxTcJhIM/nohUC0k407HyaSI/XvzlwJioUbU=;
 b=zf3s+eUHBxKmOv8QFUAlFgnlHQ6Nt94nfkVEQ7OzIv9eJ4JntlFnkC9i
 rNopsdWO2kb149Ibsa4oFKhNYjeIJmkwIXwlQBGNttfgcLEuwaPQNip3t
 UnPLhu+9tV/XEOJ5uhTJkmetUxUBrBIGn7IF9k0OWJwxEYsC3wcw+ZiBt E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 16 May 2022 00:13:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 00:13:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 00:13:40 -0700
Received: from [10.214.30.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 16 May
 2022 00:13:38 -0700
Message-ID: <779aaa3e-45cf-6eab-23f1-bbbc0d3f0c69@quicinc.com>
Date: Mon, 16 May 2022 12:43:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [bug report] dma-buf: call dma_buf_stats_setup after dmabuf is in
 valid list
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <YoH0AcDvgowmOot4@kili>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <YoH0AcDvgowmOot4@kili>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: "T.J. Mercier" <tjmercier@google.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

++ Adding Christian

On 5/16/2022 12:19 PM, Dan Carpenter wrote:
> Hello Charan Teja Reddy,
> 
> The patch ef3a6b70507a: "dma-buf: call dma_buf_stats_setup after
> dmabuf is in valid list" from May 10, 2022, leads to the following
> Smatch static checker warning:
> 
> 	drivers/dma-buf/dma-buf.c:569 dma_buf_export()
> 	warn: '&dmabuf->list_node' not removed from list
> 
> drivers/dma-buf/dma-buf.c
>    538          file = dma_buf_getfile(dmabuf, exp_info->flags);
>    539          if (IS_ERR(file)) {
>    540                  ret = PTR_ERR(file);
>    541                  goto err_dmabuf;
>    542          }
>    543  
>    544          file->f_mode |= FMODE_LSEEK;
>    545          dmabuf->file = file;
>    546  
>    547          mutex_init(&dmabuf->lock);
>    548          INIT_LIST_HEAD(&dmabuf->attachments);
>    549  
>    550          mutex_lock(&db_list.lock);
>    551          list_add(&dmabuf->list_node, &db_list.head);
> 
> Added to the list
> 
>    552          mutex_unlock(&db_list.lock);
>    553  
>    554          ret = dma_buf_stats_setup(dmabuf);
>    555          if (ret)
>    556                  goto err_sysfs;
> 
> Goto
> 
>    557  
>    558          return dmabuf;
>    559  
>    560  err_sysfs:
>    561          /*
>    562           * Set file->f_path.dentry->d_fsdata to NULL so that when
>    563           * dma_buf_release() gets invoked by dentry_ops, it exits
>    564           * early before calling the release() dma_buf op.
>    565           */
>    566          file->f_path.dentry->d_fsdata = NULL;
>    567          fput(file);
>    568  err_dmabuf:
>    569          kfree(dmabuf);
> 
> dmabuf is freed, but it's still on the list so it leads to a use after
> free.

This seems to be a false positive. On closing the file @line no:567, it
ends up calling dma_buf_file_release() which does remove dmabuf from its
list.

static int dma_buf_file_release(struct inode *inode, struct file *file) {
	......
	mutex_lock(&db_list.lock);
	list_del(&dmabuf->list_node);
	mutex_unlock(&db_list.lock);
	......
}

> 
>    570  err_module:
>    571          module_put(exp_info->owner);
>    572          return ERR_PTR(ret);
>    573  }
> 
> regards,
> dan carpenter
