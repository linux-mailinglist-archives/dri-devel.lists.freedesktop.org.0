Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3E71260B
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 13:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AF910E1C5;
	Fri, 26 May 2023 11:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664A10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 11:54:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f601c57d8dso5746385e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685102077; x=1687694077;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKY9RDouPe5qG4SnbDRojs5Tlqk3KgD8Z7Lu4mQT5lo=;
 b=R4Mb1kzy83Go51VgDSixFpo/PmLRpGGH7cxpTvj8StLpHt+iXNSxOzsNJS4iiv4kQW
 DJF8Jc6KNbAsWWGTWTf+iG79aFs3t35LTGjzzo5WirHF+4PigBdcPHwjIlNxSLhkQxl+
 i9pgX2S8H4H8vUco7h83xhW1uc84j7blicq4Oc3SOUHjwO3+YJCuHZMLHEJ9NjFwhCHU
 KaWSUuaRZ+LunJ/T5xNdEv7fsiCMeTSE9Q28OxlK0pGnEOFqgkCsVULfs9Ed7E9rUhaG
 4B6NNXgNF4MUB9D2WdpVQ70az9Bbe0HjfEhAc62+M/ja9fkCqzLQDiLN4bpKkA7CFnDO
 8L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685102077; x=1687694077;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKY9RDouPe5qG4SnbDRojs5Tlqk3KgD8Z7Lu4mQT5lo=;
 b=Y1kALe55XFFLIXAUlSLprbV05QpDGuBjFQqyX3l7V/1Ec2sDGiQLX94oYIKCA4gp/V
 zZHX1u69qp74NoYPju1vyp+KcIRSIxEUUWwI7JycRXxMNZbN2U7RQo3BKDhOfhXd7fh6
 bTAXWRu2of0dQtEUfdpnvv/B3qj2T2LNAUCWCniebmsyoMvT5+E5zcGkVGg0EKrBf9JL
 UBvBW/S4taSCARg8mbCkH8bW4y2Z+5gsInTIH0SnQ7AjlERQUnDX3XNwk20GxbLfmAEV
 hZqhue8JeRRQasWHz3qn0mOUH+NadcD9zqOTo8KZUqeQeFYcDdB9KFRutBg4P0uQtrc9
 csJQ==
X-Gm-Message-State: AC+VfDzaHVBvAc0otA77qmTj5R9xaaYqcwh6zM3A6kS2h5jgsxQOVdpG
 hhqDTwBFXt3RldFZ+42t1S7SV2Kw/hqFLwunWG4=
X-Google-Smtp-Source: ACHHUZ7DzzKMzMBUrdByokAfaHCY7e0MLgApx4GqyGVAQfUB+qoRo/P5yqnZNpDvB7bjIHO+moLwHQ==
X-Received: by 2002:a05:600c:348c:b0:3f5:a54:9f97 with SMTP id
 a12-20020a05600c348c00b003f50a549f97mr4464351wmq.0.1685102077556; 
 Fri, 26 May 2023 04:54:37 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l6-20020a7bc446000000b003f6d564db48sm4571274wmi.4.2023.05.26.04.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 04:54:36 -0700 (PDT)
Date: Fri, 26 May 2023 14:54:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim.Qu@amd.com
Subject: [bug report] vga_switcheroo: set audio client id according to bound
 GPU id
Message-ID: <d9d30cbd-02cf-4d28-b64f-c761958681b4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Jim Qu,

The patch 4aaf448fa975: "vga_switcheroo: set audio client id
according to bound GPU id" from Jul 17, 2018, leads to the following
Smatch static checker warning:

	drivers/gpu/vga/vga_switcheroo.c:378 vga_switcheroo_register_audio_client()
	warn: impossible condition '(id < 0) => (0-u32max < 0)'

drivers/gpu/vga/vga_switcheroo.c
   362  int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
   363                          const struct vga_switcheroo_client_ops *ops,
   364                          struct pci_dev *vga_dev)
   365  {
   366          enum vga_switcheroo_client_id id = VGA_SWITCHEROO_UNKNOWN_ID;
   367  
   368          /*
   369           * if vga_switcheroo has enabled, that mean two GPU clients and also
   370           * handler are registered. Get audio client id from bound GPU client
   371           * id directly, otherwise, set it as VGA_SWITCHEROO_UNKNOWN_ID,
   372           * it will set to correct id in later when vga_switcheroo_enable()
   373           * is called.
   374           */
   375          mutex_lock(&vgasr_mutex);
   376          if (vgasr_priv.active) {
   377                  id = vgasr_priv.handler->get_client_id(vga_dev);
   378                  if (id < 0) {

The vga_switcheroo_client_id enum is treated as unsigned in this context.

   379                          mutex_unlock(&vgasr_mutex);
   380                          return -EINVAL;
   381                  }
   382                  /* notify if GPU has been already bound */
   383                  if (ops->gpu_bound)
   384                          ops->gpu_bound(pdev, id);
   385          }
   386          mutex_unlock(&vgasr_mutex);
   387  
   388          return register_client(pdev, ops, id | ID_BIT_AUDIO, vga_dev,
   389                                 false, true);
   390  }

regards,
dan carpenter
