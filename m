Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4538242B9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 14:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A6E10E44C;
	Thu,  4 Jan 2024 13:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD2310E482
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 13:35:39 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55559e26ccfso653846a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 05:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704375338; x=1704980138; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QlTdxmJc1LJpiwXMzE1LA/PI1fQvNFWLYu1RIDM0FWU=;
 b=S76sHLm8gDkR7d4e59+GDIe+4Z3SzLOLX3g4k4GrHrbNIfKtlq+8i4X7SYsUQTbECy
 EObGgciHFJ3IbGpZtnxHj9Ec0cYpMROAqxHdn+o6FC8SgQQzkil4n7Ep0no2DjcKzfdy
 gQXCL34wD+doA+4sZPjsTZOhj7Hk2v67t4kS7DI84hftAruhB3tnSWt/rO0XUXR3myXZ
 FvlYh+7wFrbeST7Paxe4veoPUUkl4WiMYoULe1b/DqGMf8aCeDonB1DUcaUYKPU0L7q/
 Eqt49X1sle2CkXM6NHZp9LrgF1RCnKOhT8bvG3LEU3CVUKIuF0AolThqFAtYf0v2/Xwo
 s/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704375338; x=1704980138;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QlTdxmJc1LJpiwXMzE1LA/PI1fQvNFWLYu1RIDM0FWU=;
 b=rBpTjM3e/lYcBAUbfM8J3BsoUISE5xUaXSOBa6pR9b5ngpHePoaikD1zx5ObEgCZLk
 D/imD3Yfu7+C3H8DRSy5aikur5Td5FLXAhEaBitMd+DPh4Nl+d1g3pw9AnyEvMWOzYB1
 CZhXVr4TuCL+564Zb5DepIqmJQt1rWSVCOB+sZaSjrT3nye7x5+Ft9jETU7FBmzP0naR
 ZqeqM1/M/50oxdgxf9ySQTVswA7J5upSLP0qShDOscd/UYcPZu5/zfr6Hf5usj7EpIL7
 Nx+DDsf1w4N53sDXYffMetDgyh7HVOslLIJpvbAhfUK5ZYcFH0u9nfp1gZtukhVcNG6P
 yIsQ==
X-Gm-Message-State: AOJu0YzJIwhij9D5/u1buP6WC0DggdyHwuFHp79osU8Sdi0SU87f+jhD
 evskoPxGdEjPWyWAgoExEXK6us8LAWAcyg==
X-Google-Smtp-Source: AGHT+IHMQnP5nPnZL25dSXJbOkBn1+tPl5vWMJXLdofQNJ5Liyp+hP1HnmA4SIJ5fKncgrWMkXA5rg==
X-Received: by 2002:a50:d71c:0:b0:557:176d:d425 with SMTP id
 t28-20020a50d71c000000b00557176dd425mr24812edi.65.1704375337867; 
 Thu, 04 Jan 2024 05:35:37 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056402020f00b005534057c72dsm18702497edv.18.2024.01.04.05.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 05:35:37 -0800 (PST)
Date: Thu, 4 Jan 2024 16:35:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Subject: [bug report] drm/xe: missing access_ok() in ioctl
Message-ID: <3447de91-1b41-4d15-bd6e-87631b86e374@moroto.mountain>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Matthew Brost,

The patch dd08ebf6c352: "drm/xe: Introduce a new DRM driver for Intel
GPUs" from Mar 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/xe_exec.c:163 xe_exec_ioctl()
	warn: calling '__copy_from_user()' without access_ok()

drivers/gpu/drm/xe/xe_exec.c
    102 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
    103 {
    104         struct xe_device *xe = to_xe_device(dev);
    105         struct xe_file *xef = to_xe_file(file);
    106         struct drm_xe_exec *args = data;
    107         struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
    108         u64 __user *addresses_user = u64_to_user_ptr(args->address);
    109         struct xe_exec_queue *q;
    110         struct xe_sync_entry *syncs = NULL;
    111         u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
    112         struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
    113         struct drm_exec *exec = &vm_exec.exec;
    114         u32 i, num_syncs = 0;
    115         struct xe_sched_job *job;
    116         struct dma_fence *rebind_fence;
    117         struct xe_vm *vm;
    118         bool write_locked;
    119         ktime_t end = 0;
    120         int err = 0;
    121 
    122         if (XE_IOCTL_DBG(xe, args->extensions) ||
    123             XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
    124             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
    125                 return -EINVAL;
    126 
    127         q = xe_exec_queue_lookup(xef, args->exec_queue_id);
    128         if (XE_IOCTL_DBG(xe, !q))
    129                 return -ENOENT;
    130 
    131         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
    132                 return -EINVAL;
    133 
    134         if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
    135                          q->width != args->num_batch_buffer))
    136                 return -EINVAL;
    137 
    138         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
    139                 err = -ECANCELED;
    140                 goto err_exec_queue;
    141         }
    142 
    143         if (args->num_syncs) {
    144                 syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
    145                 if (!syncs) {
    146                         err = -ENOMEM;
    147                         goto err_exec_queue;
    148                 }
    149         }
    150 
    151         vm = q->vm;
    152 
    153         for (i = 0; i < args->num_syncs; i++) {
    154                 err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
    155                                           &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
    156                                           (xe_vm_in_lr_mode(vm) ?
    157                                            SYNC_PARSE_FLAG_LR_MODE : 0));
    158                 if (err)
    159                         goto err_syncs;
    160         }
    161 
    162         if (xe_exec_queue_is_parallel(q)) {
--> 163                 err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
    164                                        q->width);

It's been a long time since I've ever reported one of these.  The
difference between copy_from_user() and __copy_from_user() is that the
underscore version means we called
access_ok(addresses_user, sizeof(u64) * q->width) already.  In olden
days if we were doing multiple copies then it was nice to avoid doing
duplicate checks on the fast path.

I don't think we have called access_ok() here.  At one point Linus said
that if we don't call access_ok() in the same function then it should
just automatically considered a bug.  We used to have a lot of issues
with this back in the day...  I don't think anyone took Linus too
seriously on this though.

    165                 if (err) {
    166                         err = -EFAULT;
    167                         goto err_syncs;
    168                 }
    169         }
    170 
    171 retry:
    172         if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
    173                 err = down_write_killable(&vm->lock);
    174                 write_locked = true;
    175         } else {

regards,
dan carpenter
